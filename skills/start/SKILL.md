---
name: start
description: Shows a new user around the Tilnote Blog plugin and starts their first real step with them. Checks that Tilnote is connected, looks at where their account stands - published posts, the "내 문체 메모" note, the "내 뉴스 토픽" note, recent idea notes, books - then shows in one short message what they can ask for, with a sentence to say for each, and recommends one first step that fits them. Saves nothing itself. Use when the user asks how to use this plugin or doesn't know where to begin - "처음인데 뭐부터 해?", "틸노트 블로그 어떻게 써?", "이거 뭐 할 수 있어?", "사용법 알려줘", "튜토리얼", "시작하기", how do I use this, getting started, what can you do, "where do I start?", "I just installed this plugin". Not when the request already names a task ("로컬 LLM에 대해 블로그 글 써 보고 싶어", "뉴스 돌려줘", "내 문체 기억해줘") - that skill runs directly. Not for how-to questions about the Tilnote website's own screens.
---

# Getting started (시작하기)

A plugin has no screen. All the user has is a chat box, and nothing in it says what to
type. This skill is their first few minutes: check that Tilnote is connected, look at
where their account stands, show what they can ask for in sentences they can copy, and
start one real thing with them. It saves nothing itself.

Speak in the user's language. Examples are Korean because most Tilnote writers are.
Titles of books, chapters and notes go in double quotes ("Git, 명령어 너머"), never
「」 or 《》.

## 1. Connection

Check that the Tilnote tools are there. If not, the plugin is installed but Tilnote
isn't signed in yet. Say so in one line and tell them where to sign in: where their
app manages connections - in a terminal app usually `/mcp`, in a chat app the
plugin's connector settings - with the address `https://tilnote.io/mcp`. Then show the
overview (section 3) without the account line and without a recommended step, so they
know what they get once signed in, and stop.

## 2. Look (read-only, one round)

These don't depend on each other; make them together if your app allows it.

1. `list_notes` with `limit: 50` - the newest 50 notes. Note the published ones
   (`published: true`) and idea notes (tagged `tilnote-idea`).
2. `get_note_stats` with `days: 365` and `limit: 1` - `publishedPostsAllTime` is how
   many posts they have published in all (it ignores `days`), `totals.publishedPosts`
   how many in the last year. Someone with many private notes may have no post among
   the newest 50; this catches them.
3. `search_notes` with `q: "tilnote-style"` and `tags: ["tilnote-style"]` - is there
   a note with that tag (their `내 문체 메모`)?
4. `search_notes` with `q: "tilnote-news-topics"` and `tags: ["tilnote-news-topics"]` -
   the same, for their `내 뉴스 토픽`.
5. `list_books` - their books.
6. `search_notes` with `q: "tilnote-book-toc"` and `tags: ["tilnote-book-toc"]` -
   the 목차 notes of books made with this plugin, one per book.

Then, only if step 6 found a 목차 note, `get_note` the most recently updated one once.
Each chapter there has a `상태:` (`Status:`) line; the first `⬜` is the chapter to
offer next.

Stop there. This is a welcome, not an audit: no paging, no reading posts. Reading
their posts is writing-style's job, judging them is next-post's.

## 3. The overview - one message

Three parts, short enough to read without scrolling much:

1. **One line on what this is**, then **one line on where they stand**, using only what
   the tools returned. The counts come from the stats: give the all-time count, with
   the last year's after it when it differs ("올린 글 40편 (최근 1년 12편)"). Name what
   is missing only for the two notes you searched for (메모, 뉴스 토픽);
   for idea notes you saw only the newest 50, so mention ones you found and say
   nothing when there are none. An account with nothing in it gets "지금 계정: 아직
   비어 있어요", not a row of 없음.
2. **What they can ask for** - the seven, grouped as below, one line each: the name, a
   sentence in quotes they can say as is, and what happens in a few words. Pick each
   sentence for where they stand (table below). Then the line on what stays private.
3. **One first step**, chosen below, with its reason in one line, and **up to two
   things to continue** they already started. End with one question.

```text
틸노트 블로그는 대화로 글을 쓰고 내 틸노트 블로그에 올리는 도구예요. 버튼은 없고, 아래처럼 말하면 돼요.
지금 계정: 올린 글 40편 (최근 1년 12편) · 문체 메모 없음 · 뉴스 토픽 없음 · 책 1권

쓰기
- 함께 쓰기: "○○에 대해 블로그 글 써 보고 싶어" - 주제를 알아보고 묻지 않고 초안부터 쓴 뒤(내 생각·겪은 일 글은 짧은 질문 몇 개 먼저), 그 주제를 몇 줄로 설명해 줘요. 이어서 경험·생각을 말하면 글에 넣고, 물으면 답해요
- 내 문체 메모: "내 문체 기억해줘" - 내 말투를 메모로 남기고, 글을 쓸 때마다 먼저 읽어요

올린 뒤
- 글 업그레이드: "이 글 업그레이드해줘" - 올린 글 이후 달라진 걸 알려 주고, 대화하며 새 자료·내 경험을 더해 글을 키워요. 고친 건 언제든 되돌릴 수 있어요
- 소셜 공유: "스레드용으로 바꿔줘" - SNS마다 맞는 문구와, 공유 창 링크(글을 채워 주는 곳은 채워서)
- 다음 글 찾기: "다음에 뭐 쓰지?" - 내 글 반응을 보고 다음 글 후보 2~3개

꾸준히
- 뉴스 리더: "관심 토픽 등록해줘" - 등록해 두면 "뉴스 돌려줘"로 내 토픽 소식과 글 아이디어를 받아요
- 책 만들기: "○○ 책 만들어줘" - 목차를 먼저 짜고, 장은 볼 때 한 장씩 써요

초안·메모·브리핑은 모두 비공개 노트로 남고, "올려"라고 할 때만 공개돼요. SNS에 대신 올리지는 않아요.

처음엔 "다음에 뭐 쓰지?"부터 권해요. 올린 글과 노트를 보고 다음 글 후보를 골라 드리고, 하나 고르면 바로 초안을 써요.
이어서 할 것: "AI와 함께 쓰는 블로그" 1장이 아직 안 써졌어요 → "다음 장"

이걸로 시작해 볼까요? 다른 줄을 골라도 돼요.
```

For a user who doesn't write in Korean, the same message in their language, and the
sentences to say in English - these are the ones the skills answer to:

| Feature | Sentence |
|---|---|
| Write with me | "I'd like to write a blog post about X" |
| My writing style | "Remember my writing style" (with a memo: "From now on, never use 'delve'") |
| Upgrade a post | "Upgrade this post" (no post yet: "Polish this post") |
| Share a post | "Turn this post into a Threads post" |
| What to write next | "What should I write next?" |
| News reader | "Set up my news topics" (with topics: "Run my Tilnote news reader") |
| Make a book | "Make me a book on X" (with a book: "Show me my books") |
| To continue | "Next chapter", "Continue my X idea" |

The rest of the message in English:

| Part | In English |
|---|---|
| First line | Tilnote Blog lets you write posts by chatting and publish them on your Tilnote blog. There are no buttons - just say things like the lines below. |
| Account line | `Your account: 40 posts published (12 in the last year) · no writing style memo · no news topics · 1 book`; an empty account: `Your account: nothing here yet` |
| Groups | `Write`, `After you publish`, `Keep going` |
| No published post | `(after you publish)` after the name |
| What stays private | Drafts, memos and briefings all stay as private notes and go public only when you say "publish it". Nothing is posted to social networks for you. |
| First step | I'd start with "What should I write next?" - I'll pick candidates from your posts and notes, and once you choose one I'll draft it right away. |
| To continue | `To continue: chapter 1 of "…" isn't written yet → "Next chapter"`; an idea note → "Continue my <topic> idea" |
| Closing question | Shall we start there? You can pick any other line too. |

Sentences that fit where they stand:

| They have | Say instead |
|---|---|
| `내 문체 메모` | 내 문체 메모: "앞으로 '~요'로 써줘" - 메모에 규칙을 더해요 |
| `내 뉴스 토픽` | 뉴스 리더: "뉴스 돌려줘" - 내 토픽의 최근 소식을 글 아이디어와 함께 정리해요 |
| A 목차 note (tag `tilnote-book-toc`) | 책 만들기: "내 책 보여줘" - 만든 책과 목차를 보고 읽을 장을 골라요 |
| A 목차 note with a `⬜` chapter | in "이어서 할 것": the book's title, the first `⬜` chapter, → "다음 장" |
| An idea note (tag `tilnote-idea`) | in "이어서 할 것": its title → "<its topic> 글 아이디어 이어서" ("MCP 서버 글 아이디어 이어서") |
| No published post at all (`publishedPostsAllTime` 0) | 글 업그레이드: "이 글 다듬어줘" - 내가 쓴 글을 내 말투 그대로 손봐요. 소셜 공유 and 다음 글 찾기 stay, with "(글을 올린 뒤에)" after the name |

More on each feature, for when they ask about one: [references/features.md](references/features.md).

## 4. The first step - one, not a menu

The first row that fits:

| Where they stand | Recommend | Reason line |
|---|---|---|
| No published post at all (`publishedPostsAllTime` 0) | A first post. Ask what they learned, tried or fixed this week - that answer becomes the topic | "올린 글이 아직 없어서, 이번 주에 해 본 것 하나로 첫 글을 같이 써 보면 좋아요" ("You haven't published anything yet, so let's write a first post together about one thing you tried this week.") |
| Published posts | "다음에 뭐 쓰지?" | Candidates come from their own posts and notes, and picking one starts the draft |

For a first post, the closing question is that question ("이번 주에 배운 거나 해 본 것
하나만 알려 주세요" - "Tell me one thing you learned or tried this week."), not
"이걸로 시작해 볼까요?".

Never recommend "내 문체 기억해줘" as the first step, even with many posts and no memo.
Published posts are not necessarily the user's own writing - many are drafted with
AI, and some users have none they wrote themselves - and a memo learned from
AI-drafted posts teaches the AI's voice back to it. The memo stays in the list for
those who want it.

## 5. When they answer

- **Yes, a line, or one of the sentences** ("응", "2번", "뉴스 리더 해 볼래") → start
  that skill's flow right away, the way it would run if they had typed its sentence.
  Don't show the overview again and don't make them retype anything.
- **A topic for the first post** → write-post, starting from that topic.
- **A question about one feature** ("뉴스 리더가 뭐야?", "책은 어디서 봐?") → three or
  four lines from [references/features.md](references/features.md): what it does,
  what it keeps in Tilnote, one sentence to say. Then ask whether to try it.
- **"나중에 할게"** → one line: they can say "처음인데 뭐부터 해?" ("Where do I
  start?") any time. Stop.

If the next skill isn't available, carry on yourself the same way: save drafts
privately with no questions or blanks in them, never invent their experience, show a
memo before saving it, publish only on a clear yes.

## Don'ts

- Write nothing here - no `create_note`, `update_note`, `edit_note`,
  `append_to_note`, `publish_note` or `create_book`. The skill you hand over to asks
  before it saves, as it always does.
- One screen. Seven lines, not seven paragraphs; details only when asked.
- Only what this plugin does. Tilnote doesn't post to social networks, send email or
  run anything on its own; don't promise it. Don't explain the Tilnote website's
  buttons and menus - you can't see them.
- Account facts only from what the tools returned. Views are not part of the tour -
  next-post handles them.
- The user doesn't need the skill names (`write-post`); talking is enough. Give the
  slash form only if they ask for commands.
