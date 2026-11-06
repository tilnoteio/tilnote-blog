# Researching and building the table of contents

A book is as good as its table of contents. A weak one gives ten pages that read like
ten blog posts. A good one starts where the reader is, takes them one step at a time
to what they wanted, and slows down where people usually get lost. The research below
finds those three things: what belongs, in what order, and where readers get stuck.

## 1. Tilnote first

- The books made here (tagged `tilnote-book-toc`) and the first page of `list_books`.
  A book on the same subject → look for its 목차 노트 (SKILL.md "Find the book and the
  목차 노트", step 2). With one, offer to continue that book instead. Without one, the
  book was made another way: mention it, draft a new one, and treat its pages as notes
  (below). Either way it doesn't steer the new book - no building around it, nothing
  left out because it covers it.
- `search_notes` with two or three wordings: the Korean term, the English term, a core
  sub-topic ("핸드드립", "pour over", "분쇄도"). Open the two or three notes that
  matter with `get_note`.
- What the notes tell you:
  - **Level.** Notes on the basics mean the basics get a short recap, not a chapter.
  - **Angle.** What they keep writing about is what the book should lean toward.
  - **Questions.** A question they wrote down ("분쇄도를 바꿔야 하나?") is a key point
    the book must answer.
  - **Material.** A note that covers a chapter's point is named in that chapter's plan
    ("바탕이 될 내 노트"). When the chapter is written, a published one is material
    and linked; a private one only shapes it (SKILL.md, "Private notes shape the
    book").

### "이 노트들로 책 만들어줘"

The notes are the main material, so collect them all - the two-or-three limit above is
for a book on a topic.

- If the user pointed at notes, use exactly those: notes from this conversation or a
  list they gave; a tag (`search_notes` once per wording, with `tags: ["<tag>"]`); a
  period (go through `list_notes` pages until the dates pass it).
- Otherwise `search_notes` with several wordings and `limit: 50`; when results thin
  out, try a new wording. If you can't tell which notes they mean, ask once: "어떤
  노트들을 말씀하시는 거예요? 주제나 태그, 기간을 알려 주세요." (In English: "Which
  notes do you mean? Tell me a topic, a tag or a date range.")
- `get_note` every note whose excerpt doesn't show what it covers.

Group them by theme; each group is a chapter candidate. Then check the groups against
the web map (step 3) for what a reader would miss between them; those gaps become key
points or chapters to research. Every chapter's plan lists the notes it builds on.

Here the user asked for their notes, private ones included: the 목차 노트 gets the line
`- 비공개 노트: 장에 써도 돼요` (`- Private notes: OK to use in chapters` in English
labels; SKILL.md, "Private notes shape the book").

In the draft, say how many notes you found and which you left out as off-topic, and
add one line above the closing question: "장은 이 노트들을 바탕으로 새로 써요. 노트는
그대로 두고, 공개한 노트는 각 장에서 링크해요. 다른 사람 이름이나 회사, 돈·건강
이야기는 장에 넣지 않아요." (In English: "I'll write new chapters based on these notes.
Your notes stay as they are, and chapters link to the ones you've published. Other
people's names, companies, and anything about money or health stay out of the
chapters.") If they want their notes themselves as the book's
pages, say this skill writes new chapters from them, and that they can put existing
notes into a book themselves in Tilnote's book editor on the web.

## 2. The brief

Settle six things. Most come from the request and the notes you just read:

| | Default when unsaid |
|---|---|
| 주제 | always given (for "이 노트들로", from the notes) |
| 누구를 위한 책: level, and what they already know | the user, at the level their notes and words suggest |
| 다 읽으면 할 수 있는 것 | the most common goal for this reader and subject |
| 분량 | 8-10장, 장마다 10분 안팎 (3,000-5,000자; in English 1,100-1,800 words) |
| 언어 | the user's |
| 말투 | ~요체, 처음 나오는 말은 풀어서; in English, plain and friendly, new terms explained (or the user's own wish) |

Ask one short question only when the level or goal is still missing and the books
would differ a lot. Offer choices so it is quick to answer:

> 어떤 책이면 좋을까요? ① 처음 배우는 입문서 ② 실무에 바로 쓰는 책 ③ 원리를 깊게
> 파는 책 - 다 읽고 나서 하고 싶은 일도 한 줄로 알려 주시면 거기에 맞춰 짤게요.

In English:
> What kind of book would you like? ① a first introduction ② a practical book for work
> ③ a deep dive into how it works - and if you tell me in one line what you want to do
> once you've read it, I'll build the book around that.

Otherwise don't ask. Write your assumptions at the top of the draft, where the user can
correct them.

## 3. Map the subject on the web

Only if you can search. Do three passes, about one to three searches each, and rely on
four to eight pages you could actually read (a page that failed to open doesn't
count). Search in English as well when the subject is global. Use local sources for
subjects tied to the user's country: law, tax, public programs, local markets - Korean
sources for a Korean user.

| Pass | Search for | What it gives |
|---|---|---|
| Structure | the official learning path or tutorial order, university course syllabi (`syllabus`, `강의계획서`), tables of contents of well-regarded books (publisher or bookstore pages), established course curricula | what experts treat as the core, and in what order |
| Recent changes | `<주제> <this year> changes`, release notes, deprecated, 개정, 새 버전, 요즘 | what must be current; what to drop or only mention |
| Sticking points | 자주 하는 실수, 헷갈리는 개념, FAQ, common mistakes, community questions | where to slow down: its own chapter, or a key point |

Prefer official, university, publisher and well-known course pages. Skip SEO lists and
pages that look machine-written. Some subjects (a craft, a hobby) have no syllabus or
book contents online; then use official guides from makers, associations or
well-known schools, and say under 뼈대 (`Structure`) in the draft what the order rests on. For each page you rely on, keep its exact title, URL
and one line on what you took from it. Only those pages go in "참고한 자료" (`Sources`).

Some subjects barely change (a classic, a craft). Then the recent-changes pass is one
search, and the draft says nothing changed that matters, rather than inventing news.

**No search:** build from what you know, and say once in the draft: "웹 검색을 쓸 수
없어서 제가 아는 내용으로 짰어요. 최근 바뀐 점은 확인하지 못했어요." (In English: "I
couldn't search the web, so I built this from what I know. I haven't checked recent
changes.") Leave "참고한 자료" out rather than list pages you never opened.

## 4. Build it

- **Core.** A topic that shows up in at least two structure sources belongs in the
  book.
- **Choose by the goal.** Practical → tasks the reader will do. Deep → how things
  work. Exam → the exam's scope. Drop what doesn't serve the goal, even if every source
  has it - and name what you dropped in the draft, so the user can ask for it back.
- **Sticking points.** A big one gets its own chapter. A small one becomes a key point
  of the chapter where it bites.
- **Current.** Teach today's way. The old way appears only where readers will still
  meet it, as a contrast.
- **Order.** For each chapter, note which earlier chapters it needs. No chapter needs
  a later one. If two need each other, they are one chapter.
- **Chapter 1 starts where the reader is**: their problem, or a first small win. Not
  history, not a list of definitions. History goes where it explains something.
- **A running example** for practical subjects: one example that grows through the
  book. Build it from the user's own situation when their notes show one. Name it in
  the draft.
- **Size.** 8-10 chapters by default; anywhere from 6 to 12 when the goal needs it.
  3-5 key points each. Under 5 chapters is a long post - say so. Over 12 is two books,
  or chapters that should be key points.
- **Titles.** Short (about 25 characters; in English about 3-7 words), and say what
  the reader gets or asks - "Pod" → "Pod 하나로 시작하기" ("Starting with a single
  Pod"). No numbers: the number lives in the 목차.
- **Your own work.** The order and titles are yours. Never take one source's chapter
  list, chapter titles or wording - that is someone else's work, and it would also
  ignore this reader.
- **The promise.** One sentence: "이 책을 다 읽으면 ~할 수 있어요." ("After this
  book, you can ...")

For each chapter, keep for the 목차 노트: title, one line, goal (what the reader can do
after it), 3-5 key points, the chapters it needs, what to look up when writing, and the
user's notes it builds on.

Before showing, check:
- The promise is reachable: everything it needs is covered by some chapter.
- Every chapter moves the reader toward the promise.
- Every idea a chapter relies on is taught in that chapter or an earlier one. No
  chapter needs a later one.
- No two chapters make the same point.
- Every question the user wrote in their notes is answered somewhere.
- A reader at the stated level can start chapter 1 without help.

## 5. The draft

One message. Title, one line per chapter, then how it was made. Don't list key points
for every chapter - the draft gets too long to judge. Offer them instead.

```
"쿠버네티스, 도커 다음 단계"
- 이 책을 다 읽으면: 내 앱을 쿠버네티스에 올리고, 고장 났을 때 어디를 봐야 할지 알 수 있어요.
- 누구를 위한 책: 도커로 컨테이너는 띄워 봤지만 쿠버네티스는 처음인 개발자
- 분량: 10장, 장마다 10분 안팎
- 함께 쓰는 예제: 할 일 앱 하나를 클러스터에 올리고 키워 가기

1. 컨테이너만으로는 왜 모자랄까 — 서버가 늘 때 생기는 문제에서 출발
2. 내 컴퓨터에 클러스터 띄우기 — 10분 만에 첫 클러스터
3. Pod 하나로 시작하기 — 쿠버네티스가 다루는 가장 작은 단위
…

어떻게 짰는지
- 뼈대: 공식 문서 학습 경로와 강의 계획서 두 곳에 공통으로 나오는 순서를 따랐어요.
- 최근 바뀐 것: ○○이 기본이 되어서 6장에서 그 방식으로 다뤄요.
- 많이 막히는 곳: 서비스와 네트워크에서 많이 막혀서 7장을 따로 뒀어요.
- 뺀 것: 클러스터 운영·보안 설정은 앱 개발자 목표와 멀어서 뺐어요.

참고한 자료
- [Learn Kubernetes Basics - Kubernetes](https://kubernetes.io/…) — 공식 학습 순서
- …

내 노트에서 가져올 것
- "도커 컴포즈 정리" → 2장

장마다 다룰 내용까지 보시려면 "자세히"라고 해 주세요.
이대로 책을 만들까요? 빼거나 더할 장, 순서, 깊이를 말씀해 주세요. 전체 방향이 다르면 그것도 말씀해 주세요.
```

When "내 노트에서 가져올 것" names private notes, end it with one line, so the user
knows they can choose: "비공개 노트는 책을 맞추는 데만 쓰고 장에는 옮기지 않아요. 넣어도
되면 말씀해 주세요." (In English: "I use private notes only to fit the book to you;
nothing from them goes into the chapters. Tell me if it's OK to use them.") (Not for "이 노트들로 책
만들어줘" - there they already asked.)

Leave out a section that has nothing in it ("내 노트에서 가져올 것" when no note fits,
"뺀 것" when nothing was dropped). On "자세히" ("details"), show each chapter's goal and key points,
and keep the same question at the end.

### In English

For a user who doesn't write in Korean, the same draft with these labels. "details"
and "자세히" are the same request.

| Korean | English |
|---|---|
| `이 책을 다 읽으면:` | `After this book:` |
| `누구를 위한 책:` | `Who it's for:` |
| `분량: 10장, 장마다 10분 안팎` | `Length: 10 chapters, about 10 minutes each` |
| `함께 쓰는 예제:` | `Running example:` |
| `어떻게 짰는지` | `How I built it` |
| `뼈대:` / `최근 바뀐 것:` / `많이 막히는 곳:` / `뺀 것:` | `Structure:` / `What changed recently:` / `Where people get stuck:` / `Left out:` |
| `참고한 자료` | `Sources` |
| `내 노트에서 가져올 것`, `→ 2장` | `From your notes`, `→ Chapter 2` |
| `장마다 다룰 내용까지 보시려면 "자세히"라고 해 주세요.` | `Say "details" to see what each chapter covers.` |
| `이대로 책을 만들까요? …` | `Shall I make the book like this? Tell me any chapters to drop or add, and changes to the order or depth. If you had a different direction in mind, tell me that too.` |
