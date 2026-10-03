# Copy this file to selfrepair.local.ps1 (same folder) and fill in your values.
# Keep selfrepair.local.ps1 private: it holds tokens. ASCII only (PowerShell 5.1).

# --- required ---
$EntryId  = "PUT_YOUR_AQARA_BRIDGE_ENTRY_ID_HERE"      # HA config entry id of the aqara_bridge integration
$ApiUrl   = "https://open-kr.aqara.com/v3.0/open/api" # Aqara Open API endpoint of your account region
$HaToken  = "PUT_A_HOME_ASSISTANT_LONG_LIVED_TOKEN_HERE"   # used only to read the integration state after restart

# --- optional: Telegram report (leave empty to log only) ---
$TelegramToken = ""
$ChatId        = ""

# --- optional: your Docker setup (defaults shown) ---
# $HaContainer = "homeassistant"
# $HaVolume    = "homeassistant_config"
# $HaImage     = "ghcr.io/home-assistant/home-assistant:stable"
# $HaUrl       = "http://localhost:8123"
# $BackupDir   = "D:\private\ha-backups"   # backups contain every integration secret in plaintext
