# The 목차 노트

A book made here is two kinds of things in the user's Tilnote, all private:

- **The 목차 노트** `"<책 제목>" 목차`: the table of contents, every chapter's plan
  and status, and the book's memory. Any AI app that opens it later knows who the
  book is for, what each chapter should do, which chapters are written, and which
  terms the written chapters explain, and where. It is the book's first page, so the
  user sees it first. It stays private even when the book is published, unless the
  user ticks it in the web's publish window.
- **The book**, made with `create_book`. After the 목차 page come the written chapters
  in 목차 order; a chapter not written yet isn't in it. The book's page list shows only
  titles; chapter numbers live in the 목차.

Chapters are notes titled with the chapter title only (no number), made only when
written. There are no empty pages. The 목차 노트 and every chapter carry the book's tag:
the book title without punctuation (`Git 명령어 너머`). The 목차 노트 also carries
`tilnote-book-toc`, the tag every AI app finds it by.

The user can edit the 목차 노트 in Tilnote's editor. Read it the way it is, not the way
you saved it: lines may move, and wording may change.

## Shape

Title: `"<책 제목>" 목차`. Tags: the book's tag and `tilnote-book-toc` (keep both
whenever you change the note). `aiGenerated: true`.

```markdown
- 책: https://tilnote.io/users/books/6b0000000000000000000001
- 이 책을 다 읽으면: 내 앱을 쿠버네티스에 올리고, 고장 났을 때 어디를 봐야 할지 알 수 있어요.
- 누구를 위한 책: 도커로 컨테이너는 띄워 봤지만 쿠버네티스는 처음인 개발자
- 분량: 10장, 장마다 10분 안팎 (3,000~5,000자)
- 말투: ~요체, 처음 나오는 말은 풀어서
- 함께 쓰는 예제: 할 일 앱 하나를 클러스터에 올리고 키워 가기

> [!NOTE]
> 이 책은 읽을 때 한 장씩 써요. 아직 안 쓴 장은 이 책을 만든 AI 대화 앱(틸노트를 연결해 둔 곳)에서 "'쿠버네티스, 도커 다음 단계' 3장 보여줘"라고 하면 그때 써서 책에 넣어요.

## 목차

### 1장. 컨테이너만으로는 왜 모자랄까

- 상태: ⬜ 아직 안 씀
- 한 줄: 서버가 늘 때 생기는 문제에서 출발
- 읽고 나면: 서버가 늘 때 컨테이너만으로는 무엇이 힘든지 설명할 수 있어요.
- 다룰 것: 컨테이너 여러 개를 손으로 관리하면 생기는 일 / 오케스트레이션이 대신 해 주는 것 / 쿠버네티스 말고 다른 선택지
- 바탕이 될 내 노트: [도커 컴포즈 정리](https://tilnote.io/home?pages=…)

### 2장. 내 컴퓨터에 클러스터 띄우기

- 상태: ⬜ 아직 안 씀
- 한 줄: 10분 만에 첫 클러스터
- 읽고 나면: 내 컴퓨터에 연습용 클러스터를 띄우고 지울 수 있어요.
- 다룰 것: 연습용 클러스터 도구 고르기 / 설치하고 띄우기 / kubectl로 클러스터 살펴보기
- 먼저 읽을 장: 1장
- 찾아볼 것: 지금 버전의 설치 명령 (공식 문서)

## 지금까지 나온 용어

(아직 없음)

## 목차를 짤 때 본 자료

- [Learn Kubernetes Basics - Kubernetes](https://kubernetes.io/…) — 공식 학습 순서
```

- `책:` is the `url` that `create_book` returned.
- `함께 쓰는 예제: (없음)` when the subject has none.
- `- 비공개 노트: 장에 써도 돼요` right after it, only when the user asked to include
  their private notes (SKILL.md, "Private notes shape the book"). Without it,
  chapters take nothing from private notes.
- Each chapter is a `### N장. <장 제목>` heading and one list. The number lives only
  here, never in the chapter note's title. Leave out a line that has nothing: no
  `먼저 읽을 장` for chapter 1, no `바탕이 될 내 노트` when no note fits, no `찾아볼 것`
  when nothing moves.
- `한 줄` is the line the user saw in the draft.
- `다룰 것` holds the 3-5 key points, separated by ` / `. They are what the chapter
  must answer when written.
- 지금까지 나온 용어: `- 용어: 한 줄 뜻 (N장)`, added when a chapter is written -
  at most five per chapter, only terms the reader needs again later. New terms go at
  the end, so the list follows the order chapters were written, not chapter numbers;
  when chapters are renumbered, only the `(N장)` changes and the line stays where it
  is. A term the chapter only recaps for a chapter not yet written isn't listed; the
  chapter that teaches it adds it.
- 목차를 짤 때 본 자료: the pages you opened while drafting, each with the one line on
  what you took from it. When you couldn't search, write `(웹 검색 없이 짰어요)`.
- Note links are the `url` the tools returned.

## In English

For a user who doesn't write in Korean, the same note with English labels. Write a new
목차 노트 in one set of labels; never translate the labels of one that exists - the
user may have edited it, and your `find` and `section` quote them as they are. Read a
label in either language as the same line.

| Korean | English |
|---|---|
| title `"<책 제목>" 목차` | `"<Book title>" contents` |
| `책:` | `Book:` |
| `이 책을 다 읽으면:` | `After this book:` |
| `누구를 위한 책:` | `Who it's for:` |
| `분량: 10장, 장마다 10분 안팎 (3,000~5,000자)` | `Length: 10 chapters, about 10 minutes each (1,100-1,800 words)` |
| `말투:` | `Voice:` |
| `함께 쓰는 예제:` / `(없음)` | `Running example:` / `(none)` |
| `비공개 노트: 장에 써도 돼요` | `Private notes: OK to use in chapters` |
| `## 목차` | `## Contents` |
| `### 3장. <장 제목>` | `### Chapter 3. <chapter title>` |
| `상태:` | `Status:` |
| `한 줄:` | `In a line:` |
| `읽고 나면:` | `After reading:` |
| `다룰 것:` | `Covers:` |
| `바탕이 될 내 노트:` | `From my notes:` |
| `먼저 읽을 장: 1장` | `Read first: Chapter 1` |
| `찾아볼 것:` | `To look up:` |
| `## 지금까지 나온 용어`, `- 용어: 한 줄 뜻 (N장)` | `## Terms so far`, `- term: one-line meaning (Chapter N)` |
| `## 뺀 장`, `— 2026-11-02 뺌`, `(뺀 장)` | `## Removed chapters`, `— removed 2026-11-02`, `(removed)` |
| `## 목차를 짤 때 본 자료`, `(웹 검색 없이 짰어요)` | `## Sources for the contents`, `(drafted without web search)` |
| `(아직 없음)` | `(none yet)` |

The note at the top reads: "This book is written a chapter at a time as you read it.
To read a chapter not written yet, say "Show me chapter 3 of 'Kubernetes, after
Docker'" in the AI app where you made this book (the one connected to Tilnote)."

## 상태 lines

| State | Line | In English |
|---|---|---|
| Not written | `- 상태: ⬜ 아직 안 씀` | `- Status: ⬜ not written yet` |
| Written, in the book | `- 상태: ✅ 2026-10-31 · [읽기](https://tilnote.io/home?pages=…)` | `- Status: ✅ 2026-10-31 · [Read](…)` |

The date is the day it was written, in the user's local time (Korean time for a
Korean user). A written chapter keeps its date and link when it moves or is renamed.

## Taking a chapter out

Move its heading and list out of `## 목차` and add one line under `## 뺀 장` (make the
section, between 지금까지 나온 용어 and 목차를 짤 때 본 자료, the first time):

```markdown
## 뺀 장

- "스테이징 영역은 왜 있을까" — 2026-11-02 뺌 · [읽기](https://tilnote.io/home?pages=…)
```

Leave out `· [읽기](…)` for a chapter that was never written. Then renumber the chapters
left in `## 목차` (headings, 먼저 읽을 장, and the `(N장)` in 지금까지 나온 용어) so they
run 1, 2, 3 … again; terms from the removed chapter say `(뺀 장)`.

## Updating it

One `edit_note` on the 목차 노트 with every change, each pointed at its place by the
chapter's heading (`section`) and the text it changes (`find`) - never by counting
blocks; the editor may have split a chapter's list into several. Pass the `revision`
from your `get_note` of the 목차 노트. All operations refer to the note as you read it,
so name chapters by the headings and numbers they had then.

- **A 상태 line** → `replace` with `section` the chapter's heading as you read it,
  without `###` (`"3장. Pod 하나로 시작하기"`), `find` the whole 상태 line without its
  `-` (`상태: ⬜ 아직 안 씀`), and `content` the new line. The section is needed: every
  unwritten chapter has the same line.
- **New terms** → `append` with `section: "지금까지 나온 용어"` and the new
  `- 용어: 한 줄 뜻 (N장)` lines; while it still says `(아직 없음)`, `replace` that
  instead (`find: "(아직 없음)"` with the same `section`). A listed term that moves to
  this chapter → `find` its line and change its `(N장)`.
- **Renumbering** → `replace` with `find: "### 4장."` and `content: "### 3장."` for each
  chapter that moves up, and its `먼저 읽을 장` line by `find` with that chapter's
  `section` (the line repeats across chapters).
- **Moving or removing a chapter** → `delete` with its `section` (the heading and its
  list go together; this needs the `revision`), then either the same heading and list
  again where it goes (`insert_after` with the `section` of the chapter it follows) or
  its line under `## 뺀 장` (`append` with `section: "뺀 장"`; the first time,
  `insert_before` with `section: "목차를 짤 때 본 자료"` and the `## 뺀 장` heading with
  the line).
