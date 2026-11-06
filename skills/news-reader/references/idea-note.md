# The idea note (글 아이디어 노트)

Learning, trying and writing rarely happen in one sitting. The user reads up today,
tries it on the weekend, writes next week. A chat ends when it is closed; a Tilnote
note stays. The idea note is how the next conversation - possibly in a different AI
app - picks up where this one stopped.

## Creating one

Only when the work stops before the post is written: the user says they'll continue
later, will try it first, or simply leaves it there. Don't create one when you go
straight on to writing - the post itself is the record then.

Create it with `create_note` (private), tags `["tilnote-idea"]`. If an idea note for
this topic already exists, never make a second one - keep that one up to date instead.

## Keeping it up to date

Once an idea note exists, it is where the writer's part lives, and the chat can close
at any moment. So whenever the user brings something new while you work from it - a
question, what they tried and what they saw, an opinion - write it in right away, in
the same turn, before you reply:

- One `edit_note`, by section: `append` with `section: "내가 궁금했던 것"` for a
  question (with its short answer); with `section: "해 볼 것 / 해 본 것"` for a result,
  and tick the `- [ ]` item it answers (`find: "[ ] <the item>"`, `content` the same
  with `[x]`); with `section: "내 생각"` for a view, or why something caught their eye.
  Where a section still says `(아직 없음)`, `replace` that instead, with
  `find: "(아직 없음)"` and the `section`. Use `append_to_note` only for a section
  the note doesn't have yet.
- Their words, as they said them - fix only spelling. Nothing they didn't say.
- Update "어디까지 했나" in one line ("직접 돌려 봄. 글로 쓰기 전"). When they stop
  again, it says where ("나중에 쓰기로 함").

## Title and shape

Tag: `tilnote-idea` - that is how you find it again. Title: `[글 아이디어] <topic in the
user's words>` - e.g. `[글 아이디어] 로컬 LLM으로 문서 요약`; in another language the same in
theirs (`[Idea] <topic>`).

```markdown
## 어디까지 했나
(one or two lines: "알아보기 끝, 맥북에서 직접 돌려 보기 전")

## 알아본 것
(what you looked up, condensed; keep the source links)

## 내가 궁금했던 것
- (the user's questions, close to their words, each with the short answer)

## 해 볼 것 / 해 본 것
- [ ] (the try you suggested, with its steps)
- (what they tried and what they saw - their words)

## 내 생각
- (opinions they gave)
```

In English the sections are `## Where it stands`, `## What I looked up`,
`## My questions`, `## To try / tried` and `## My thoughts`, and an empty one says
`(none yet)`. Write a new note in the user's language. In a note that exists, use its
headings as they are (`section: "My thoughts"` in an English note); a heading in
either language is the same section.

The last three sections are the writer's part. They are the reason
the note exists - never leave them out to save space, and never fill them with
things the user didn't say.

## From a news briefing item

When the idea comes from an item of the user's news briefing - recent news on the
topics they keep in Tilnote, shown in the chat or saved as a `[뉴스] ...` note - the
same shape holds. The item's 글 아이디어 question is a suggestion, not the user's question,
so it goes in "어디까지 했나", and the writer's sections stay empty until they say
something:

```markdown
## 어디까지 했나
뉴스 브리핑(10월 31일, 토픽: AI 에이전트)에서 고른 소식. 아직 알아보기 전.
글 아이디어: 우리 팀 업무에 MCP 서버를 붙이면 뭐가 달라질까?

## 알아본 것
- [기사 제목](원문 링크) - 출처, 날짜
- (the item's 무슨 일, one or two sentences)

## 내가 궁금했던 것
- (아직 없음)

## 해 볼 것 / 해 본 것
- [ ] 원문 읽기

## 내 생각
- (아직 없음)
```

In English the first section reads "Picked from the news briefing (Oct 31, topic: AI
agents). Not looked into yet." and "Post idea: ...", and the try is `- [ ] Read the
original`.

Title: `[글 아이디어] <the item's title, exactly as in the briefing>` (`[Idea] <...>` in
English), so a later search for the item finds the note. If the user said why it
caught their eye, that sentence goes under "내 생각".

`create_note`, private, with `aiGenerated: true` and tags `["tilnote-idea"]`. One note
per item: before making one, and before starting to write from an item, look for it -
`search_notes` with `q` the item's title (then two or three key words of the title) and
`tags: ["tilnote-idea"]`, and the idea note that matches the item. Continue in that
note instead of making a second one.

## Resuming

When the user says "○○ 글 아이디어 이어서", "그거 해 봤어":

1. `search_notes` with `q` the topic words and `tags: ["tilnote-idea"]`; pick the idea
   note on that topic. If there are several, ask which one. With no topic words ("어제
   그 글 아이디어 이어서", "그거 해 봤어" in a new conversation), `list_notes` with
   `tag: "tilnote-idea"`, `sort: "updated"` and `limit: 5`: take the newest, or the one
   edited on the day they name, and name it when you greet them (step 4). If two are
   equally likely, list their titles and ask.
2. `get_note` it and read "어디까지 했나".
3. If their message brings something new ("해 봤는데 한 문장에 10초쯤 걸리더라"),
   write it into the note now, as in "Keeping it up to date".
4. Greet them with where things stand in one line ("지난번엔 설치 직전까지
   알아봤어요. 해 보셨어요?"), say in a few words what you just added to the note,
   and carry on from that stage.
5. When the post is published, leave the idea note as it is. It is the user's
   material, and deleting it is their call.
