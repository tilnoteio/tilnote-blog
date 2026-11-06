# The memo's shape

Tag: `tilnote-style` - every skill of this plugin, in any AI app, finds the same note by it
(`search_notes` with `q: "tilnote-style"` and `tags: ["tilnote-style"]`; if none comes
back, `list_notes` with `tag: "tilnote-style"` - search can come back empty while
Tilnote's search is down). Title: `내 문체 메모`, or the same in the user's language
(`My writing style`) - only the name they see. Private. Never a second one.

Sections in this order. Leave a section out if there is nothing in it yet, rather than
filling it with guesses.

```markdown
## 누구에게 쓰나
비개발 직장인. AI 도구를 처음 써 보는 사람.

## 말투
- "~했어요" 존댓말. 반말은 쓰지 않음
- 문장은 짧게. 한 문장에 한 가지
- 첫 문장은 겪은 일로 시작

## 자주 쓰는 표현
- "솔직히 말하면"
- "해 보니까"
- 숫자는 꼭 단위와 같이 ("10초", "30분")

## 절대 안 쓰는 말
- "알아보겠습니다", "결론적으로", "혁신적인"
- 영어 단어로 대신할 수 있는 한국어가 있으면 한국어

## 예시 문장
- "설치는 10분이면 끝났는데, 모델 받는 데 그보다 오래 걸렸어요."
- "솔직히 말하면 처음엔 이게 왜 필요한지 몰랐어요."

## 글에서 짐작한 것
- (확인 전) 소제목은 질문으로 다는 편

## 고친 기록
- 2026-10-30 "~습니다" 대신 "~요"로 (사용자 요청)
- 2026-10-30 "혁신적인" 금지 (사용자 요청)
```

For a user who doesn't write in Korean, the same sections with English headings.
Write a new memo in one set; never translate the headings of a memo that exists, and
read a heading in either language as the same section.

| Korean | English |
|---|---|
| `## 누구에게 쓰나` | `## Who I write for` |
| `## 말투` | `## Voice` |
| `## 자주 쓰는 표현` | `## Phrases I use` |
| `## 절대 안 쓰는 말` | `## Never use` |
| `## 예시 문장` | `## Sample sentences` |
| `## 모드: <이름>`, `- 언제:`, `- 누구에게:`, `- 예시:` | `## Mode: <name>`, `- When:`, `- For:`, `- Example:` |
| `## 글에서 짐작한 것`, `(확인 전)` | `## Guessed from my posts`, `(unconfirmed)` |
| `## 고친 기록`, `(사용자 요청)` | `## Change log`, `(you asked)` |

The 말투 lines of an English memo say what English marks: casual or formal,
contractions or none, "I", "we" or "you", sentence length, how posts open - e.g.
`- Casual, with contractions. "I", never "we"`.

## Modes - when one voice doesn't fit every kind of post

Many writers sound different in different places: a newsletter that talks to
subscribers ("저는 요즘…", a joke, a question to 여러분 at the end) and a how-to post for
someone arriving from search (answer first, numbered steps, no jokes). One 말투 section
can't hold both, so the memo can keep **modes**.

- A memo with no `## 모드:` section works exactly as above: every post follows it.
- The sections above stay the **common part** - what is true of every kind of post
  (존댓말 or 반말, words never used, phrases they use everywhere). Each mode holds only
  what differs.
- Each mode is one section titled `## 모드: <이름>`, after 예시 문장 and before 글에서
  짐작한 것. The name is the user's word for that kind of writing ("뉴스레터", "블로그",
  "강의 자료"), never one you made up.
- Its first line is `- 언제:` - which posts it is for, in plain words, so any skill can
  match a post to it: what kind of post, for whom, where it goes.
- Then its own lines, in the same spirit as the sections above: 누구에게 (only when it
  differs from 누구에게 쓰나), 말투, 자주 쓰는 표현, and one or two `예시:` sentences
  copied exactly from the user's posts of that kind.

```markdown
## 모드: 뉴스레터
- 언제: 구독자에게 내 경험과 생각을 건네는 편지 같은 글
- "저는"으로 시작해 요즘 겪은 일부터
- "~답니다", "~더라구요"
- 괄호 속 혼잣말 같은 농담
- 끝은 "여러분"에게 묻는 말
- 예시: "그렇게 오랜 시간 불편하고 고통스러웠는데 이렇게 해법을 아니 너무 좋더라구요."

## 모드: 블로그
- 언제: 검색해서 들어온 사람에게 방법·정보를 주는 글
- 첫 두 문장에 답. "저는"은 직접 해 본 부분에만
- 따라 할 단계는 번호 목록
- 예시: "설치는 명령어 한 줄이면 끝납니다."
```

## Notes on each section

- **누구에게 쓰나** - one or two lines. The reader decides what to explain and what to
  skip, so it is the most useful line in the memo.
- **말투** - endings, sentence length, how posts open, use of emoji or bold. Concrete
  enough to check a sentence against.
- **자주 쓰는 표현** - phrases that recur in their own writing. These are their voice:
  a polishing pass never removes them, even if they look like a tell elsewhere.
- **절대 안 쓰는 말** - the strongest rule in the memo. Every skill avoids these in
  anything it writes for this user, in every mode.
- **예시 문장** - two or three sentences copied exactly from their own posts. No
  names of people or companies. With modes, the examples sit in each mode as `예시:`
  lines, and this section keeps only sentences that fit every mode (or goes away).
- **모드: <이름>** - see above. A mode exists only because the user named that kind of
  writing; you may suggest one in a line when their posts clearly split into kinds,
  and add it on a yes.
- **글에서 짐작한 것** - inferred, not confirmed. Other skills follow these lightly;
  once the user confirms one, move it to its section. A guess about one mode says so:
  "(확인 전, 블로그) 소제목은 질문으로".
- **고친 기록** - one dated line per change, newest last. Keep the latest ten; drop
  older lines once the rule they added is in its section.

Length: the common part under about 1,000 characters and each mode under about 500
(in English, about 350 and 180 words).
Every writing skill reads the whole memo before starting, so a long memo costs every
post.

## Reading it (for every skill)

Read it before writing. Where it and a skill's defaults disagree, the memo wins. Where
it and the user's request in this conversation disagree, the request wins for this
post only.

With `## 모드:` sections, follow the common part plus **one** mode, picked in this
order:

1. The mode the user named for this post ("뉴스레터로 써줘", "블로그 모드로").
2. When changing a post that exists, the mode it is already written in - the one whose
   `언제:` line fits it. A post never moves to another mode unless they ask.
3. Otherwise the mode whose `언제:` line fits this post - its kind, its reader, where
   it goes.
4. None fits, or two fit equally → the common part only.

Where the mode and the common part disagree, the mode wins for that post. Don't ask
which mode before writing; say which one you used in a few words when you show the
result, so the user can switch.
