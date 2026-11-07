---
name: next-post
description: Shows how the user's Tilnote blog posts are doing and suggests what to write next - 2-3 candidates, each with a one-line reason drawn from what readers responded to, private notes and idea notes not yet published, and their latest news briefings saved in Tilnote - plus published posts whose facts may be out of date. Use when the user asks about their own blog - "내 글 조회수 어때", "반응 좋은 글 뭐야", "블로그에 다음에 뭐 쓰지", "블로그 글 아이디어 추천해줘", "블로그 주제 뭐가 좋을까", "블로그 점검해줘", "손볼 글 있어?", "how is my blog doing", "what should I write next", "any posts I should fix?". Not for topic ideas unrelated to their blog (a school essay, a report, a talk). Once a candidate is chosen, the post itself is written with write-post; a post worth fixing is upgraded with upgrade-post.
---

# What to write next (다음 글 찾기)

Generic topic lists are free anywhere. What only Tilnote can show is the user's own
material: which of their posts people read, what they started and never finished,
and what turned up in their news briefings this week. Every suggestion here points at
one of those - that reason is the product, the title is the garnish.

Speak in the user's language. Examples are Korean because most Tilnote writers are;
the fixed lines have an English form next to them.

## 1. Gather (read-only)

1. Check that the Tilnote tools are there. If not:
   - **Their own posts** - how they are doing, which to fix ("내 글 조회수 어때",
     "반응 좋은 글 뭐야", "블로그 점검해줘") → say in one line that Tilnote isn't
     connected yet and where to connect it (only the place in the app you are in - the app's connection settings, `/mcp` in a
     terminal app, Plugins → Tilnote Blog in ChatGPT or the Codex app, address
     `https://tilnote.io/mcp`), and stop.
   - **A topic question** ("블로그 주제 뭐가 좋을까", "다음에 뭐 쓰지") → answer it
     normally: a few ideas from what the conversation shows about them and what they
     write about - no claims about their posts, notes or numbers. End with one line:
     > 틸노트를 연결하면(주소 `https://tilnote.io/mcp`) 올린 글의 반응과 써 두다 만 노트를 보고 다음 글을 골라 드릴 수 있어요.

     In English:
     > Connect Tilnote (address `https://tilnote.io/mcp`) and I can pick your next post from how your published posts are doing and the notes you left unfinished.
2. `search_notes` with `q: "tilnote-style"` and `tags: ["tilnote-style"]` for their
   `내 문체 메모` (`My writing style` in an English account) and `get_note` it if it
   exists - who they write for shapes which ideas fit. If it has `## 모드:` (`## Mode:`) sections, each mode's `언제:` (`When:`) line is a kind of post they
   write; a candidate can fit any of them.
3. **Readers:** `get_note_stats` with `allTime: true` and `limit: 10` - every published
   post however old, and the 10 most-read. Views and likes are **lifetime totals per
   post**, not views by date - never write "지난 7일 조회수" ("views in the last 7 days").
   If it answers that the stats took too long (an account with thousands of posts),
   call it once more with `days: 365` and `limit: 10`. `days` filters posts by when
   they were published, so that answer holds only the last year's posts - older ones
   are in neither its totals nor its top 10. `publishedPostsAllTime` minus
   `totals.publishedPosts` is how many it leaves out.
4. **Private notes:** `list_notes` with `published: false` and `limit: 50`, then
   `page: 2`, `3`, ... while `pagination.hasMore` is true, up to 4 pages (the newest
   200 private notes). Unfinished material is here - but not the working notes,
   tagged `tilnote-style`, `tilnote-news-topics`, `tilnote-share` or `tilnote-news`,
   and not a book's notes: a 목차 note (the `"<Book title>" contents` note in English),
   tagged `tilnote-book-toc`, and the chapter
   notes that carry its other tag - those were written for a book the user reads,
   not as blog drafts.
5. **Idea notes:** `search_notes` with `q: "tilnote-idea"` and
   `tags: ["tilnote-idea"]` for the notes tagged `tilnote-idea`. Read the two or three
   most promising unfinished notes with `get_note` - an idea note's "어디까지 했나"
   ("Where it stands" in English) says how close it is.
6. **News briefings:** from the `list_notes` pages you already have (newest created
   first; briefings are private notes), the notes tagged `tilnote-news` - recent news
   on the topics the user follows, each item with a 글 아이디어 (`Post idea:` in an
   English briefing) question. `get_note` the
   newest one or two from the last week, going by the date in the title. Don't look
   for them with `search_notes`: it ranks by relevance, not date. If there are none,
   skip this without comment.

Stop there. Don't page past 200 private notes - that and the top 10 posts are enough
to find two or three good candidates.

## 2. Candidates: two or three

Each one: a title someone would search for, and one line of why, pointing at the data.
Aim for different sources, not three variations of one:

| Source | Reason line, e.g. |
|---|---|
| A post readers liked | "[Next.js 도커 환경 변수 글](https://tilnote.io/pages/...)이 누적 조회 1위(820) → 같은 독자가 찾을 '도커 배포 체크리스트'" |
| A private note almost ready | "비공개 노트 '회의록 요약 프롬프트'가 거의 글 한 편 분량이에요" |
| An idea note | "[글 아이디어] 로컬 LLM - 해 보기만 남았어요. 해 보시면 바로 후기가 돼요" |
| A news briefing item | "10월 31일 뉴스 브리핑의 MCP 소식 - 지난번 MCP 글과 이어져요" |

- Links to published posts use `https://tilnote.io/pages/<pageId>` (the `url` from
  `get_note_stats`). Private notes are named, not linked as if public.
- Fit the user: their memo's reader, the topics they already write about. When the
  most-read post's audience differs from the memo's reader, still offer at most one
  candidate from what readers read, and say in one clause whose reader it fits.
- Don't invent demand ("요즘 검색이 늘고 있어요") you can't see in the data.

## 3. Posts worth fixing (손볼 글)

A post is worth fixing when a fact in it may have moved - a price, a version, a limit
or a "최신" thing that was true when it was written. A missing summary or cover is not
a reason: without a summary the search description is the post's opening, cut at the
same length a summary would be, and without a cover the share card shows the title.
Don't list either; upgrade-post fills them when it upgrades a post.

- **On every run:** among the stats' top three, a post published more than about a
  year ago whose title names a version, a price, a year or "최신" - `get_note` it and
  list it only if a sentence states such a fact. Usually there is none; then there is
  no 손볼 글 section.
- **The check-up**, only when the user asked for one ("블로그 점검해줘", "손볼 글
  있어?"): `get_note` up to five posts from the stats' top 10 - the ones published
  more than about six months ago whose titles name versions, prices, tools, "정리" or
  "최신", the likeliest to be out of date. If you can search, say what the fact is now,
  with a source. After the `days: 365` fallback the top 10 holds only the last year's
  posts; say the check-up covered those. When it finds nothing, say so in one line.

Up to three posts, one line each, naming the sentence. Fixing is upgrade-post's job: it
re-checks the facts against sources and shows the changes to the post before they go
live.

## 4. Report

Short, in this order:

```text
올린 글 17편, 누적 조회 3,400 (조회수는 글마다 올린 뒤부터 쌓인 합계라 오래된 글이 유리해요)
그중 가장 많이 읽힌 글: [Next.js 도커 환경 변수](https://tilnote.io/pages/...) 820

다음 글 후보
1. 도커 배포 전 확인할 환경 변수 체크리스트 - 1위 글을 읽은 사람이 다음에 찾을 글이에요
2. 맥북 에어 8GB로 로컬 LLM 돌려 본 후기 - [글 아이디어] 노트에서 해 보기만 남았어요
3. MCP 원격 서버 인증, 무엇이 바뀌었나 - 10월 31일 뉴스 브리핑 소식, 지난 MCP 글과 이어져요

손볼 글
- [Next.js 도커 환경 변수](https://tilnote.io/pages/...) - 작년 1월 글인데 "Next.js 14가 최신"이라는 문장이 있어서 지금과 다를 수 있어요

어느 걸로 써 볼까요?
```

In English the fixed lines read `17 published posts, 3,400 views in total (each post's
views add up from the day it went up, so older posts have a head start)`, `Most read:
[title](url), 820 views`, `What to write next`, `Posts worth fixing` and "Which one
would you like to write?"

One question at the end. No list of six improvements. When the user asked only for a
check-up, the question is which post to fix first ("어느 글부터 고쳐 볼까요?" -
"Which post should we fix first?").

The numbers line covers every published post. Only after the `days: 365` fallback
does it start "최근 1년 사이 올린 글" ("Posts published in the last year") and add how many
older posts it leaves out ("1년 넘은 글 5편은 이 숫자에 없어요" - "5 posts older than
a year aren't in these numbers") - never present a year's totals as the whole blog.

With no published posts yet, skip the numbers and suggest from notes, idea notes and
news briefings. With nothing at all, ask what they've been working on or learning
this week - that is where a first post comes from.

## 5. When they choose

- A new topic or a news briefing item → write-post: it looks it up and drafts the
  post.
- A private note or an idea note → write-post continues from that note.
- A post to fix → upgrade-post, with what you found (the sentence that may be out of
  date).

If those skills aren't available, carry on yourself the same way: look it up (for a
post about their own view or a story they lived that they haven't told yet, ask up to
three short questions first), save a private draft with no questions inside it, put
what they add straight in, answer their questions and offer once to put an answer in
the post, and publish only on a clear yes - and for a post to fix, show what will
change before touching the live post.

## Don'ts

- Never phrase lifetime totals as a period ("이번 주 조회수", "views this week"). A
  post's age is fine context ("올린 지 열흘 된 글인데 조회 140"); a time window for
  views is not.
- Views are page views, not people: "조회 1,240" ("1,240 views"), never
  "1,240명이 읽은" ("1,240 people read").
- Don't merge stats into a dashboard of numbers - one or two lines of numbers, then
  the ideas.
- Don't write anything here. This skill only reads; writing starts once they choose.
