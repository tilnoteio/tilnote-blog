# Writing a chapter

A chapter is one page of the book, read in about ten minutes. It answers the key points
in its plan for the reader the 목차 노트 describes, and picks up where the chapter
before it left off.

## Read first

- **Its plan** in the 목차 노트 - 읽고 나면, 다룰 것, 먼저 읽을 장, 찾아볼 것,
  바탕이 될 내 노트.
- **The top of the 목차 노트** - promise, reader, 분량, 말투, 함께 쓰는 예제, and
  지금까지 나온 용어. A term counts as already explained only when it is marked with an
  earlier chapter's number; one marked with a later chapter or `(뺀 장)` is new to this
  reader - explain it where it first appears.
- **The chapter before it**, if written (`get_note` on its link): how it ended, where
  the running example stands, which terms it explained. Refer back to what it
  explained (`"내 컴퓨터에 클러스터 띄우기"에서 띄운 클러스터에서`) instead of explaining
  it again. If it isn't
  written, read the nearest written chapter in 먼저 읽을 장 instead.
- **The chapter after it**, if already written: skim it so the two don't contradict
  each other. If it explains something this chapter covers, explain it fully here
  anyway - the earlier chapter teaches it, and the later one's recap can stay.
- **The user's notes** named in the plan (`get_note`), and one `search_notes` with the
  key points' main words. A published note is material. A private note only tells you
  what this reader asks and needs explained: none of its facts, sentences, numbers or
  names go into the page - unless the 목차 노트 has `비공개 노트: 장에 써도 돼요` (or
  `Private notes: OK to use in chapters`), and
  then still not what SKILL.md's "Private notes shape the book" keeps out: other
  people's names, contact details and ID numbers, the user's health, money and family,
  secrets (a code block gets a placeholder for the value), internal addresses, and
  work matters (employer, clients, contract terms, figures not made public).

## Look things up

- Search whenever the page has anything that moves: versions, commands and options,
  prices, numbers, laws, dates, product names, "the latest". Open the page you cite,
  prefer official and primary sources, and keep its date - the date the page shows
  (published or updated), or `확인 YYYY-MM-DD` with the day you read it when it shows
  none (`확인 YYYY-MM-DD, 버전 X` for a page that shows only a version). If sources disagree, say so in the page instead of picking one quietly.
- Ideas that don't move - concepts, how something works, well-known history - don't
  need a search.
- Code and commands follow the official docs you opened. Keep examples small and
  runnable, and say what they need (version, setup) when it matters.
- **No search:** write what doesn't move. For what does, tell the reader what to check
  and where ("옵션 이름은 버전마다 달라요. 공식 문서에서 지금 버전을 확인하세요";
  in English, "Option names change between versions. Check the official docs for
  the version you use.") instead of guessing a specific. Say once in your reply that the page was written
  without a web search.

## Shape

```markdown
(이 장이 답하는 질문과 앞 장에서 이어지는 부분, 2~4문장. 제목을 되풀이하지 않는다.
 아직 안 쓴 장에 기대는 장이면, 기대는 내용도 이 첫 단락에서 한두 문장으로 짚는다.)

## (다룰 것 1을 독자의 말로)

설명, 그리고 구체적인 예. 함께 쓰는 예제가 있으면 그 예제로.

## (다룰 것 2)

…

> [!TIP]
> 많이 막히는 곳 한 가지와 빠져나오는 법.

## 정리

- 3~5줄. 이 장에서 할 수 있게 된 것.

다음 장 "○○"에서는 ….

## 참고한 자료

- [페이지 제목](https://…) — 2026-10-12
- [날짜가 없는 페이지 제목](https://…) — 확인 2026-11-01
```

- In a book whose 목차 노트 uses English labels: `## Recap` for `## 정리`, a closing
  `Next, "<chapter title>" …` line for `다음 장 "○○"에서는 ….`, `## Sources` for
  `## 참고한 자료`, `checked YYYY-MM-DD` for `확인 YYYY-MM-DD` (`checked YYYY-MM-DD,
  version X` for `확인 YYYY-MM-DD, 버전 X`), and
  `### Going further: <question>` for `### 더 알아보기: <질문>`. Read a label in either
  language as the same one.
- No `#` heading: the page title is the heading. A one-line note on the version or
  setup the chapter assumes may follow the opening paragraph.
- Name other chapters by their title in double quotes ("○○", never 「」 or 《》), never
  by number: chapter numbers change when the 목차 changes, titles rarely do.
- Every key point in 다룰 것 gets answered, usually one `##` each. A page is done when
  every key point is answered, not when every heading has text under it.
- Use a table for comparisons, a code block with its language for code, and at most
  two `> [!TIP]` or `> [!WARNING]` boxes per page.
- The last chapter ends with one line on what to read or try next instead of
  "다음 장".
- Leave `참고한 자료` out when you opened nothing. List only pages you opened, with
  their exact titles.
- A published note of the user's can be linked where it helps, by its `publicUrl`:
  "직접 정리해 두신 [도커 컴포즈 정리](https://tilnote.io/pages/…)에도 같은 내용이
  있어요." (In English: "Your own [Docker Compose notes](…) cover this too.")
  Only notes you opened. Never link a private note: once the book is
  published, readers can't open it but see its title.

## Voice and length

- Follow the 목차 노트's 말투 and 분량. Default: ~요체, 3,000-5,000자 (spaces included,
  code blocks not counted); in English, a plain friendly voice and 1,100-1,800 words.
- Explain like a good teacher to this reader: the first time a term appears, say what
  it means in plain words.
- The page is yours, not the user's: no "제가 해 보니", no invented stories, quotes,
  numbers or sources. A sentence without a source beats a made-up one.
- Don't pad to reach a length. Don't end paragraphs with summary sentences.
- Avoid what makes Korean read as machine-written:
  [korean-ai-tells.md](korean-ai-tells.md) - for a book in English,
  [english-ai-tells.md](english-ai-tells.md).

## Save

1. `create_note` titled with the chapter title only - no number (the number lives in
   the 목차) - with the book's tag and `aiGenerated: true`.
2. Into the book at its place: "Put it in the book" in SKILL.md.
3. 목차 노트: one `edit_note` call that changes:
   - this chapter's 상태 line (`⬜` → `✅`);
   - 지금까지 나온 용어, with this chapter's new terms added (replacing
     `(아직 없음)`). A term this chapter explains that is already listed under a later
     chapter or `(뺀 장)` gets this chapter's number instead of a second entry.
   The lines, and how to point at them, are in [toc-note.md](toc-note.md).
