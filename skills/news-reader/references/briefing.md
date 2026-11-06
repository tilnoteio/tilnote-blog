# The briefing (뉴스 브리핑)

What a run returns: a short, dated, sourced read of what happened on the user's topics
since the last run - in the chat, in the language the topics note is written in (a
scheduled run's prompt may be in another language; the note decides). It is for one
person deciding in two minutes what is worth a closer look, and maybe a post.

## Shape

```markdown
**10월 31일 뉴스 브리핑** · 10월 30일 오전 8시 이후 소식

**한눈에**
- (2-3 lines across all topics: the one or two things that matter most, plainly)

### AI 에이전트

1. **(제목)** ([링크](url)) · (출처) · 10월 30일
   - 무슨 일: (1-2 sentences, only what the source says)
   - 왜 볼 만한지: (one line, tied to the topic's 메모)
   - 글 아이디어: (one concrete question the user could answer from their own experience)

2. ...
   - 내 노트: [글 아이디어] (제목) (링크)   ← only when it continues their idea note or post

### 로컬 LLM

새 소식 없음

### 전기차 배터리

확인하지 못함: 찾은 기사 2건을 열 수 없었어요

글로 써 볼 소식이 있으면 번호로 알려 주세요. 나중에 쓰려면 '3번 글 아이디어로 저장'이라고 하시면 돼요.
```

The same in English:

```markdown
**News briefing, Oct 31** · stories since Oct 30, 8:00 AM

**At a glance**
- (2-3 lines across all topics)

### AI agents

1. **(title)** ([link](url)) · (source) · Oct 30
   - What happened: (1-2 sentences, only what the source says)
   - Why it's worth a look: (one line, tied to the topic's Memo)
   - Post idea: (one concrete question the user could answer from their own experience)

2. ...
   - My note: [Idea] (title) (link)   ← only when it continues their idea note or post

### Local LLMs

No new stories

### EV batteries

Couldn't check: 2 stories found wouldn't open

If one of these is worth a post, tell me its number. To keep one for later, say "save 3 as an idea".
```

The rest of these lines in English: `Follow-up: ...` for a story with something new,
`Follow-up to [<title>](https://tilnote.io/pages/<pageId>)` for an item that continues
a published post, "(it's been 12 days since the last run, so this covers the last 7
days)" for a capped window.

- **Heading:** the date of the run and the window, in the note's time zone. When the
  window was capped at 7 days, say so after it: "(마지막으로 돌린 지 12일이 지나 최근
  7일만 봤어요)".
- **Numbers run across the whole briefing** (1, 2, 3 under the first topic, 4, 5 under
  the next), so "3번" always means one item.
- **제목** in your own short words, in the briefing's language, when the original is
  long or in another language; the link goes to the page you opened.
- **출처:** the outlet or site ("ollama.com", "가상일보"). For a primary source, the
  organisation ("Ollama 공식 블로그").
- **Date:** when it was published, in the note's time zone, as "10월 30일" ("Oct 30" in
  English) - a date you saw on the page you opened, never the search snippet's or the
  run's. No year unless it isn't this year.
- **무슨 일:** only what the page says - no numbers, names or claims from elsewhere.
  If the page hedges ("검토 중", "보도에 따르면"), keep the hedge.
- **왜 볼 만한지:** one line connecting it to the topic's 메모 ("8GB 맥북에서 돌릴 수
  있는 크기예요"). With no memo, to the topic itself. Never "중요한 소식이에요".
- **글 아이디어:** a question the user could explore from what they do or have tried - "우리
  팀 회의록에 붙이면 뭐가 줄어들까?", not "AI의 미래는?".
- **내 노트** (only sometimes): when the item continues one of the user's `[글 아이디어]`
  notes, `내 노트: [글 아이디어] <제목> (링크)`; when it continues a published post,
  `지난 글 [<제목>](https://tilnote.io/pages/<pageId>)의 후속`. One line, no more.
- **새 소식 없음** for a topic with nothing new in the window - one line, no filler.
- **확인하지 못함: 찾은 기사 N건을 열 수 없었어요** for a topic whose stories were found
  but none would open. It is not "새 소식 없음": the news may be there, unchecked.
- **One next step** at the end, exactly one: the line above - or, when an item has a
  `내 노트: [글 아이디어]` line, the one that offers to add that item to the idea note
  (SKILL.md, 2. Briefing, step 4).

## Rules

- **No hype.** No "충격", "역대급", "게임 체인저", "꼭 알아야 할" - nor "huge",
  "game-changer", "must-know" in English. Say what changed.
- **Dates on everything time-sensitive** - prices, versions, release status, "베타",
  "무료".
- **Links only to pages you actually opened.** A search result you didn't open is not a
  source. A home page or a list page doesn't stand in for a specific story.
- **Only dated pages are news.** A page that shows no publish date - docs, a product
  page, a README, a page with only a 수정일/updated date - can't carry an item. Find a
  dated source for the same change (release notes, a changelog entry, an announcement
  post, a dated news report) and cite that, or leave the item out. An updated date
  alone doesn't make an old page new.
- **One event, one item.** Five outlets on the same release are one item; link the
  primary source, or the clearest report.
- **Fewer is fine.** Two solid items beat three where the third is filler. The count in
  the topics note is a maximum.
- **Nothing from memory.** Every item comes from a page opened in this run.

## Saving it

With `결과 저장: [뉴스] 노트에 저장` (the default):

- **First run of the day** → `create_note`, private, title `[뉴스] YYYY-MM-DD 브리핑`
  (the date of the run in the note's time zone, e.g. `[뉴스] 2026-10-31 브리핑`; in
  English `[News] 2026-10-31 briefing`), tags `["tilnote-news"]`, `aiGenerated: true`, and the
  briefing as `content` - without the closing next-step line, which only makes sense in
  the chat.
- **Another run the same day** (a note tagged `tilnote-news` with today's date in its
  title exists - you have it from step 4's `list_notes`) →
  `append_to_note` on that note, `separator: "blank_line"`, with a section that starts
  `## HH:mm 추가` (`## HH:mm update` in English; the note's time zone) and holds this
  run's window, 한눈에 and items:

  ```markdown
  ## 14:20 추가
  10월 31일 오전 8시 이후 소식

  **한눈에**
  - ...

  ### AI 에이전트
  1. ...
  ```

  Numbers in that section start again from 1, as in the chat.

Then one line in the chat with the note link ("틸노트에 저장했어요: [뉴스] 2026-10-31
브리핑 (링크)" / "Saved to Tilnote: [News] 2026-10-31 briefing (link)"), just before
the next-step line. Don't show the briefing a second time.

With `결과 저장: 저장 안 함`, save nothing and leave the link line out.

## Example (abridged)

> **10월 31일 뉴스 브리핑** · 10월 30일 오전 8시 이후 소식
>
> **한눈에**
> - MCP 쪽은 원격 서버 인증 방식이 정리되는 중이에요.
> - 로컬 LLM은 이번엔 새 소식이 없어요.
>
> ### AI 에이전트
>
> 1. **MCP 원격 서버 인증 방식 정리** ([링크](https://...)) · MCP 공식 블로그 · 10월 30일
>    - 무슨 일: MCP 사양 문서에 원격 서버에 붙을 때 쓰는 인증 절차가 정리됐어요.
>    - 왜 볼 만한지: 회사 위키 같은 사내 도구를 붙일 때 바로 걸리는 부분이에요.
>    - 글 아이디어: 우리 팀 도구 중에 MCP로 먼저 붙여 볼 만한 건 뭘까?
>
> ### 로컬 LLM
>
> 새 소식 없음
>
> 틸노트에 저장했어요: [뉴스] 2026-10-31 브리핑 (https://tilnote.io/home?pages=...)
>
> 글로 써 볼 소식이 있으면 번호로 알려 주세요. 나중에 쓰려면 '3번 글 아이디어로 저장'이라고 하시면 돼요.
