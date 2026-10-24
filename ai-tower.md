---
layout: page
title: AI 타워 자세히 보기
permalink: /ai-tower/
description: "AI 직원들이 일하는 AI 오피스(AI 타워)를 다섯 장으로 자세히 봐요. 마지막 장의 아침 3줄 브리핑부터 오늘 바로 해 보세요."
sitemap: true
---

<style>
.copybox { position: relative; margin: 1em 0; }
.copybox button { position: absolute; top: 8px; right: 8px; padding: 4px 10px; border: 1px solid #0f766e; border-radius: 6px; background: #ecfdf5; color: #0f766e; cursor: pointer; font-size: 14px; }
.copybox pre { padding-top: 2.4em; white-space: pre-wrap; }
</style>
<script>
function copyBox(btn) {
  var t = btn.parentNode.querySelector('code').innerText;
  navigator.clipboard.writeText(t).then(function () { btn.textContent = '복사됐어요'; setTimeout(function () { btn.textContent = '요청문 복사'; }, 1500); });
}
</script>

## 1. AI 타워, 한눈에 보기

![1장](/assets/images/ai-tower/guide-1.png){: style="width:100%;max-width:540px;border-radius:12px"}


AI가 초안을 만들고, 나는 방향과 공개를 정해요.

| 단계 | AI가 하는 일 | 내가 정하는 일 |
| --- | --- | --- |
| 요청·아이디어·자료 | 내용을 정리해요. | 무엇을 맡길지 정해요. |
| 기획 | 자료를 모으고 할 일을 나눠요. | 목표를 정해요. |
| 제작 | 글·영상의 초안을 만들어요. | 원하는 모습을 정해요. |
| 검토 | 내용을 살피고 빠진 곳을 찾아요. | 수정·공개를 정해요. |
| 기록·메모리 | 자료와 결과를 남겨요. | 다음에도 쓸 내용을 정해요. |
| 인프라 | 도구 연결을 도와줘요. | 쓸 도구를 정해요. |
| 라운지 | 아이디어를 모아요. | 해 볼 것을 골라요. |

수정이 필요하면 제작으로 돌아가요. AI는 실행하고, 나는 방향과 결과를 결정해요.

전체 만드는 법은 4편에서 · @gwichan_ai

## 2. 하루가 이렇게 흘러가요

![2장](/assets/images/ai-tower/guide-2.png){: style="width:100%;max-width:540px;border-radius:12px"}


AI가 만든 것을 보고, 내 손으로 공개를 결정해요.

**아침 — 오늘 할 일을 짧게 받아요.** AI가 브리핑을 정리하면, 나는 먼저 할 일과 방향을 정해요.

**낮 — AI가 글·영상 초안을 만들어요.** 블로그 글은 AI가 써서 임시저장해요. 릴스도 AI가 초안을 만들어요. 나는 완성된 초안을 받아 봐요.

**저녁 — 확인하고, 단추를 눌러요.** 블로그는 내가 [발행] 단추를 눌러요. 릴스는 GPT와 제미나이가 점수를 매겨요. 80점이 넘어야 내 폰에 [올리기]가 와요. 나는 내용을 보고 올릴지 결정해요.

마음에 들지 않으면, 수정을 맡기거나 보류해요.

전체 만드는 법은 4편에서 · @gwichan_ai

## 3. AI 셋이 한 팀이에요

![3장](/assets/images/ai-tower/guide-3.png){: style="width:100%;max-width:540px;border-radius:12px"}


이 AI 타워에서는 이렇게 일을 나눠요.

- **클로드 — 조립·사실 확인:** 흩어진 작업을 이어 붙이고, 내용이 맞는지 살펴요.
- **GPT — 디자인·검토:** 보기 쉽게 다듬고, 빠지거나 어색한 곳을 찾아요.
- **제미나이 — 사람 맘을 움직이는 문구:** 읽는 사람이 이해하고 공감할 말로 다듬어요.

왜 셋을 같이 쓸까요? 한 AI가 만든 것을 다른 AI가 다시 살피게 해요. 서로 다른 눈으로 보면 놓친 곳을 찾는 데 도움이 돼요. 그래도 마지막 확인과 공개 결정은 내가 해요.

전체 만드는 법은 4편에서 · @gwichan_ai

## 4. 준비물은 이런 도구예요

![4장](/assets/images/ai-tower/guide-4.png){: style="width:100%;max-width:540px;border-radius:12px"}


각 도구가 무슨 일을 맡는지부터 보면 돼요.

| 도구 | 맡는 일 |
| --- | --- |
| Claude Code | AI에게 만들거나 고칠 일을 맡겨요. |
| n8n | 정해 둔 순서대로 도구들이 이어서 일하게 해요. |
| 텔레그램 단추 | 폰으로 결과를 받고, 승인 여부를 정해요. |
| 구글 드라이브 | 자료와 완성된 결과물을 모아 둬요. |
| 집 서버 한 대 | 연결해 둔 일을 실행할 컴퓨터예요. |

오늘의 첫 연습은, 쓰고 있는 AI 대화창에서 시작해요.

전체 만드는 법은 4편에서 · @gwichan_ai

## 5. 오늘, 하나만 해 봐요

![5장](/assets/images/ai-tower/guide-5.png){: style="width:100%;max-width:540px;border-radius:12px"}


AI에게 매일 아침 3줄 브리핑을 받아 보세요. 아래 요청문을 복사해서 AI 대화창에 넣어 보세요.

<div class="copybox"><button type="button" onclick="copyBox(this)">요청문 복사</button><pre><code>매일 아침 내가 붙여 넣는 메모를 보고,
오늘의 브리핑을 세 줄로 정리해 주세요.

1. 오늘 먼저 할 일
2. 확인하거나 결정할 일
3. 놓치지 말아야 할 일정

모르는 내용은 추측하지 말고 물어봐 주세요.</code></pre></div>

요청문 아래에 오늘 메모를 붙여요.

> 예: 오늘 할 일: 초안 읽기 / 결정할 일: 제목 고르기

먼저 직접 붙여 넣고 받아 보세요. 매일 자동으로 받는 연결은 다음 단계예요.

전체 만드는 법은 4편에서 · @gwichan_ai
