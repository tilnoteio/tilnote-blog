# Fixing a post after publishing

Once a post is public, most requests have two tools that sound right and only one that
is. Pick by what the user can get back afterwards.

## Fix the text

"오타 고쳐줘", "이 문단 바꿔줘", "방금 올린 글 고쳐줘":

- One `edit_note` with only what changes. The post stays published and readers see the
  fix at once - there is nothing to republish. Point each change at its place:
  - a typo, spacing or a word → `find` with a short phrase around it, quoted from one
    line of the note, and `content` the same phrase fixed;
  - the same word everywhere ("'맥북'으로 다 바꿔줘") → `find` with `replaceAll: true`
    (and `expectedCount` when you know how many there are), then say how many changed;
  - a whole paragraph → `target_id` from `get_note_blocks`;
  - one heading's part ("설치 방법 부분") → `section` with the heading's text;
  - the title → `title` (with `operations: []` when nothing else changes).
  Several fixes go in the same call, each quoted from the note as you read it.
- Because readers see it at once: apply straight away only what the user spelled out
  (typos, spacing, a sentence or a title they gave you). When the fix means rewording
  of your own ("이 문단 다듬어줘"), first `preview_note_edit` the arguments you would
  send, show what will change and where in a few lines, ask "이대로 반영할까요?"
  ("Shall I apply these?"), and on a clear yes send the same arguments to
  `edit_note`. There is no `confirm` or `save` field: the preview was the dry run,
  and `edit_note` always saves.
  "최신 내용으로 고쳐줘" is the upgrade - what you found comes first, as in SKILL.md.
- Report what changed in the user's words (`4번째 문단 오타 2곳, "설치 방법" 절 마지막
  문장 바꿈`), not the text again - never a block id like `B7.k3f9x`. The result names
  each place in English (`paragraph 4 under "설치 방법"`, `list item 2 under "준비물"`,
  `the heading "설치"`, `the title`); say it the user's way, section names in double
  quotes (never 「」): "설치 방법" 절 넷째 문단, "준비물" 목록 둘째 줄, "설치" 소제목,
  글 제목.
- "방금 고친 거 되돌려줘" → the `edit_note` result says how to undo each change (a text
  change: `find` = its after, `content` = its before). Further back → "Go back to an
  earlier version" below.
- The rules in SKILL.md hold: the writer's voice stays, and nothing new goes in
  without a page you opened behind it.

## Title, summary, tags, cover

- Title → `edit_note` with `title`, as above.
- Summary, tags or cover → `publish_note` again with the same `pageId` and only the
  fields that change (`summary`, `tags`, `thumbnailUrl`). A new cover is drawn as in
  [cover.md](cover.md), with what they asked for. This republish:
  - keeps the original publish date,
  - does **not** notify subscribers again,
  - doesn't count toward today's publish limit and isn't stopped by it,
  - runs Tilnote's publish check again - if that stops it, the post is off the blog
    (SKILL.md, "When a call fails").
  On a draft, `publish_note` would publish it - see "Applying" in SKILL.md.

## Take it down

"그 글 내려줘", "비공개로 돌려줘", "take it down" with nothing more means
**`unpublish_note`**. Then say: the post is off the blog, the note itself is kept as a
private draft, and it can be published again any time.

- `unpublish_note` is safe to repeat. A note that is already private comes back
  `alreadyPrivate: true` - not an error, nothing to apologise for.
- Search engines drop the page on their next visit, so it can linger in results for a
  while. Say so if they're worried about it being seen.
- Publishing it again later (`publish_note` with the `pageId`) keeps the original
  date and goes out without notifying subscribers.

## Delete - only when asked in so many words

`delete_note` destroys the note, its images and its place in any book. There is no
trash can. Use it only when the user asks for the note to be gone - "완전히 지워줘",
"삭제해줘", "흔적도 없이" - not for "내려줘".

1. Name the note and confirm: "'○○' 노트를 완전히 지울까요? 되돌릴 수 없어요."
   ("Delete the note '○○' for good? It can't be undone.")
2. On a clear yes, `delete_note` with `confirm: true`.

If the request is ambiguous ("그거 없애줘"), unpublish, then say the note is kept and
can be deleted if that is what they meant.

## Go back to an earlier version

"아까 버전으로 되돌려줘", "AI가 고치기 전으로", "어제 거로":

1. `list_note_versions` with the `pageId`. Tilnote keeps the version a note had right
   before each change - from the web editor, from an AI app, or from Tilnote's own AI -
   up to 20 per note, for 30 days.
2. If the request points to exactly one version ("AI가 고치기 전으로" and only one
   recent `replacedBy` `mcp` (an AI app) or `agent` (Tilnote's own AI) entry -
   `replacedBy` names what changed the note after that version, so this entry holds
   the text from just before the AI's change), restore it in step 3 and name the other
   recent versions in one line, in case they meant another. Otherwise show the two or
   three likeliest, newest first: when (the user's local time - Korean time for a
   Korean user), what replaced it (`replacedBy`), and its first line (`preview`). If
   it's unclear which one they mean, `get_note_version` and compare with the current note.
   One version can cover several changes: an AI app's edits to the same note within
   about 10 minutes are kept as one version, and its `change` line names only the
   first. So when this conversation changed the note more than once,
   `get_note_version` the one you'd restore and compare it with the current note; if
   more would go back than they asked for, say so in one line ("이 판으로 돌리면 아까
   넣은 ○○도 같이 빠져요", "Going back to this version also takes out the ○○ I added
   earlier") and restore on a yes. To undo only the last change, use the undo line
   of its `edit_note` result instead.
3. `restore_note_version` on that one, or the one they pick. The current state is
   saved as a new version first, so the restore can itself be undone - tell them the
   text they had before the restore is kept and they can go back to it.
4. Publish status, tags and cover don't change. If the post is published, the
   restored text is what readers see now - say so.

No versions listed (older than 30 days, or never changed) → say so; nothing to restore.
