---
name: next-post
description: Shows how the user's Tilnote blog posts are doing and suggests what to write next - 2-3 candidates, each with a one-line reason drawn from what readers responded to, private notes and idea notes not yet published, and their latest news briefings saved in Tilnote - plus published posts worth fixing (no summary or cover, facts that may be out of date). Use when the user asks about their own blog - "내 글 조회수 어때", "반응 좋은 글 뭐야", "블로그에 다음에 뭐 쓰지", "블로그 글 아이디어 추천해줘", "블로그 주제 뭐가 좋을까", "블로그 점검해줘", "손볼 글 있어?", "how is my blog doing", "what should I write next", "any posts I should fix?". Not for topic ideas unrelated to their blog (a school essay, a report, a talk). Once a candidate is chosen, the post itself is written with write-post; a post worth fixing is upgraded with upgrade-post.
---

# What to write next (다음 글 찾기)

Generic topic lists are free anywhere. What only Tilnote can show is the user's own
material: which of their posts people read, what they started and never finished,
and what turned up in their news briefings this week. Every suggestion here points at
one of those - that reason is the product, the title is the garnish.

Speak in the user's language. Examples are Korean because most Tilnote writers are.

## 1. Gather (read-only)

1. Check that the Tilnote tools are there. If not:
   - **Their own posts** - how they are doing, which to fix ("내 글 조회수 어때",
     "반응 좋은 글 뭐야", "블로그 점검해줘") → say in one line that Tilnote isn't
     connected yet and where to connect it (the app's connection settings, `/mcp` in a
     terminal app, address `https://tilnote.io/mcp`), and stop.
   - **A topic question** ("블로그 주제 뭐가 좋을까", "다음에 뭐 쓰지") → answer it
     normally: a few ideas from what the conversation shows about them and what they
     write about - no claims about their posts, notes or numbers. End with one line:
     > 틸노트를 연결하면(주소 `https://tilnote.io/mcp`) 올린 글의 반응과 써 두다 만 노트를 보고 다음 글을 골라 드릴 수 있어요.
2. `search_notes` with `q: "tilnote-style"` and `tags: ["tilnote-style"]` for their
   `내 문체 메모` and `get_note` it if it exists - who they write for shapes which ideas
   fit. If it has `## 모드:` (`## Mode:`) sections, each mode's `언제:` (`When:`) line is a kind of post they
   write; a candidate can fit any of them.
3. **Readers:** `get_note_stats` with `allTime: true` and `limit: 10` - every published
   post however old, and the 10 most-read. Views and likes are **lifetime totals per
   post**, not views by date - never write "지난 7일 조회수".
   If it answers that the stats took too long (an account with thousands of posts),
   call it once more with `days: 365` and `limit: 10`. `days` filters posts by when
   they were published, so that answer holds only the last year's posts - older ones
   are in neither its totals nor its top 10. `publishedPostsAllTime` minus
   `totals.publishedPosts` is how many it leaves out.
4. **Private notes:** `list_notes` with `published: false` and `limit: 50`, then
   `page: 2`, `3`, ... while `pagination.hasMore` is true, up to 4 pages (the newest
   200 private notes). Unfinished material is here - but not the working notes,
   tagged `tilnote-style`, `tilnote-news-topics`, `tilnote-share` or `tilnote-news`,
   and not a book's notes: a 목차 note, tagged `tilnote-book-toc`, and the chapter
   notes that carry its other tag - those were written for a book the user reads,
   not as blog drafts.
5. **Idea notes:** `search_notes` with `q: "tilnote-idea"` and
   `tags: ["tilnote-idea"]` for the notes tagged `tilnote-idea`. Read the two or three
   most promising unfinished notes with `get_note` - an idea note's "어디까지 했나"
   ("Where it stands" in English) says how close it is.
6. **News briefings:** from the `list_notes` pages you already have (newest created
   first; briefings are private notes), the notes tagged `tilnote-news` - recent news
   on the topics the user follows, each item with a 글 아이디어 question. `get_note` the
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

On every run, check the top three posts from the stats for a missing summary or
cover (below) - that costs three reads. The full check-up runs only when the user
asked for one ("블로그 점검해줘", "손볼 글 있어?"): look at up to five posts from the
stats' top 10 - the top three, and the ones published more than about six months ago
whose titles name versions, prices, tools, "정리" or "최신", the likeliest to be out
of date. After the `days: 365` fallback the top 10 holds only the last year's posts;
say the check-up covered those.

- **No summary or cover:** `get_share_kit` with just the `pageId` returns its
  `summary` and `imageUrl`. An empty `summary` means search engines show a cut-off
  slice of the body; an `imageUrl` on `https://tilnote.io/api/og?...` means no cover,
  so share cards fall back to plain text.
- **Facts that may have moved** (check-up only): posts published more than about six
  months ago that state prices, versions, limits or "최신" things - `get_note` and
  look. Name the sentence; if you can search, say what it is now, with a source.

Up to three posts, one line each; when one post has several problems, they share its
line. Fixing is upgrade-post's job: it re-checks the facts against sources, fills the
summary and cover through a republish that keeps the date, and shows the changes to
the post before they go live.

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
- [Next.js 도커 환경 변수](https://tilnote.io/pages/...) - 요약이 없어서 검색 결과에 본문 앞부분이 잘려 보여요

어느 걸로 써 볼까요?
```

One question at the end. No list of six improvements. When the user asked only for a
check-up, the question is which post to fix first ("어느 글부터 고쳐 볼까요?").

The numbers line covers every published post. Only after the `days: 365` fallback
does it start "최근 1년 사이 올린 글" and add how many older posts it leaves out
("1년 넘은 글 5편은 이 숫자에 없어요") - never present a year's totals as the whole
blog.

With no published posts yet, skip the numbers and suggest from notes, idea notes and
news briefings. With nothing at all, ask what they've been working on or learning
this week - that is where a first post comes from.

## 5. When they choose

- A new topic or a news briefing item → write-post: it looks it up and drafts the
  post.
- A private note or an idea note → write-post continues from that note.
- A post to fix → upgrade-post, with what you found (the sentence that may be out of
  date, the missing summary or cover).

If those skills aren't available, carry on yourself the same way: look it up (for a
post about their own view or a story they lived that they haven't told yet, ask up to
three short questions first), save a private draft with no questions inside it, put
what they add straight in, answer their questions and offer once to put an answer in
the post, and publish only on a clear yes - and for a post to fix, show what will
change before touching the live post.

## Don'ts

- Never phrase lifetime totals as a period ("이번 주 조회수"). A post's age is fine
  context ("올린 지 열흘 된 글인데 조회 140"); a time window for views is not.
- Views are page views, not people: "조회 1,240", never "1,240명이 읽은".
- Don't merge stats into a dashboard of numbers - one or two lines of numbers, then
  the ideas.
- Don't write anything here. This skill only reads; writing starts once they choose.
