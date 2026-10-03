---
layout: page
title: 아카라 토큰 자동 갱신 키트
permalink: /kits/aqara-token-renew/
description: Home Assistant aqara_bridge 의 30일 토큰을 만료 전에 스스로 갈아 끼우는 PowerShell 스크립트. 빌더 일지 11화의 자가수리 장치에서 집 정보를 뺀 공개판(MIT).
---

빌더 일지 11화 「[스마트홈 자동화, 새벽 4 시에 우리 집이 스스로 토큰을 갈아 끼운다](https://blog.naver.com/dreamsjs1/224430262079)」에서 소개한 자가수리 장치를 누구나 쓸 수 있게 정리한 것입니다.

## 내려받기

- **[aqara-token-renew.zip]({{ '/kits/aqara-token-renew/aqara-token-renew.zip' | relative_url }})** — 아래 파일 전부
- 낱개: [scripts/aqara-token-renew.ps1]({{ '/kits/aqara-token-renew/scripts/aqara-token-renew.ps1' | relative_url }}) · [config/selfrepair.local.example.ps1]({{ '/kits/aqara-token-renew/config/selfrepair.local.example.ps1' | relative_url }}) · [LICENSE (MIT)]({{ '/kits/aqara-token-renew/LICENSE' | relative_url }})

처음에는 반드시 `-DryRun` 으로 돌려 보세요. 판단만 하고 아무것도 바꾸지 않습니다.

---

{% include_relative README.md %}
