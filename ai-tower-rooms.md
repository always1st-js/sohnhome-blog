---
layout: page
title: AI 사옥 방 안내 · 따라 만들기
permalink: /ai-tower/rooms/
description: "AI 사옥의 방마다 무슨 일을 하는지, 평소 쓰는 AI 앱으로 여러분 버전을 시작하는 법, 사진 한 장으로 드론 오프닝 영상 만들기. 복사해서 바로 쓰는 요청문 7개."
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

> **릴스 2편 보고 오셨나요?** 방마다 AI 직원 한 명, 여러분 버전은 이렇게 시작해요.  
> 제 AI 사옥은 집 컴퓨터(서버) 한 대에 여러 도구를 붙여서 돌아가지만, **첫걸음은 평소 쓰는 AI 앱(챗GPT·클로드·제미나이)만으로** 시작할 수 있어요.  
> 아래 요청문은 그대로 복사해서 쓰면 돼요. [ ] 칸만 여러분 내용으로 채워 주세요.  
> 맨 아래 보너스에는 릴스 첫 장면 같은 **드론 오프닝 영상을 사진 한 장으로 만드는 법**도 있어요.

## 1. 내 일을 방으로 나누기

사옥을 짓기 전에 먼저 할 일은, 내 일을 성격에 맞게 묶는 거예요.
일주일 동안 하는 일을 두서없이 적어서 AI에게 주면, 4~6개 방으로 묶어 줘요.

<div class="copybox"><button type="button" onclick="copyBox(this)">요청문 복사</button><pre><code>아래 [내가 일주일 동안 하는 일]을 살펴보고, 따로 맡길 수 있는 'AI 직원 방' 4~6개로 묶어 주세요.

방마다 이렇게 적어 주세요.
1. 방 이름 (예: 총괄기획, 콘텐츠, 일정관리, 살림)
2. 이 방이 맡을 핵심 일 2~3가지
3. 이 방을 따로 두면 좋아지는 점 한 줄

모르는 내용은 짐작하지 말고 물어봐 주세요.

[내가 일주일 동안 하는 일]
(예: 아침마다 할 일 적기, 고객 메일 답장, 주간 보고서 초안, 인스타 글감 찾기, 영수증 정리)</code></pre></div>

## 2. 방마다 AI 직원 한 명 만들기

방을 나눴다면, 방을 지킬 AI 직원의 역할을 정해 줄 차례예요.
AI 앱의 **'지침' 칸**에 직원 정의서를 넣어 두면, 대화를 새로 시작해도 역할을 잊지 않아요.

| 앱 | 지침을 넣는 곳 (앱 버전에 따라 메뉴 이름이 조금 달라요) |
| --- | --- |
| 챗GPT | 프로젝트를 만들고 '지침' 칸, 또는 설정의 '맞춤 설정' |
| 클로드 | '프로젝트'를 만들고 '프로젝트 지침' 칸 |
| 제미나이 | 'Gem'을 새로 만들고 '지침' 칸 |

방 하나에 프로젝트(또는 Gem) 하나씩 만들면 돼요.

<div class="copybox"><button type="button" onclick="copyBox(this)">요청문 복사</button><pre><code># [직원 이름] 정의서

- 이름: [예: 기획 비서 / 글쓰기 도우미 / 살림 매니저]
- 맡는 일:
  - [핵심 일 1]
  - [핵심 일 2]
  - [핵심 일 3]
- 안 하는 일:
  - 최종 결정을 스스로 내리지 않기
  - 모르는 사실을 지어내지 않기
  - 비밀번호·계좌번호 같은 개인정보를 묻거나 다루지 않기
- 보고 방식:
  - 결론을 맨 윗줄에
  - 내가 고를 수 있게 선택지 2~3개로
  - 짧고 쉬운 말로
- 모르면 묻기:
  - 정보가 모자라거나 애매하면 짐작하지 말고 되묻기</code></pre></div>

## 3. 방별로 따라 해 보기

제 사옥에서 실제로 돌아가는 방 네 곳을, 여러분 버전으로 바꿔 봤어요.

### 총괄기획 방

**제 사옥에서는:** 제 말 한마디를 일 카드로 쪼개 팀에 나누고, 아침저녁 보고 때 제가 결정할 일만 골라 올려 줘요.

**여러분 버전:** ① 오늘 떠오른 할 일과 생각을 메모장에 두서없이 적어요. ② 아래 요청문에 붙여 넣어요. ③ AI가 골라 준 '결정할 일'만 보고 방향을 정해요.

<div class="copybox"><button type="button" onclick="copyBox(this)">요청문 복사</button><pre><code>당신은 꼼꼼한 총괄기획 비서예요. 아래 [두서없이 적은 메모]를 보고 세 가지로 정리해 주세요.

1. 일 카드: 지금 바로 할 일 / 이번 주 안에 할 일 / 나중에 할 일
2. 내가 직접 결정해야 하는 것: 추천안 1개와 대안 1개씩
3. 오늘 저녁 한 줄 요약

모르는 내용은 짐작하지 말고 물어봐 주세요.

[두서없이 적은 메모]
(오늘 머릿속에 맴도는 일과 생각을 자유롭게)</code></pre></div>

### 콘텐츠 방

**제 사옥에서는:** 한 주의 글감을 모아 블로그 글과 릴스까지 만들어요. 올리는 단추는 제가 직접 눌러요.

**여러분 버전:** ① 일하다 겪은 일이나 새로 배운 팁을 하루 한 줄씩 적어요. ② 일주일 치를 모아 요청문에 넣어요. ③ 마음에 드는 글감으로 초안을 받고, 올리기는 직접 해요.

<div class="copybox"><button type="button" onclick="copyBox(this)">요청문 복사</button><pre><code>아래 [이번 주에 겪은 일과 메모]로 블로그나 SNS에 올릴 글감 3개를 만들어 주세요.

글감마다 이렇게 적어 주세요.
1. 눈길을 끄는 첫 줄 제목
2. 누구나 겪는 공감 포인트
3. 전하고 싶은 핵심 팁 하나
4. 글 뼈대 (시작 / 가운데 / 맺음)

없는 경험을 지어내지 말고, 메모에 있는 것만 써 주세요.

[이번 주에 겪은 일과 메모]
(경험, 해결한 문제, 인상 깊었던 대화를 편하게)</code></pre></div>

### 인프라관리 방

**제 사옥에서는:** 서버와 AI 직원들이 멈추지 않게 지키고, 집 스마트홈 고장까지 스스로 찾아 고칠 방법을 올려요.

**여러분 버전:** ① 평소 쓰는 도구, 폴더, 자주 깜빡하는 정기 일을 적어요. ② 요청문으로 '주간 점검표'를 만들어요. ③ 일이 자꾸 막힐 때마다 이 방에 물어봐요.

<div class="copybox"><button type="button" onclick="copyBox(this)">요청문 복사</button><pre><code>당신은 내 업무 도구와 루틴을 관리하는 점검 담당이에요. 아래 [내가 쓰는 도구와 루틴]을 보고 '주간 점검표'를 만들어 주세요.

1. 주 1회 파일·자료 정리 점검 3가지
2. 깜빡하기 쉬운 정기 마감과 백업 점검 2가지
3. 이번 주 일이 막힌 곳을 찾는 질문 2가지

[내가 쓰는 도구와 루틴]
(예: 바탕화면 정리, 캘린더 확인, 메일함 비우기, 사진 백업)</code></pre></div>

### 연구소

**제 사옥에서는:** 매주 AI 직원들이 일한 방식을 돌아보고, 더 잘하는 방법을 스스로 제안해요. 반영은 제가 확인하고 해요.

**여러분 버전:** ① 이번 주에 유독 오래 걸렸거나 지쳤던 일 하나를 떠올려요. ② 요청문으로 막힌 곳을 짚어 봐요. ③ 가장 쉬운 규칙 하나만 골라 다음 주에 지켜요.

<div class="copybox"><button type="button" onclick="copyBox(this)">요청문 복사</button><pre><code>아래 [이번 주에 지쳤거나 아쉬웠던 일]을 읽고 다음 주에 바로 쓸 개선안을 주세요.

1. 오래 걸린 가장 큰 이유 한 줄
2. AI에게 맡기거나 줄일 수 있는 부분
3. 다음 주에 지킬 '딱 한 줄 규칙'
4. 내 AI 직원 정의서에 더하면 좋은 문장 한 줄

[이번 주에 지쳤거나 아쉬웠던 일]
(시간이 너무 걸렸거나, 같은 일을 반복했던 것)</code></pre></div>

## 4. 비공개 방은 이렇게 지켜요

제 사옥에도 비공개 방이 두 곳 있어요. 돈과 가족 일을 맡는 방이에요.
이런 방은 처음부터 **AI에게 보여 주지 않을 것**을 정해 두는 게 먼저예요.

**AI에게 넣지 말아야 할 것:** 계좌번호, 카드·계정 비밀번호, 주민등록번호, 아이 실명과 학교, 집 주소.
숫자가 필요하면 'A통장 100만 원'처럼 기호나 예시 숫자로 바꿔서 물어보세요.

**결정은 사람이 하는 세 가지 규칙**

1. AI에게는 정리, 계산, 선택지 비교까지만 맡겨요.
2. 돈을 보내거나 계약하거나 가족과 약속하는 일은 사람이 직접 해요.
3. 돈·법·건강 정보는 실행하기 전에 공식 기관에서 한 번 더 확인해요.

## 5. 보너스: 사진 한 장으로 10분 만에 끝내는 드론 오프닝 영상

제가 2026년 10월 20일에 AI 타워 첫 오프닝을 직접 만든 방법이에요. 파이썬 같은 설치 없이 크롬 브라우저와 사진 한 장만 있으면 10분 만에 만들 수 있어요.

![AI 타워 사진](/assets/images/ai-tower/rooms/flow-start-photo.jpg){: style="width:100%;max-width:720px;border-radius:12px"}

[이 사진 받기 (1920x1080)](/assets/images/ai-tower/rooms/flow-start-photo.jpg){: download="ai-tower-photo.jpg"}

**준비물:** 구글 계정, PC 크롬 브라우저, 사진 한 장 (위 타워 사진을 받아 써 보세요).

**왜 거꾸로 만드나요?**
구글 Flow는 시작 장면(start frame)에 넣은 사진을 그대로 지켜 줘요. 사진에서 출발해 멀어지게 만든 뒤 거꾸로 돌리면, 영상 마지막이 내 사진과 딱 맞게 끝나요.

**따라 만들기 7단계**

1. 크롬에서 `labs.google/flow` 주소로 들어가 새 프로젝트를 열어요.
2. 프롬프트 칸의 모델 이름을 눌러 'Video' → 'Frames'를 골라요.
3. '+ Add start frame'(시작 장면)에만 사진을 넣고, 끝 장면('end frame')은 비워 둬요.
4. 설정을 '화면 16:9', '길이 8초', '모델 Veo 3.1 - Fast'로 맞춰요.
5. 아래 복사 상자의 영어 문장을 그대로 붙여 넣고 'Generate'를 눌러요.
6. 사진에서 멀어지는 드론 영상이 나오면 내려받아요.
7. 휴대폰이나 PC의 영상 편집 앱(캡컷 같은 앱)에서 영상을 불러와 '역재생(거꾸로 재생)'으로 뒤집으면 완성이에요!

<div class="copybox"><button type="button" onclick="copyBox(this)">요청문 복사</button><pre><code>Cinematic aerial drone shot, one continuous move. The shot starts exactly on this frame and holds almost still for a brief moment, then the drone slowly and smoothly pulls back and rises, gliding away from the tower while it keeps looking at the glowing core of the open floor, which stays at the same spot in the frame. The move eases in gently and then keeps a steady, graceful speed to the end. As the camera pulls back, the cut-open office floor becomes smaller, more of the dark glass skyscraper appears above and below it, and more of the dusk river city, the long lit bridges and the misty mountain ridges come into view. By the last frame the open floor fills only about the middle third of the frame. No rotation, no shake, no cuts. The tower, the six rooms and their lights and colors keep exactly the same design; the fiber sculpture keeps glowing softly; city lights twinkle gently. No people anywhere, no birds, no aircraft. No text, captions, logos or watermark. Photorealistic, calm, premium, cinematic, natural motion blur. Sound: faint wind and a distant city hum only.</code></pre></div>

> **무슨 뜻인가요?** 사진 구도를 그대로 유지하면서 카메라가 부드럽게 뒤로 빠져 도시 전경을 보여 주는 드론 샷으로 만들어 달라는 뜻이에요.

**6단계에서 받은 영상** (Flow가 준 그대로)

<video src="/assets/images/ai-tower/rooms/flow-result-pullback.mp4" poster="/assets/images/ai-tower/rooms/flow-result-pullback.jpg" controls muted playsinline preload="metadata" style="width:100%;max-width:720px;border-radius:12px"></video>

**7단계에서 뒤집은 오프닝**

<video src="/assets/images/ai-tower/rooms/flow-opening-flyin.mp4" poster="/assets/images/ai-tower/rooms/flow-opening-flyin.jpg" controls muted playsinline preload="metadata" style="width:100%;max-width:720px;border-radius:12px"></video>

**알아두면 좋은 점**

- **비용 (2026년 10월 기준):** 구글 무료 계정은 하루 50 크레딧을 받아요. Veo 3.1 - Fast 영상 1개에 20 크레딧이 들어서 하루 두 번쯤 무료로 만들어 볼 수 있어요.
- 완성 영상 오른쪽 아래에는 작은 별 모양 워터마크가 붙어 나와요. 제 예시 영상에도 그대로 있어요.
- **내 사진으로 만들기:** 내 사무실, 가게, 집 사진으로도 똑같이 만들 수 있어요. 사진 속 사람이 움직일 수 있으니 사람이 없는 사진을 쓰면 더 깔끔하게 나와요.
- 내 사진을 쓸 때는 영어 문장 속 건물 설명(tower, open floor, river city 같은 말)을 내 사진에 맞게 바꿔 주세요. AI 앱에 "이 문장을 내 사진에 맞게 고쳐 줘"라고 부탁해도 돼요.

내 사진으로 직접 만들어 본 결과를 댓글이나 DM으로 편하게 보여 주세요!

## 6. 다음 편 예고

방을 나누고 AI 직원을 세우는 것만으로도 머릿속 짐이 한결 가벼워져요.
다음 편에서는 쏟아지는 일 중에서 **내가 결정할 일만 골라 주는 서랍**을 보여 드릴게요.
따라 해 보다 막히면 인스타그램 댓글로 편하게 물어봐 주세요.

1편 안내(AI 타워 한눈에 보기)는 [여기](/ai-tower/)에 있어요 · @gwichan_ai
