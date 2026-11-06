---
name: writing-style
description: Keeps the user's writing style - who they write for, tone and sentence endings, phrases they like, words they never use, sample sentences - in one private Tilnote note, "내 문체 메모" (tagged tilnote-style), so posts sound like them in any AI app with this plugin and Tilnote. When they write differently for different kinds of posts (a newsletter vs. a how-to blog post), keeps a mode for each kind inside the same note. Learns it from posts the user wrote themselves and from what they say, showing a learned memo and confirming before saving; a rule they state is saved as stated. Use when the user says "remember my writing style", "never use this phrase in my posts", "내 문체 기억해줘", "내 문체 배워줘", "내 글 보고 말투 정리해줘", "내 글 말투 기억해", "앞으로 글에 이 표현 쓰지 마", "블로그 글은 앞으로 '~요'로 써줘", "글은 존댓말로 써줘 앞으로도", "내 문체 메모 보여줘", "블로그 말투는 따로 배워줘", "아까 배운 건 뉴스레터 말투야", "뉴스레터 모드 만들어줘", or corrects the same wording in a post twice and agrees to keep it. Not for how to talk in this chat. The other Tilnote blog skills read this note before writing.
---

# My writing memo (내 문체 메모)

"Write like me" usually lives in one app's memory and is gone in the next app. Here it
lives in the user's Tilnote as one private note they can open, edit and delete -
and every AI app with this plugin and Tilnote reads the same note. That is the whole point of
this skill: one memo, theirs, readable anywhere.

Speak in the user's language. Examples are Korean because most Tilnote writers are.
For a user who doesn't write in Korean, the memo's headings are English (`## Voice`,
`## Mode: <name>`, `- When:` - the table in
[references/memo-format.md](references/memo-format.md)), and what Korean marks with
sentence endings (존댓말·반말, "~했다" or "~했어요") English marks with register:
casual or formal, contractions or none, "I", "we" or "you". In a memo that exists,
point at its headings as they are (`section: "Never use"`), and read a heading in
either language as the same section.

## The memo

- One private note, tagged `tilnote-style` and titled `내 문체 메모` (in another
  language, the same in theirs: `My writing style`). The title is only its name; find
  it by the tag: `search_notes` with `q: "tilnote-style"` and
  `tags: ["tilnote-style"]`; if none comes back, check once more with `list_notes` and
  `tag: "tilnote-style"` - search can come back empty while Tilnote's search is down.
- Never a second one. If it exists, change it (`edit_note`, pointing at its sections by
  heading - `section: "절대 안 쓰는 말"`, `section: "모드: 블로그"`); if neither lookup
  finds it, `create_note`.
- The shape is in [references/memo-format.md](references/memo-format.md): 누구에게
  쓰나 / 말투 / 자주 쓰는 표현 / 절대 안 쓰는 말 / 예시 문장 / 모드 / 글에서 짐작한
  것 / 고친 기록.
- **Modes** are optional: one `## 모드: <이름>` section per kind of writing the user
  names ("뉴스레터", "블로그"), each starting with a `- 언제:` line that says which posts
  it is for. The sections above the modes are the common part every post follows; a
  mode holds only what differs. A memo without modes works as one voice for every
  post.
- Keep it short - the common part under about 1,000 characters, each mode under about
  500 (in English about 350 and 180 words). Every writing skill reads it before
  starting, so a long memo costs every post.

Check first that the Tilnote tools are there. If not:

- **Their writing is here** - posts or text they wrote, pasted in the chat → draft the
  memo from it as in "Learning from their posts", steps 2-4, and show it in the chat -
  nothing is saved, so instead of "이대로 저장할까요?" end with one line:
  > 틸노트를 연결하면(주소 `https://tilnote.io/mcp`) 이 메모를 비공개 노트로 저장해 두고, 이 플러그인을 쓰는 어느 AI 앱에서든 글을 쓸 때 이 문체를 따라요.
- **A rule they state** ("앞으로 '~요'로 써줘", "'혁신적인' 쓰지 마") → follow it in the
  posts you write in this conversation, say so in a line, and end with one line:
  > 틸노트를 연결하면(주소 `https://tilnote.io/mcp`) 이 규칙을 '내 문체 메모'에 저장해 두고, 이 플러그인을 쓰는 다른 AI 앱에서 글을 쓸 때도 따라요.
- **Anything that needs their notes** - learning from their published posts, "내 문체
  메모 보여줘", changing or deleting the memo → say in one line that Tilnote isn't
  connected yet and where to connect it (the app's connection settings, `/mcp` in a
  terminal app, address `https://tilnote.io/mcp`), and stop.

## Learning from their posts ("내 문체 기억해줘")

0. **Look for the memo first.** `search_notes` with `q: "tilnote-style"` and
   `tags: ["tilnote-style"]` - if none comes back, `list_notes` with
   `tag: "tilnote-style"`; if the note with that tag exists, `get_note` it. A memo
   may already hold rules the user stated themselves - those are the ones to keep.
1. **Find posts they wrote themselves.** A post you or another AI drafted teaches
   your style, not theirs. The note list doesn't show the AI mark, and a post without
   it may still be AI-drafted, so ask: `list_notes` and keep the notes with
   `published: true` (newest first), suggest three to five, and ask in one message
   which ones they wrote on their own. If they pasted text or named posts, skip the
   question; find each named post with `search_notes` on its title and take the
   exact-title match.
2. **Read two or three** with `get_note`. More adds little. If `get_note` shows
   `AI-generated: yes` on a post they picked, say so in one line and ask whether it is
   still their own writing before learning from it.
   **What kind of writing are they?** If the user says ("블로그 말투 배워줘", "아까 건
   뉴스레터 말투야"), or the memo already has modes, you are learning a mode - see
   "Learning a mode" below. If the posts they picked clearly split into kinds (two
   letters to subscribers and a step-by-step how-to), don't blend them into one
   voice: say so in one line in the same message as the draft and offer to keep them
   as two modes. Otherwise draft one voice, as below.
3. **Draft the memo.** Note only what you can point at in their text:
   - 말투: 존댓말 or 반말, "~했다" or "~했어요" (in English: casual or formal,
     contractions, "I" or "we"), sentence length, how they open.
   - 자주 쓰는 표현: words and turns of phrase that recur.
   - 예시 문장: two or three of their own sentences, copied exactly - the best
     single guide to their voice.
   - 누구에게 쓰나: only if the posts make it clear. If they only imply a reader, put
     your guess under 글에서 짐작한 것 and ask in the same message.
   - 절대 안 쓰는 말: from what they say, not from guessing. You may suggest a few AI
     phrases their posts never use ("알아보겠습니다", "결론적으로"): put them under
     글에서 짐작한 것 marked (확인 전), ask about them in the same message as the save
     question, and move them to 절대 안 쓰는 말 on a yes.
   - Anything you inferred but couldn't confirm goes under 글에서 짐작한 것.
   - **If a memo exists, start from it.** Rules the user stated themselves (말투 and
     절대 안 쓰는 말 lines with a 고친 기록 entry behind them, anything they told you)
     stay as they are; what the posts add goes around them. Where a post-based rule
     contradicts one they stated, ask which holds - never overwrite theirs silently.
     Keep the existing 고친 기록 lines.
4. **Show it and ask.** Show the whole memo draft in the chat (it is short, and
   reading it is the point), with today's 고친 기록 line already in it ("2026-10-30
   내 글 2편으로 문체 배우기"). When it updates an existing memo, say in one line above
   the draft what is new or changed - never mark it inside the memo ("(전에 정하신
   규칙)", "(새로)"): what you show is what gets saved. Then: "이대로 저장할까요? 고칠
   곳이 있으면 말씀해 주세요."
5. **Save on a yes.**
   - The memo exists → change that note, never a second one: one `edit_note` on the
     sections that change - `replace` with `section` for a section you redrafted, with
     the `revision` from the `get_note` in step 0; `append` with `section` for lines
     added to one; for a new `## 모드:`, `insert_before` with the `section` of 글에서
     짐작한 것 (or 고친 기록, whichever comes first) - or `update_note` with the whole
     merged memo when most of it changed.
     Add today's dated 고친 기록 line (`append` with `section: "고친 기록"` -
     `"Change log"` in an English memo; add it if the draft you showed lacked it).
     Drop any chat-only marks from the draft. Say in one line what changed.
   - No memo yet → `create_note` with title `내 문체 메모` (in another language, the
     same in theirs: `My writing style`), the memo as `content`, tags
     `["tilnote-style"]`. Its 고친 기록 starts with today's line.

   Give the note link and one line: "이 플러그인과 틸노트를 연결한 어느 AI 앱에서든 글을 쓸 때 이
   메모를 먼저 읽어요. 틸노트에서 직접 고치셔도 돼요."

## Learning a mode

When the user names a kind of writing ("블로그 말투는 따로 배워줘", "아까 배운 건
뉴스레터 말투야", "강의 자료 모드 만들어줘"), learn it as a mode - see
[references/memo-format.md](references/memo-format.md), "Modes".

1. **Posts of that kind only**, written by them - found as in step 1 above; ask which
   ones if they didn't say. A mode never borrows lines from another kind of post.
2. **Draft `## 모드: <their word>`** from those posts. First a `- 언제:` line - which
   posts it is for, in their words if they gave them; if it is your wording, ask about
   it in the save question ("'언제'는 '검색해서 들어온 사람에게 방법을 알려 주는 글'로
   적었어요. 맞나요?"). Then only what you can point at in those posts: endings, how
   they open and end, lists or no lists, jokes or none, recurring phrases, and one or
   two `예시:` sentences copied exactly.
3. **Fit it into the memo.**
   - **No modes yet, and the memo's voice came from another kind of writing** (the
     user just said so) → that voice becomes a mode too. Move the lines that belong to
     that kind - how posts open and end, jokes, endings like "~답니다", its example
     sentences - into `## 모드: <that kind>`, and leave in the common part only what
     both kinds share.
   - **Modes already exist** → add the new one; the others stay as they are. A common
     line the new posts contradict moves into the mode(s) it came from - never just
     deleted.
   - Rules the user stated themselves stay where they are, as in step 3 above. If one
     now looks like it belongs to only one kind, ask in the same message.
     절대 안 쓰는 말 stays common unless they say it is only for one kind.
4. **Show the whole memo and ask**, as in step 4, with one line above the draft saying
   what moved where ("지금 말투는 '뉴스레터' 모드로 옮기고 '블로그' 모드를 새로
   만들었어요. 공통에는 존댓말과 안 쓰는 말만 남았어요."). Save on a yes, as in step
   5, with a 고친 기록 line ("2026-11-03 '블로그' 모드 추가 - 내 글 2편").

## Learning as you go

- **They say it** ("앞으로 '~습니다' 말고 '~요'로", "'혁신적인' 쓰지 마") → that is
  the confirmation. Find the memo (`search_notes` with `q: "tilnote-style"` and
  `tags: ["tilnote-style"]`, then `list_notes` with `tag: "tilnote-style"` if that
  finds none) and `get_note` it, then one
  `edit_note`: the rule into the right section (`append` with its `section`, or
  `replace` with `find` on the line it changes) and a dated line with
  `section: "고친 기록"` (`"Change log"` in an English memo). Reply in one or two
  lines quoting the line as you saved it, with the note link. If the memo doesn't
  exist yet, create it with just this (title and tag as in step 5).
- **They correct the same thing twice** while you write or polish (changing "~습니다"
  back to "~요" again) → ask once: "앞으로도 이렇게 할까요? '내 문체 메모'에 적어
  둘게요." Write it only on a yes. Never record a preference silently - a memo the
  user didn't agree to is a memo they stop trusting.
- **A rule for one kind of writing** ("뉴스레터는 '감사합니다!'로 끝내", "블로그 글은
  번호 목록 써도 돼") → if a mode by that name, or whose `언제:` line fits, exists, the
  rule goes in that mode. If none does, it goes in the common part - unless they said
  it is only for that kind; then make that mode with this one line and a `언제:` line
  in their words.
- **A rule that contradicts the memo** → replace the old line, don't keep both, and say
  which one changed. A rule for one mode replaces only that mode's line.

## Showing and changing

- "내 문체 메모 보여줘" → `get_note`, show it as is, with the link.
- "블로그 모드 보여줘" → the common part and that mode, with the link.
- "○○ 빼줘" → edit that line (`find` it); say what was removed. "뉴스레터 모드 빼줘" →
  delete that section only (`delete` with `section: "모드: 뉴스레터"` and the revision
  from `get_note`); the common part and other modes stay.
- "메모 지워줘" → ask whether they mean emptying it or deleting the note. Delete
  (`delete_note` with `confirm: true`) only when they clearly want the note gone.

## Rules

- **Their words, not yours.** Example sentences are copied from their posts, never
  written for them. A memo full of your sentences teaches the next AI to sound like
  you.
- **Only what they wrote or said.** Don't add rules they didn't give. Guesses stay in
  글에서 짐작한 것 until they confirm.
- **Modes are theirs too.** A mode exists because the user named that kind of writing,
  and its name is their word. Don't split a memo into modes on your own guess - offer
  it in one line and add it on a yes.
- **Nothing private in it.** Skip names of colleagues, companies or clients in the
  example sentences - pick another sentence.
- The memo is a guide, not a cage: when the user asks for something different in one
  post ("이번 글은 반말로"), do it for that post without changing the memo, unless they
  say "앞으로도".
