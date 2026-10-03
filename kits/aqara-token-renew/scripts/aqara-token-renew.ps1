# =====================================================================
#  Aqara token auto-renew for Home Assistant (aqara_bridge)
# ---------------------------------------------------------------------
#  WHY:  aqara_bridge's access_token expires every 30 days. When it does,
#        every Aqara device behind Home Assistant goes "unavailable".
#
#  WHAT: daily check -> only when expiry is near, refresh + patch + restart
#        -> report to Telegram. Never touches HA unless refresh succeeded.
#
#  USAGE:
#    -DryRun    : decide + print only. No refresh, no patch, no restart.
#    -Force     : renew even if expiry is far away (manual override)
#    (no flag)  : normal scheduled run
#  EXIT: 0 ok/no action, 1 error, 2 refresh failed (HA untouched),
#        3 renewed but integration not loaded, 4 patch failed (HA on old token)
#
#  CONFIG: ..\config\selfrepair.local.ps1  (copy selfrepair.local.example.ps1)
#  NOTE:  ASCII-only source. Windows PowerShell 5.1 reads UTF-8-without-BOM
#         as the local codepage and would corrupt non-ASCII text, so Korean
#         Telegram strings are built from unicode code points at runtime.
# =====================================================================
param(
  [switch]$DryRun,
  [switch]$Force
)
$ErrorActionPreference = "Stop"

$root    = Split-Path $PSScriptRoot -Parent
$cfgFile = Join-Path $root "config\selfrepair.local.ps1"
$logDir  = Join-Path $root "logs"
if (-not (Test-Path $logDir)) { New-Item -ItemType Directory -Path $logDir -Force | Out-Null }
$logFile = Join-Path $logDir "aqara-token-renew.log"
$RENEW_WITHIN_DAYS = 5          # renew only when expiry is within N days
$CE_PATH = "/config/.storage/core.config_entries"

function Log($m) {
  $line = "{0}  {1}" -f (Get-Date -Format "yyyy-MM-dd HH:mm:ss"), $m
  $line | Add-Content -Path $logFile -Encoding UTF8
  Write-Output $line
}

function K($codes) { -join ($codes | ForEach-Object { [char]$_ }) }
$KO = @{
  ok_title   = K @(0xAC31,0xC2E0,0x0020,0xC644,0xB8CC)                       # renewal done
  ok_next    = K @(0xB2E4,0xC74C,0x0020,0xB9CC,0xB8CC)                       # next expiry
  fail_title = K @(0xAC31,0xC2E0,0x0020,0xC2E4,0xD328)                       # renewal failed
  fail_note  = K @(0x0048,0x0041,0xB294,0x0020,0xAC74,0xB4E4,0xC774,0xC9C0,0x0020,0xC54A,0xC558,0xC74C,0x002E,0x0020,0xC218,0xB3D9,0x0020,0xAC1C,0xC785,0x0020,0xD544,0xC694)  # HA untouched. manual action needed
  warn_load  = K @(0xD1A0,0xD070,0xC740,0x0020,0xAC31,0xC2E0,0xB410,0xC9C0,0xB9CC,0x0020,0xD1B5,0xD569,0xC774,0x0020,0xC548,0x0020,0xC62C,0xB77C,0xC634,0x002E,0x0020,0xD655,0xC778,0x0020,0xD544,0xC694)  # token renewed but integration not loaded. check needed
  err_title  = K @(0xC2A4,0xD06C,0xB9BD,0xD2B8,0x0020,0xC624,0xB958)         # script error
  patch_fail = K @(0xD328,0xCE58,0x0020,0xC2E4,0xD328,0x002E,0x0020,0xC0C8,0x0020,0xD1A0,0xD070,0xC774,0x0020,0xB0A8,0xC544,0x0020,0xC788,0xB294,0x0020,0xD30C,0xC77C)  # patch failed. file that still holds the new tokens
  manual     = K @(0xC190,0xC73C,0xB85C,0x0020,0xB123,0xC5B4,0xC57C,0x0020,0xD568)  # apply manually
}

function Send-Tg($text) {
  if (-not $TelegramToken -or -not $ChatId) { Log "WARN: telegram not configured"; return }
  try {
    $payload = @{ chat_id = $ChatId; text = $text } | ConvertTo-Json -Compress
    $bytes   = [Text.Encoding]::UTF8.GetBytes($payload)
    Invoke-RestMethod -Method Post -Uri "https://api.telegram.org/bot$TelegramToken/sendMessage" `
      -ContentType "application/json; charset=utf-8" -Body $bytes -TimeoutSec 30 | Out-Null
  } catch { Log ("WARN: telegram send failed - " + $_.Exception.Message) }
}

# ---- Aqara Open API helpers --------------------------------------------
# Sign rule from the Aqara Open API docs: join the header values, append the
# app key, lowercase the whole string, MD5 it (32 hex chars).
function Get-AqaraSign($accessToken, $appId, $keyId, $nonce, $ts, $appKey) {
  $s = "Appid=$appId&Keyid=$keyId&Nonce=$nonce&Time=$ts$appKey"
  if ($accessToken) { $s = "AccessToken=$accessToken&$s" }
  $md5 = [Security.Cryptography.MD5]::Create()
  $h   = $md5.ComputeHash([Text.Encoding]::UTF8.GetBytes($s.ToLower()))
  return ([BitConverter]::ToString($h) -replace '-','').ToLower()
}

function Invoke-Aqara($intent, $data, $appId, $appKey, $keyId, $accessToken) {
  $chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789".ToCharArray()
  $nonce = -join (1..16 | ForEach-Object { $chars | Get-Random })
  $ts    = [string][int64](([datetime]::UtcNow - [datetime]"1970-01-01").TotalMilliseconds)
  $sign  = Get-AqaraSign $accessToken $appId $keyId $nonce $ts $appKey
  $h = @{ "Content-Type"="application/json"; "Appid"=$appId; "Keyid"=$keyId;
          "Nonce"=$nonce; "Time"=$ts; "Sign"=$sign; "Lang"="ko" }
  if ($accessToken) { $h["Accesstoken"] = $accessToken }
  $body = @{ intent = $intent; data = $data } | ConvertTo-Json -Compress
  return Invoke-RestMethod -Method Post -Uri $ApiUrl -Headers $h `
           -ContentType "application/json" -Body ([Text.Encoding]::UTF8.GetBytes($body)) -TimeoutSec 25
}

# ================= main =================
try {
  if (-not (Test-Path $cfgFile)) { throw "config not found: $cfgFile" }
  . $cfgFile
  foreach ($v in "EntryId","ApiUrl","HaToken") {
    if (-not (Get-Variable $v -ValueOnly -ErrorAction SilentlyContinue)) { throw "config value missing: `$$v" }
  }
  if (-not $HaContainer) { $HaContainer = "homeassistant" }
  if (-not $HaVolume)    { $HaVolume    = "homeassistant_config" }
  if (-not $HaImage)     { $HaImage     = "ghcr.io/home-assistant/home-assistant:stable" }
  if (-not $HaUrl)       { $HaUrl       = "http://localhost:8123" }
  if (-not $BackupDir)   { $BackupDir   = Join-Path $root "backups" }

  Log "=== run start (DryRun=$DryRun Force=$Force) ==="

  # --- 1. read current entry from HA config_entries ---
  # docker exec output is decoded via the console codepage, which mangles
  # non-ASCII device names and breaks the JSON. Copy the file out and read
  # it as UTF-8 instead.
  $ceTmp = Join-Path $env:TEMP ("ce_" + $PID + ".json")
  docker cp ($HaContainer + ":" + $CE_PATH) $ceTmp | Out-Null
  if (-not (Test-Path $ceTmp)) { throw "cannot copy config_entries out of the container" }
  $raw = Get-Content $ceTmp -Raw -Encoding UTF8
  Remove-Item $ceTmp -Force -ErrorAction SilentlyContinue
  if (-not $raw) { throw "cannot read config_entries (is the HA container running?)" }
  $ce = $raw | ConvertFrom-Json
  $entry = $ce.data.entries | Where-Object { $_.entry_id -eq $EntryId }
  if (-not $entry) { throw "aqara_bridge entry not found (check `$EntryId)" }

  $expStr = $entry.data.expires_datetime
  $expDt  = [datetime]::ParseExact($expStr, "yyyy-MM-dd HH:mm:ss", $null)
  $daysLeft = [math]::Round(($expDt - (Get-Date)).TotalDays, 2)
  Log ("current expiry={0}  days_left={1}" -f $expStr, $daysLeft)

  # --- 2. decide ---
  if (($daysLeft -gt $RENEW_WITHIN_DAYS) -and (-not $Force)) {
    Log ("no action needed (renew only within {0} days)" -f $RENEW_WITHIN_DAYS)
    Log "=== run end ==="
    exit 0
  }
  Log "renewal needed"

  if ($DryRun) {
    Log "DRYRUN: would refresh token, patch entry, restart HA. nothing changed."
    Log "=== run end (dryrun) ==="
    exit 0
  }

  # --- 3. refresh token (never touch HA if this fails) ---
  $d = $entry.data
  $res = Invoke-Aqara "config.auth.refreshToken" @{ refreshToken = $d.refresh_token } `
           $d.app_id $d.app_key $d.key_id ""
  if ($res.code -ne 0) {
    $msg = "[SelfRepair] Aqara $($KO.fail_title) (code=$($res.code) $($res.message))`n$($KO.fail_note)`nexpiry: $expStr (D-$daysLeft)"
    Log ("REFRESH FAILED code={0} msg={1} - HA untouched" -f $res.code, $res.message)
    Send-Tg $msg
    exit 2
  }
  $newAccess  = $res.result.accessToken
  $newRefresh = $res.result.refreshToken
  $expiresIn  = if ($res.result.expiresIn) { [int]$res.result.expiresIn } else { 2592000 }
  Log ("refresh OK (expires_in={0})" -f $expiresIn)

  # --- 4. backup + patch config_entries (HA must be stopped) ---
  $stamp = Get-Date -Format "yyyyMMdd_HHmmss"
  # config_entries holds every integration secret in plaintext -> keep backups private
  if (-not (Test-Path $BackupDir)) { New-Item -ItemType Directory -Path $BackupDir -Force | Out-Null }
  $bakName = "config_entries_$stamp.bak.json"
  $raw | Set-Content -Path (Join-Path $BackupDir $bakName) -Encoding UTF8
  Log "backup saved: $bakName"

  $newExp = (Get-Date).AddSeconds($expiresIn).ToString("yyyy-MM-dd HH:mm:ss")  # space format! (not ISO T)
  $py = @"
import json
p = r'$CE_PATH'
d = json.load(open(p, encoding='utf-8'))
n = 0
for e in d['data']['entries']:
    if e.get('entry_id') == '$EntryId':
        e['data']['access_token']     = '$newAccess'
        e['data']['refresh_token']    = '$newRefresh'
        e['data']['expires_in']       = $expiresIn
        e['data']['expires_datetime'] = '$newExp'
        n += 1
json.dump(d, open(p, 'w', encoding='utf-8'), ensure_ascii=False)
print('PATCHED', n)
if n == 1:
    import os
    os.remove(__file__)   # the file holds the new tokens; keep it only when patching failed
"@
  $pyPath = Join-Path $env:TEMP "aqara_patch_$stamp.py"
  $py | Set-Content -Path $pyPath -Encoding ASCII

  docker stop $HaContainer | Out-Null
  Log "HA stopped"
  docker cp $pyPath ($HaContainer + ":/config/_selfrepair_patch.py") | Out-Null
  $patchOut = docker run --rm -v ($HaVolume + ":/config") --entrypoint python3 `
                $HaImage /config/_selfrepair_patch.py 2>&1
  Log ("patch result: {0}" -f ($patchOut -join " "))
  # A wrong volume name makes docker run create an empty volume, the patch
  # fails, and PowerShell 5.1 does not stop on a failed docker command. HA
  # would then come back on the OLD token (still valid for a few days) and we
  # would report success while Aqara may already have retired the old refresh
  # token. So verify the patch, and on failure restart HA and say so.
  if (($patchOut -join " ") -notmatch "PATCHED 1") {
    docker start $HaContainer | Out-Null
    Log "PATCH FAILED - HA restarted on the old token; new tokens kept in /config/_selfrepair_patch.py"
    Send-Tg "[SelfRepair] Aqara $($KO.patch_fail): /config/_selfrepair_patch.py`n$($KO.manual)"
    exit 4
  }
  docker start $HaContainer | Out-Null
  Log "HA started"
  Remove-Item $pyPath -Force -ErrorAction SilentlyContinue

  # --- 5. verify (poll up to ~2.5 min for the integration to load) ---
  $hh = @{ Authorization = "Bearer $HaToken" }
  $state = "unknown"
  for ($i = 1; $i -le 15; $i++) {
    Start-Sleep -Seconds 10
    try {
      $entries = Invoke-RestMethod -Uri "$HaUrl/api/config/config_entries/entry" -Headers $hh -TimeoutSec 10
      $st = ($entries | Where-Object { $_.entry_id -eq $EntryId }).state
      if ($st) { $state = $st }
      if ($state -eq "loaded") { break }
    } catch { }
  }
  Log ("verify: aqara_bridge state={0}" -f $state)

  if ($state -eq "loaded") {
    Send-Tg "[SelfRepair] Aqara $($KO.ok_title)`n$($KO.ok_next): $newExp"
    Log "=== run end (success) ==="
    exit 0
  } else {
    Send-Tg "[SelfRepair] Aqara $($KO.warn_load) (state=$state)`nbackup: $bakName"
    Log "=== run end (renewed but not loaded) ==="
    exit 3
  }

} catch {
  $e = $_.Exception.Message
  # never let a parser error dump core.config_entries (secrets) into the log
  if ($e -and $e.Length -gt 300) { $e = $e.Substring(0,300) + ' ...[truncated]' }
  Log ("ERROR: {0}" -f $e)
  try { Send-Tg "[SelfRepair] Aqara $($KO.err_title): $e" } catch {}
  exit 1
}
