# The seven features, for questions about one

When the user asks about one feature, answer in three or four lines: what it does,
what it keeps in their Tilnote, one sentence to say. Use your own words in their
language; the Korean below is what the features actually say and save (for an
English-speaking user, the English sentences in SKILL.md's table and the English note
names: `My writing style`, `My news topics`, `[News] ...`, `[Idea] ...`). Then ask
whether to try it.

Everything here lives in the user's own Tilnote account as notes they can open, edit
and delete at tilnote.io. Because it lives there, any AI app with this plugin and
Tilnote can pick up where they stopped.

## 함께 쓰기 (write-post)

- Looks the topic up and drafts the whole post without asking first - except a post
  about their own view or a story they lived, where it first asks up to three short
  questions. Then they can add points or tell it what they tried and think - each
  goes into the draft - or ask about it, which gets an answer and goes in only if
  they want.
- Checks first whether they already published a post on the topic, and offers a
  follow-up or an update instead of a duplicate.
- Keeps: the draft as a private note; a `[글 아이디어] ...` note when they stop midway, so
  they can continue later. Published only when they say "올려".
- Their own photos and screenshots: it gives a link where they upload them from
  their phone or computer, then puts them in the post where they fit.
- Say: "○○에 대해 블로그 글 써 보고 싶어", "이거 글로 정리해서 올려줘", "어제 그 글 아이디어 이어서",
  "이 글에 사진 넣고 싶어".

## 글 업그레이드 (upgrade-post)

- Makes a post they already have better without making it someone else's. Light:
  spelling, or polishing in their own voice. Full: a conversation that grows the post
  - first what changed since it went up (checked against sources), what readers would
  ask and one question only they can answer; then their questions, the sources they
  bring and what they tried since go into the post; then it is tidied, with summary,
  cover, tags and links to their related posts, and they see how it grew.
- What they ask to put in goes straight in, even on a published post - Tilnote keeps
  earlier versions for 30 days, so "아까 걸로 되돌려줘" undoes it. What the AI suggests
  on its own is offered first (on a private draft it goes in, and they take out what
  they don't want). The post keeps its address and publish date. A draft is
  published as the same note when they say so.
- Also takes a post down (it goes back to a private note) or brings back an earlier
  version - an upgrade they regret included.
- Say: "이 글 업그레이드해줘", "이 글 업데이트해줘", "이 기사 내용 내 글에 더해줘", "오래된 글 최신으로 고쳐줘", "이 글 다듬어서 올려줘", "그 글 내려줘".

## 내 문체 메모 (writing-style)

- One private note, `내 문체 메모`: who they write for, tone and sentence endings,
  phrases they use, words they never use, a few of their own sentences.
- Learns from posts they wrote themselves (it asks which ones), and from rules they
  state. Every writing feature reads it before writing.
- Someone who writes differently for different kinds of posts (a newsletter and a
  how-to post) can keep a mode for each in the same note; each post uses the mode
  that fits, and the reply says which.
- Say: "내 문체 기억해줘", "앞으로 '~요'로 써줘", "'혁신적인' 쓰지 마", "블로그 말투는
  따로 배워줘".

## 소셜 공유 (share-post)

- Turns one published post into text for Threads, X, LinkedIn, Facebook, Bluesky,
  KakaoTalk, Band, Naver Blog and Instagram, from what the post says, in their voice.
  Tilnote checks each network's length limit and returns links that open the
  network's share window with the text filled in. A card image on request.
- Never posts for them: they open the link and post it themselves.
- Keeps: nothing, unless they ask to save the texts as a private note.
- Say: "스레드에 올릴 글로 바꿔줘", "카톡방에 올릴 소개 써줘", "인스타 카드뉴스 만들어줘".

## 다음 글 찾기 (next-post)

- Looks at how their posts are doing (views are lifetime totals per post), their
  private notes, idea notes and recent news briefings, and suggests two or three
  next posts, each with a reason. Also points out published posts worth fixing - no
  summary or cover, facts that may be out of date.
- Keeps: nothing; it only reads.
- Say: "다음에 뭐 쓰지?", "내 글 조회수 어때?", "블로그 점검해줘".

## 뉴스 리더 (news-reader)

- Their topics (up to five) live in one private note, `내 뉴스 토픽`, which they can
  also edit by hand.
- "뉴스 돌려줘": the AI app searches the web for news on those topics since the last
  run, opens the sources, and returns a short briefing - title, link, source, date,
  why it matters to them, and a post idea for each item. Saved as a private note
  `[뉴스] YYYY-MM-DD 브리핑`; "3번 글 아이디어로 저장" keeps one item as an idea note.
- Needs an AI app that can search the web; without it, it says so instead of making
  news up. Tilnote doesn't run it on its own. If their app can schedule
  tasks, they can schedule "틸노트 뉴스 리더 돌려줘" ("Run my Tilnote news reader")
  for weekday mornings.
- Say: "관심 토픽 등록해줘", "뉴스 돌려줘", "토픽 추가해줘".

## 책 만들기 (make-book)

- A book they want to read. Researches how the subject is usually taught, what
  changed recently and where people get stuck, looks at their notes, and drafts a
  table of contents for their level. Nothing is saved until they approve it.
- On yes: a private book whose first page is the note `"<책 제목>" 목차` (each
  chapter's plan and status). A chapter is written when they pick it - from the
  table of contents or by name - and goes into the book at its place. They read it on
  the book's page in Tilnote (the `/users/books/...` link). Publishing the book is
  their call, on the web; the 목차 note stays private unless they tick it.
- Say: "○○ 책 만들어줘", "내 책 보여줘", "3장 보여줘", "다음 장", "Git 책 이어서 읽자".
