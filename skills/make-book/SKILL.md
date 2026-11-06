---
name: make-book
description: Makes a Tilnote book the user wants to read, table of contents first. From a topic, researches how it is usually taught and ordered - official guides, syllabi, well-regarded books' contents, recent changes, where learners get stuck - and the user's Tilnote notes, then drafts a table of contents for their level and goal. On a yes, creates a private Tilnote book whose first page is a contents note with every chapter's plan; a chapter is written when the user picks it and goes into the book at its place. Use when the user says "make me a book on X", "I want to learn X from a book", "○○ 책 만들어줘", "○○ 책으로 공부하고 싶어", "책 목차 짜줘", "이 노트들로 책 만들어줘", or about their Tilnote books "show me my books", "내 책 보여줘", "Git 책 목차 보여줘", "show me chapter 3", "3장 보여줘", "next chapter", "다음 장", "책 이어서 읽자", "남은 장 다 써줘", "목차에 장 하나 추가해줘", "책 제목 바꿔줘". Not for recommending published books ("파이썬 책 추천해줘", "recommend a Python book") or a quick question about a topic - answer those normally. Not for a blog post or a series of posts.
---

# Make a book (책 만들기)

The user names a subject they want to read a book about. You research how the subject
is usually taught and ordered, look at what they already wrote in Tilnote, and draft a
table of contents for their level and goal. The table of contents is the main work
here: it decides what the book can be.

When they approve it, you make two things in their Tilnote, both private:

- **The 목차 노트** `"<책 제목>" 목차`, tagged `tilnote-book-toc`. It holds every
  chapter's plan and status, and it is the book's memory: any AI app with this
  plugin finds it by that tag and picks the book up from it. It is the book's first page, so the user sees the table of contents first. It
  stays private when they publish the book: the web's publish window leaves it
  unchecked unless they tick it.
- **The book.** After the 목차 page come the written chapters, in 목차 order.

No empty pages are made. A chapter is written when the user asks to see it - "3장
보여줘" - from its plan in the 목차 노트, and goes into the book at its place right
away: chapter 5 written before 3 and 4 makes the book 목차, 1, 2, 5, and 3 and 4 go
in between when they are written. Chapter numbers live in the 목차 노트; the book's
page list shows only titles. They read it on the book's page in their Tilnote (the
`/users/books/…` link the tools return).

Speak in the user's language. Examples are Korean because most Tilnote users are.
For a user who doesn't write in Korean, the fixed lines below have an English form
(next to them, or in "Fixed lines in English" at the end), the 목차 노트 uses English
labels ("In English" in [references/toc-note.md](references/toc-note.md)), chapters
are measured in words, and AI-sounding phrases are those in
[references/english-ai-tells.md](references/english-ai-tells.md). Dates are the
user's local date - Korean time for a Korean user.

Book and chapter titles go in double quotes ("Git, 명령어 너머"), in notes and replies
alike - never 《》 or 「」. Inside a sentence already in double quotes, use single
quotes ("'Git, 명령어 너머' 3장 보여줘").

**Private notes shape the book; they don't go into it.** The book is private, but the
user can publish it on the web, and its chapters go public with it by default (a
chapter added after that stays private until they tick it in the publish window). So
read any note to judge the reader's level, their questions and the angle, and name it
in a chapter's plan (the 목차 노트 stays private). A chapter's text takes material only
from published notes, linked by the `publicUrl` the tools return
(`https://tilnote.io/pages/…`); from a private note, no fact, sentence, number or name,
and no link. When the user asks to include their private notes ("비공개 노트도
넣어줘", or the notes they give for "이 노트들로 책 만들어줘"), the 목차 노트 gets the
line `- 비공개 노트: 장에 써도 돼요` (`- Private notes: OK to use in chapters` in a
note with English labels), and chapters may then use the private notes in
their plans - leaving out other people's names, clients or companies, contact
details, money and health - still without linking them. Asked in a later
conversation, add that line with one `edit_note` (`insert_after` the `함께 쓰는 예제`
line - `Running example:` in a note with English labels).

## Before anything else

1. Check that the Tilnote tools are there. If not:
   - **They only said they want to study or read about a subject** ("○○ 책으로 공부하고
     싶어") → answer normally with books to read, and end with one line:
     > 틸노트를 연결하면(주소 `https://tilnote.io/mcp`) 수준에 맞춘 책을 만들어 드릴 수 있어요.

     In English:
     > Connect Tilnote (address `https://tilnote.io/mcp`) and I can make you a book at your level.
   - **A new book or its table of contents** ("쿠버네티스 책 만들어줘", "○○ 책 목차
     짜줘") → draft the table of contents in the chat as in "Drafting the table of
     contents", steps 2-5 - no notes to look in and no tags to check - and instead of
     "이대로 책을 만들까요?" end with one line:
     > 틸노트를 연결하면(주소 `https://tilnote.io/mcp`) 이 목차로 비공개 책을 만들고, 읽고 싶은 장을 그때그때 써서 넣어 드려요.

     In English:
     > Connect Tilnote (address `https://tilnote.io/mcp`) and I'll make this a private book and write each chapter when you want to read it.

     Changes they ask for are made to the draft in the chat; don't repeat the line.
   - **Anything else** - their books, a chapter, a change to a book, making the book
     from a draft, "이 노트들로 책 만들어줘" → say in one line that Tilnote isn't
     connected yet and where to connect it (only the place in the app you are in - the app's connection settings, `/mcp` in a
     terminal app, Plugins → Tilnote Blog in ChatGPT or the Codex app, address
     `https://tilnote.io/mcp`), and stop.
2. Pick the part of this skill that fits:

| The user says | Go to |
|---|---|
| "쿠버네티스 책 만들어줘", "○○ 책 목차 짜줘", "이 노트들로 책 만들어줘", "make me a book on X" | Drafting the table of contents |
| "○○ 책으로 공부하고 싶어", "○○에 대한 책 보고 싶어", "I want to learn X from a book" - neither making one nor Tilnote is mentioned | Ask once: "읽을 만한 책을 추천해 드릴까요, 아니면 수준에 맞춘 책을 틸노트에 만들어 드릴까요?" If the reader's level or goal is open in a way that changes the book, put that choice in the same message ("만든다면 ① 처음 배우는 입문서 ② 실무에 바로 쓰는 책 중 어느 쪽인지도 알려 주세요"). Recommendations → answer normally, without this skill. Made → Drafting |
| After a table of contents draft: "좋아, 이대로 만들어줘", "5장이랑 6장만 바꿔서 만들어줘", "Looks good, make it" | Making the book |
| After a draft of chapters to add to an existing book: "좋아", "추가해줘" | Changing the table of contents → continuing an existing book (never `create_book`) |
| "내 책 보여줘", "Git 책 목차 보여줘", "책 어디까지 썼지?", "show me my books" | Browsing books |
| "3장 보여줘", "다음 장", "Git 책 이어서 읽자", "show me chapter 3", "next chapter", "keep reading my Git book" | Showing a chapter |
| "남은 장 다 써줘", "Git 책 남은 장 이어서 써줘", "write the remaining chapters" | Writing several chapters |
| While reading: "이 부분 이해 안 돼", "예시 하나 더" | Questions while reading |
| "장 하나 추가해줘", "4장은 빼줘", "3장 내용 바꿔줘", "순서 바꿔줘" | Changing the table of contents |
| "책 제목 바꿔줘", "책 소개 바꿔줘" | `update_book` with the book's id - the end of the 목차 노트's `책:` address ("Find the book and the 목차 노트", steps 1-2), or from `list_books` for a book made on the web - and only what changes: `title`, or a `description` as in "Making the book" step 4. When they didn't give the new text, suggest it and change it on a yes. For a new title, also rename the 목차 노트 to `"<새 제목>" 목차` (`"<New title>" contents` when the note's title ends in `contents`; `edit_note` with `title`, and in the same call `replace` the old title in its `> [!NOTE]` line's sample sentence); the book's tag stays as it is. On a published book, say the new text is public right away. |

## Drafting the table of contents

How to research and build it is in
[references/toc-research.md](references/toc-research.md). Read it before you start.
In short:

1. **Look in Tilnote first.**
   - The books made here (`search_notes` with `q` and `tags` `tilnote-book-toc`) and
     `list_books` - its first page is enough; don't page through. If a book on the
     same subject exists, look for its 목차 노트 (see "Find the book and the 목차 노트",
     step 2). With one, say so and ask whether to
     continue that book or make a new one. To continue: open it ("Find the book and
     the 목차 노트"), say where it stands (chapters written, the first `⬜`), and offer
     that chapter. Draft new chapters only for something the 목차 doesn't cover - only
     those chapters, in the 목차 노트's brief and style, keeping the book's title, each
     with where it goes ("4장 다음") - and ask `이 장들을 "…" 목차에 더할까요?`
     (`Add these chapters to the contents of "…"?`) instead
     of "이대로 책을 만들까요?". If you
     already asked the recommend-or-make question, don't ask again: draft the
     new book and put one line at the top of the draft, `이미 "…" 책이 있어요. 그
     책을 이어 읽으시려면 "'…' 이어서 읽자"라고 해 주세요.` (`You already have a book,
     "…". To keep reading it, say "Keep reading '…'".`) Without a 목차 노트, the
     book was made another way and can't be continued here; mention it, make a new
     one, and use its pages as material like any other note. Either way, a book
     already on the subject doesn't steer the new one - people read a subject again.
     Draft for this request as if it weren't there: don't build around it, and don't
     leave something out because it covers it.
   - `search_notes` with two or three wordings of the subject: what they already know,
     what they care about, and notes a chapter can build on.
2. **Pin the brief.** Topic, who reads it, what they want to be able to do after it,
   how long, and language. Take what the request and their notes already say. Ask one
   short question only when the reader's level or goal is still missing and two
   readings would give very different books ("파이썬 책" - first program, or data
   work?). If you came here through the recommend-or-make question, that was your one
   question: use their answer, or state your assumptions in the draft. Otherwise state
   your assumptions in the draft and go.
3. **Map the subject on the web** if you can search: how it is usually structured,
   what changed recently, and where learners get stuck. Open the pages you rely on.
   Search with topic words, product names and the facts to check - never people's,
   clients' or companies' names or other details from a private note.
   If you can't search, say once that the draft is from what you already know and that
   recent changes weren't checked, and go on.
4. **Build the table of contents** from what you found: the core most sources share,
   chosen and ordered for this reader. Never copy one source's table of contents. The
   book's tag is the title without punctuation, and it must be new: it may not match
   a book step 1 saw or a tag already on the user's notes (compare with the tags
   step 1 returned, then one `search_notes` with `q` and `tags` set to it). So a second
   book on a subject gets its own title ("Git, 명령어 너머 - 실무편"), and a book titled
   just "Git" becomes "Git, 명령어 너머".
5. **Show the draft** in one message, in the shape in
   [references/toc-research.md](references/toc-research.md), and ask: "이대로 책을
   만들까요? 빼거나 더할 장, 순서, 깊이를 말씀해 주세요. 전체 방향이 다르면 그것도
   말씀해 주세요." (In English: "Shall I make the book like this? Tell me any chapters
   to drop or add, and changes to the order or depth. If you had a different direction
   in mind, tell me that too.")

Nothing is created in Tilnote while drafting. Adjust on feedback and show what changed;
show the whole draft again only after big changes. A new direction is a new draft:
research again where it needs to, and show it whole.

## Making the book

On a clear yes to a draft. A yes that comes with small changes ("좋아, 5장이랑 6장만
바꿔줘") is still a yes: apply them and name them in the report.

1. **Settle the plans.** Every chapter needs the plan in
   [references/toc-note.md](references/toc-note.md). If the user only saw one line per
   chapter, write the rest now from the approved lines and the sources behind the draft
   - don't ask again or search again. After any reorder, check 먼저 읽을 장 again: no
   chapter may need a later one.
   If a requested change breaks that, say so in the report and how you handled it.
2. **The book's tag** is the book title without punctuation (at most 50 characters):
   `Git, 명령어 너머` → `Git 명령어 너머`. The 목차 노트 and every chapter carry it.
   Later conversations take it from the 목차 노트's tags (the one that isn't
   `tilnote-book-toc`); they never work it out again from the title (the book may
   have been renamed).
3. **Make it once.** `list_books`: if this conversation already made the book, reuse
   it. If another book gives the same tag, or a note already carries it (repeat the
   tag check from Drafting step 4 if the title changed or you can't see that check in
   this conversation), add a distinguishing word to
   the title and say so in the report.
4. `create_book` with the book title and a `description` of at most 500 characters:
   the promise and who it is for, written for someone reading the published book. It
   becomes the public blurb if the user publishes the book (`update_book` can change it
   later, and on a published book the change is public at once), so mention nothing
   private (not the 목차 노트). The book is private.
5. **The 목차 노트.** `create_note` titled `"<책 제목>" 목차` (`"<Book title>" contents`
   in English), with the tags
   `["<책 태그>", "tilnote-book-toc"]` and `aiGenerated: true`, in the shape in [references/toc-note.md](references/toc-note.md),
   starting with the `책:` (`Book:`) line holding the `url` that `create_book` returned. Every
   chapter is `⬜ 아직 안 씀` (`⬜ not written yet`).
6. `add_page_to_book` with the 목차 노트. It is the book's first page; chapters come
   after it.
7. **Write no chapter yet**, and make no other notes or pages.
8. **Report** in a few lines:

```
"쿠버네티스, 도커 다음 단계" 책을 만들었어요. 비공개예요.
- 책: https://tilnote.io/users/books/…
- 목차: https://tilnote.io/home?pages=…

지금 책에는 목차 한 페이지만 있어요. 장마다 다룰 내용을 거기 적어 두었어요.
"1장 보여줘"라고 하시면 그때 1장을 써서 책에 넣어요. 순서대로 읽지 않아도 돼요.
(5장과 6장 순서를 바꿔서 만들었어요.)

1장부터 볼까요?
```

## Browsing books

"내 책 보여줘", "Git 책 목차 보여줘", "책 어디까지 썼지?": show their books and a
table of contents to pick a chapter from. Nothing is written here.

1. **The books.** `search_notes` with `q: "tilnote-book-toc"`, `tags:
   ["tilnote-book-toc"]` and `limit: 50` - one 목차 노트 per book - and `list_books`.
   Sort the 목차 노트 by their `updatedAt`, newest first (search results aren't in
   date order): the newest is the book they last wrote in or changed. A book in
   `list_books` whose address is in no 목차 노트's `책:` line was made on the web; it
   can't be continued here.
   - No 목차 노트: say no book has been made here yet, and offer to make one ("○○ 책
     만들어줘").
   - They named a book, or there is only one: show its contents (step 2), no list.
   - Otherwise list up to five, newest first, one line each (`get_note` each 목차
     노트 you list), then show the first book's contents (step 2):
     `1. "Git, 명령어 너머" — 8장 중 3장 씀 · 다음: 3장 "브랜치는 이름표일 뿐이다"`
     (none written: `6장 중 아직 안 씀 · 다음: 1장 "…"`).
   - Books made on the web get one line after the list or the contents: `웹에서 만든
     책 "여행 기록"은 목차 노트가 없어서 여기서 장을 쓰지는 않아요.`
2. **A book's contents.** Find the book and the 목차 노트 (next section, steps 1-4),
   then one line per chapter: number, title (no quotes needed in this list), and `✅`
   or `아직 안 씀`. Leave out the plans; on "자세히", add each chapter's 한 줄 and 다룰
   것. When you listed several books, the last line also says how to see another
   one's contents ("다른 책 목차는 책 이름을 말씀해 주세요").

```
"Git, 명령어 너머" 목차예요. 8장 중 3장을 썼어요.
- 책: https://tilnote.io/users/books/…
- 목차 노트(장마다 계획): https://tilnote.io/home?pages=…

1. 커밋은 스냅샷이다 ✅
2. 스테이징 영역은 왜 있을까 ✅
3. 브랜치는 이름표일 뿐이다 — 아직 안 씀
4. 병합과 충돌 다루기 ✅
…

읽고 싶은 장을 번호나 제목으로 말씀해 주세요. 쓴 장은 바로 보여 드리고, 안 쓴 장은
그때 써서 책에 넣어요.
```

3. **Their pick** - "3장", a chapter title, "다음", or another book's name - goes to
   "Showing a chapter", or back to step 2 for that book.

## Showing a chapter

### Find the book and the 목차 노트

1. If this conversation made or opened the book, use it.
2. Otherwise `search_notes` with `q: "tilnote-book-toc"` and `tags:
   ["tilnote-book-toc"]` - the 목차 노트, one per book - and take the one whose title
   matches the user's words. A loose name ("Git 책") is fine when only one matches; if
   two could match, ask which. If none matches, `list_books`: when the matching book's
   first page (`get_book`) is one of those 목차 노트, the book was renamed on the web -
   use it, and offer once to rename the note to `"<새 제목>" 목차` (`"<New title>"
   contents` when the note's title ends in `contents`; `edit_note` with
   `title` and `operations: []`). Otherwise go to step 3.
   `get_note` the 목차 노트; its `책:` line gives the book, and its other tag (not
   `tilnote-book-toc`) is the book's tag.
3. A book with no 목차 노트 was made another way: say "이 책은 목차 노트 없이 만든
   책이라 여기서 장을 이어 쓸 수 없어요," and offer to draft a new book that uses its
   pages as material. Don't make a 목차 노트 for it or add pages to it.
4. **Check the book against the 목차** when the book wasn't made in this conversation,
   and whenever the user says they changed it in the book editor: `get_book` with the
   id at the end of the `책:` address. A chapter's pageId is the `pages=` value in its
   읽기 link. The book's pages should be the 목차 노트, then exactly the `✅` chapters
   in 목차 order.
   - The 목차 노트 missing from the book: the user may have taken it out on purpose.
     Say so once and offer to put it back as the first page (`add_page_to_book` with
     `position: 1`); until then, count positions without it.
   - A page whose pageId is in no 읽기 link but whose title is exactly a `⬜`
     chapter's title (a run stopped before the 목차 노트 was saved) → `get_note` it. If
     it carries the book's tag, the chapter is written and in the book: mark it `✅`
     with the `url` get_note returned and the date from its `createdAt` (the user's
     local date), and add its terms.
   - Written chapters in a different order, or a page title that differs (the user
     moved or renamed it on the web) → the book wins: reorder or retitle those
     chapters in the 목차 to match, keep each `⬜` chapter right after the chapter it
     followed, and renumber. Say what changed.
   - A `✅` chapter missing from the book → ask whether to move it to `## 뺀 장` or put
     it back at its place ("Put it in the book").
   - Any other page in the book that isn't in the 목차 → tell the user what it is and
     ask: take it out of the book (`remove_page_from_book`; the note stays), or add it
     to the 목차 as a `✅` chapter at its place in the book. Add nothing to the book
     until it is sorted out.
   Save fixes with one `edit_note` on the 목차 노트, then run "Fix chapter references"
   (under "Changing the table of contents").
5. Map the user's words to a chapter in the 목차 노트:
   - "3장", "세 번째 장", a chapter title → that chapter. The book's page list shows
     only titles, starts with the 목차 page and skips chapters not written yet, so a
     page number the user counted there ("네 번째 페이지") is not a chapter number:
     find that page in `get_book` and take its chapter by title. Ask if it is unclear
     which they mean.
   - "다음 장", "이어서" → the chapter the last reply offered as next (to read or to
     write); without such an offer, the chapter after the last one shown in this
     conversation; in a new conversation, the first chapter marked `⬜`.
   - A chapter listed under `## 뺀 장` was taken out: say so, give its link if it has
     one, and ask before doing anything with it.

### If the chapter is already written

Its 상태 line has `✅` and a link. `get_note` that page and reply - don't
rewrite it. The three lines come from the chapter's own sections, not from its plan:

```
2장 "스테이징 영역은 왜 있을까"는 10월 27일에 써 둔 장이에요.
https://tilnote.io/home?pages=…

- 작업 폴더·스테이징·저장소 세 곳
- git add -p로 골라 담기
- git status 읽는 법

다음 3장 "브랜치는 이름표일 뿐이다"는 아직 안 썼어요. "다음"이라고 하시면 써요.
```

Rewrite only if they ask, after saying the current text will be replaced (Tilnote keeps
the earlier version for 30 days); then `update_note` that page's `content`.

### If it is `⬜`, write it

Say one line first ("3장을 쓰고 있어요. 1~2분 걸려요."), then follow
[references/page-writing.md](references/page-writing.md):

1. **Guard against a double.** `search_notes` with the chapter's title and `tags` set
   to the book's tag. If a note with
   exactly that title and the book's tag exists - a run that stopped before updating
   the 목차 노트 - use it: the chapter is written (with that note's `url` and the date
   from its `createdAt`, the user's local date). Go to step 5.
2. Read what the chapter needs: its plan and the top of the 목차 노트, and the
   chapters around it that are written.
3. Look up what moves - versions, commands, numbers, dates, rules - if you can search,
   and open what you cite. Check the user's notes for the chapter's key points.
4. Write it in the shape in the reference, about 10 minutes of reading, and save it:
   `create_note` titled with the chapter title only (no number), with the book's tag
   and `aiGenerated: true`.
5. **Put it in the book** (next section).
6. **Update the 목차 노트**: one `edit_note` - its 상태 line becomes `✅`, and its new
   terms. Exact lines, and how to point at them, are in
   [references/toc-note.md](references/toc-note.md). If that fails, say so; the
   chapter itself is saved and in the book.
7. Reply (below).

### Put it in the book

The book holds the 목차 page, then the written chapters in 목차 order. A chapter goes
in at its place as soon as it is written, whether or not the chapters before it are.

`add_page_to_book` with `position`: 1 for the 목차 page, plus one for each `✅`
chapter before it in the 목차, plus one. Chapter 5, with chapters 1 and 2 in the book
and 3 and 4 not written: 1 + 2 + 1 = 4. Leave out the 1 for the 목차 page when it
isn't in the book. Positions are counted from the book as it is, so if the book wasn't
checked in this conversation yet, check it first (step 4 above). The result says where
the page landed; if that isn't the place you counted, `get_book` and check again.

If the book is published (`get_book` says `publish: true`, or the `add_page_to_book`
result has a `publicUrl`), the chapter still goes in as a private note, so the book's
readers don't see it yet: the web's publish window checks only chapters that are
already public. Say so in the reply in one line - `책이 공개돼 있어서 이 장은 아직
독자에게 안 보여요. 웹에서 책 공개 창을 열고 이 장을 체크하면 보여요.` - and don't call
`publish_note` for it.

Put a chapter in the book this way only, at its place.

### Replying about a chapter

- Give the links the tools returned; don't build one. Don't paste the whole chapter
  into the chat - it is in Tilnote. If they say "여기서 보여줘", show it in full.
- End with what comes next: the next chapter to read if it is written, and the first
  `⬜` chapter as the next to write.

After writing a chapter that went into the book:

```
3장 "Pod 하나로 시작하기"를 써서 책에 넣었어요.
https://tilnote.io/home?pages=…

- 컨테이너 대신 Pod를 띄우는 이유
- 명령 한 줄과 YAML 파일로 띄우기의 차이
- Pod가 죽으면 다시 안 살아난다는 것 (→ 4장)

다음은 4장 "죽어도 다시 살아나는 앱"이에요. "다음"이라고 하시면 이어서 쓸게요.
```

When chapters before it aren't written yet, say where it sits in the book and how to
fill the gap: "3·4장은 아직 안 써서, 책에서는 "스테이징 영역은 왜 있을까" 바로 다음에
있어요. 3·4장은 쓰면 그 사이에 들어가요. 빈 곳부터 채우시려면 "3장 보여줘"라고 해
주세요."

When the next chapter is already written, point to it to read, with its link, and to
the first `⬜` chapter by number as the next to write: "다음 4장 "병합과 충돌 다루기"는
써 둔 장이에요(링크). 그다음 안 쓴 장은 5장이에요."

### Chapters that depend on unwritten ones

If the asked chapter builds on chapters not written yet, write it anyway: the user
asked for it. Its opening explains, in a sentence or two, the idea it assumes - not
just where it is covered - worded so it still reads naturally once those chapters
exist (`브랜치는 커밋에 붙은 이름표이고, HEAD는 지금 내가 선 자리를 가리켜요. 자세한
건 "브랜치는 이름표일 뿐이다"에서 다뤄요.` - in English, `A branch is a label on a
commit, and HEAD points to where you are now. "Branches are just labels" covers this in
detail.`). Never write "먼저 쓴 장이라" ("since this chapter was written ahead of the
others") or similar notes about how the book is being made. Don't write the other
chapters unasked.

## Writing several chapters

"다 써줘", "남은 장 다 써줘", "Git 책 남은 장 이어서 써줘": write the `⬜` chapters
in order, each through the steps above, with a one-line progress note after each.
After four chapters in one conversation, stop and say where you stopped and that
"'<책 제목>' 남은 장 이어서 써줘" in a new conversation picks up from there - the 목차
노트 keeps the status.

## Questions while reading

Answer in the chat, for the reader the 목차 노트 describes. If the answer fills a real
gap in the chapter, offer once: "이 설명을 3장에 덧붙일까요?" On a yes: one
`edit_note` on the chapter that inserts a short `### 더 알아보기: <질문>` section
(`### Going further: <question>` when the chapter's headings are English) -
`insert_before` with `section` set to the chapter's recap heading as it has it
(`"정리"` or `"Recap"`), or `append` with no address when the chapter has no recap
heading. Never rewrite the rest of the chapter for it.

## Changing the table of contents

Order of work for every change: first find the book and the 목차 노트 ("Find the book
and the 목차 노트", steps 1-5 - this checks the book before any chapter number the user
says is used); then make the book calls the change needs; then "Fix chapter
references"; then save the change in one `edit_note` on the 목차 노트, as in
[references/toc-note.md](references/toc-note.md), "Updating it". Keep the 목차 numbered
1, 2, 3 … in order, and check 먼저 읽을 장 again: numbers updated, and no chapter
needing a later one.

- **Chapters not written yet** (`⬜`) - add, remove, rename, reorder or change their
  plans freely. The book doesn't change.
- **Moving written chapters** (`✅`) - `add_page_to_book` with the chapter's pageId
  and the `position` it should end up at, counted as in "Put it in the book" but in
  the new order; a page already in the book moves there. One chapter moved: one call.
  Several moved: walk the new 목차 from the top and give each `✅` chapter its
  position in turn (skip one already in place). Then `get_book` to see the order is
  right.
- **Renaming a written chapter** - `edit_note` on the chapter with `title` and
  `operations: []`, then `add_page_to_book` with it and no `position`: the book keeps
  its own copy of each title, and adding the page again refreshes it.
- **Changing what a written chapter covers** ("5장 헬름 말고 kustomize로") is a
  rewrite. Say the current text will be replaced (Tilnote keeps the earlier
  version for 30 days). On a yes: update its plan, rewrite it following
  [references/page-writing.md](references/page-writing.md), `update_note` that page's
  `content`, and replace its terms in 지금까지 나온 용어. On a no, leave the plan as it
  is - the plan must describe the text that exists.
- **Removing a chapter:** confirm first. If it is in the book, `remove_page_from_book`
  (the note stays; delete it only if they ask). Move its line out of the 목차 to
  `## 뺀 장` (format in [references/toc-note.md](references/toc-note.md)) and renumber
  the rest.
- **Continuing an existing book** (after `이 장들을 "…" 목차에 더할까요?` got a yes):
  add only the new chapters as `⬜`, each where the draft placed it. Never
  `create_book`; the title and tag stay.

**Fix chapter references** after any change that adds, renumbers, removes, renames or
moves chapters (yours or the user's on the web). Written
chapters name other chapters by title, but their closing line names the next chapter.
For each written chapter (`✅`) whose next chapter changed, or that names a
renamed, moved or removed chapter: `get_note` it, then one `edit_note` on it that
fixes only those lines, each by `find` quoted as the chapter has it - the closing
`다음 장 "…"` line (`Next, "…"` in English), a newly last chapter's ending, a
former last chapter's what-to-read-next line, or the quoted title (older chapters may
have it in 「」; write the fixed one in double quotes). A new closing line is one
sentence on what the new next chapter does, from its `한 줄`. Change the `(N장)` in
지금까지 나온 용어 too, in place (a removed chapter's terms say `(뺀 장)`). This is not
a rewrite; name the fixed chapters in the report.

## When a tool refuses

| Error | What to do |
|---|---|
| `Book not found` / `Note not found` | Run `list_books` / `search_notes` again; it may have been deleted. Say so. |
| `was not found` / `no longer matches` / `The note changed since you read it` / `matches only the start of the heading` | The user changed the note meanwhile. `get_note` it again and redo the edit once, with the new `revision`. If it says the change is already there, an earlier call saved it - don't send it again. |
| Write scope missing | Tell the user to reconnect Tilnote and allow write access. |
| Anything else | Say what failed in one line. What was saved before it stays saved. |

## Don't

- Don't create anything in Tilnote before the user says yes to a table of contents.
- Don't make empty or placeholder pages. The only page that isn't a written chapter
  is the 목차 노트, first.
- Don't copy a book's or course's table of contents, chapter titles or wording. Use
  sources to learn what belongs and in what order, then write your own.
- Don't write a chapter the user didn't ask to see, and don't overwrite a written one
  without asking.
- Don't add a chapter to the book except at its place ("Put it in the book").
- Don't invent sources, numbers, quotes or first-person experiences. A sentence
  without a source is better than a made-up one.
- Don't publish the book or its pages, even when a tool result says a chapter needs
  `publish_note`. Publishing a book is done on the web when the user wants to; the
  publish window leaves the 목차 노트 unchecked, so it stays private unless they tick
  it.

## Fixed lines in English

For a user who doesn't write in Korean, the fixed lines above read:

| Where | In English |
|---|---|
| Recommend or make (routing table) | "Shall I recommend some books to read, or make you a book at your level in Tilnote?" - with the level choice: "If I make one, also tell me which kind: ① a first introduction ② a practical book for work." |
| Making the book, report | `I made the book "…". It's private.` / `- Book: …` / `- Contents: …` / `For now the book has only the contents page, with each chapter's plan. Say "Show me chapter 1" and I'll write it then and put it in the book. You don't have to read the chapters in order.` / `(I swapped chapters 5 and 6.)` / `Shall we start with chapter 1?` |
| Browsing, one line per book | `1. "…" — 3 of 8 chapters written · next: Chapter 3 "…"` (none written: `none of 6 written yet · next: Chapter 1 "…"`) |
| Browsing, a book made on the web | `The book "…" was made on the web and has no contents note, so I don't write its chapters here.` |
| Browsing, a book's contents | `Contents of "…". 3 of 8 chapters written.` / `- Book: …` / `- Contents note (each chapter's plan): …` / each chapter `✅` or `— not written yet` / `Tell me which chapter you'd like to read, by number or title. If it's written, I'll show it right away; if not, I'll write it then and put it in the book.` / several books: `For another book's contents, tell me its name.` |
| No contents note (Find, step 3) | `This book was made without a contents note, so I can't continue its chapters here.` |
| A written chapter | `Chapter 2 "…" was written on Oct 27.` / `Chapter 3 "…" isn't written yet. Say "next" and I'll write it.` |
| Before writing | `I'm writing chapter 3 now. It takes a minute or two.` |
| After writing | `I wrote chapter 3 "…" and put it in the book.` / `Next is chapter 4 "…". Say "next" and I'll write it.` |
| Chapters before it unwritten | `Chapters 3 and 4 aren't written yet, so in the book it comes right after "…". They go in between when they're written. To fill the gap first, say "Show me chapter 3".` |
| Next chapter already written | `Next is chapter 4 "…", already written (link). The next chapter not written yet is chapter 5.` |
| Published book | `The book is public, so readers can't see this chapter yet. To show it, open the book's publish window on the web and tick this chapter.` |
| Stopping after four | `To pick up from here in a new conversation, say "Write the remaining chapters of '<Book title>'".` |
| Questions while reading | `Shall I add this explanation to chapter 3?` |
