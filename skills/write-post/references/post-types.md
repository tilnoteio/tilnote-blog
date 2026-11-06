# Post types (글 유형)

Pick the type from the material, not from the topic. A post about Ollama can be a
문제 해결 (it crashed), a 방법 안내 (how to set it up), a 써 본 후기 (a week of using
it) or a 비교 (against LM Studio). The type decides the order, the length, and where
the writer's own part sits.

Lengths are for the body, in Korean characters with spaces; the words in brackets are
the same length for a post in English. They are what a reader of that kind of post
will sit through, not targets - stop when the material runs out.

Don't name the type in the post or announce it to the user. Just use the shape.

**The order is not the headings.** The names below (증상, 원인, 해결, 헤맨 곳, 결론,
비교 기준...) say what goes where - they are never `##` headings, not even as a
prefix. Each heading says that part's answer or step in its own words:
"NEXT_PUBLIC_ 값은 빌드할 때 코드에 박힌다", not "원인" or "원인: 빌드 때 박힌다";
"개발 서버에서 됐던 건 실행할 때 값을 읽어서다", not "헤맨 곳: 개발 서버에선 왜
됐을까". Numbered steps in a how-to may keep their number when the order matters
("1. Ollama 앱 설치하기"). And don't narrate the structure ("기준은 다섯 가지로
잡았다", "아래에서 차례로 살펴보자") - the reader sees it.

## 문제 해결·TIL

When: an error was fixed, or something was learned today.

- Title: the symptom or error + the setting (+ the fix).
  "Next.js 도커 배포에서 NEXT_PUBLIC 환경 변수가 undefined 일 때"
- Order:
  1. 증상 - what they saw, the exact message in a code block. The next person pastes
     that message into a search box.
  2. 원인 - one paragraph on why it happens.
  3. 해결 - the steps or code that worked, minimal and runnable.
  4. 헤맨 곳 - what they tried that didn't work and what confused them. This is the
     writer's part, and for the next reader the most useful section.
- First two sentences: the problem and the fix, in one breath.
- Length: 800-2,000자 (300-750 words). A short TIL can be 500 (200 words).

## 방법 안내

When: steps to get something done.

- Title: "~하는 법", "~ 설치부터 첫 실행까지", plus the condition (OS, version, plan).
  "맥에서 Ollama로 로컬 LLM 설치하고 첫 질문까지 (2026년 10월)"
- Order:
  1. What the reader has at the end, who it's for, and what they need first
     (versions, with a date).
  2. Steps - one action each, numbered, with the exact command or menu and what they
     should see after it.
  3. 막히는 곳 - where the writer got stuck and how they got past it (writer's part).
  4. Where to go next.
- Length: 1,500-4,000자 (550-1,500 words).

## 써 본 후기

When: the writer used a tool, product or service.

- Title: what + the condition + the verdict.
  "맥북 에어 8GB로 로컬 LLM 일주일 써 본 후기: 요약은 되고 긴 글은 답답"
- Order:
  1. 결론 먼저 - worth it for whom.
  2. 써 본 조건 - device, version or plan, how long, for what.
  3. 좋았던 점 / 아쉬운 점 - concrete, with what they measured or noticed.
  4. 이런 분께 맞아요 / 이런 분은 다른 걸.
- Writer's part: all of it. Leave out results they didn't give rather than inventing
  them; they can add them after the draft.
- A review of something the writer never used is not a review. Make it a 방법 안내 or
  소식 정리 instead.
- Length: 1,500-3,500자 (550-1,300 words).

## 비교

When: two or three options for one decision.

- Title: "A vs B: ~할 때 무엇을 고를까" + the condition.
  "Ollama vs LM Studio: 맥북 에어에서 회의록 요약용으로 고른다면"
- Order:
  1. 결론 - one line per situation ("요약만이면 A, 모델을 자주 바꾸면 B").
  2. 비교 기준 - 3-5, chosen by the decision, not by the spec sheet.
  3. One table, criteria × options, with dates on prices and versions.
  4. Explanations only where the table needs them.
  5. 내가 고른 것과 이유 (writer's part).
- A table usually does the job. A diagram only when the difference is visual.
- Length: 2,000-5,000자 (750-1,800 words).

## 의견·회고

When: the writer's view, or a look back at a project, a month, a decision.

- Title: the claim itself.
  "AI로 블로그를 쓰면 생각이 사라질까: 한 달 써 보고 든 생각"
- Order:
  1. 주장 한 문장 - or, for a retrospective, what was done and how it went, in one
     paragraph.
  2. 그렇게 보는 이유 2-3 - each tied to something that happened.
  3. 반대쪽 이야기 - the fair version of the other side, or what didn't go well.
  4. 그래서 앞으로.
- Writer's part: nearly everything. You help with order and clarity, never with the
  opinion.
- Length: 1,000-3,000자 (400-1,100 words).

## 소식 정리

When: something new happened - a release, a policy, an announcement. Often starts from
an item of the user's news briefing.

- Title: what changed + how (+ the month).
  "MCP 원격 서버 인증, 무엇이 바뀌었나 (2026년 10월)"
- Order:
  1. 무슨 일인지 - two or three sentences, the date, the primary source as `[^1]`.
  2. 바뀐 점 / 핵심 3-5.
  3. 누구에게 어떤 영향 - the writer's take, "내 일에는" (writer's part - a news briefing
     item's 글 아이디어 question is answered here once the writer gives their take;
     until then keep this part general, from the sources).
  4. 아직 모르는 것.
- Every claim dated and footnoted to a page you opened, primary source first.
- Length: 800-2,500자 (300-900 words).

## Mixed material

If the conversation holds two types at once (a how-to and a review), go with the one
the writer's part supports best. If both are big, offer to make two posts.

## None of these fits

Most posts fit one of the six - check again before you leave them. When none does (a
collection like "맥 단축키 10개", a glossary, an interview, a list of resources), work
out the order this reader needs from the material: what they came for first, then
what they need to use it. Everything else here still holds: the opening answers the
title, headings say something, nothing first-person is invented, and the length is
what the material carries. Don't name the shape either.
