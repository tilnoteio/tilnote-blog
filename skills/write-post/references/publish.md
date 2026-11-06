# Before and after publishing

Publishing puts the post on the public internet under the user's name, counts against
a daily limit, and is shared with readers immediately. These checks are cheap; a post
that went out with a stale price in it is not.

## Checks before asking "이대로 공개할까요?"

1. **Facts that move.** If you can search, re-check the time-sensitive facts in the
   post: prices, version numbers, limits, release status, dates, "지금은 무료" claims.
   This matters most when the draft was written on another day (an idea note) or from
   memory. Fix what changed, keep the "2026년 10월 기준" style date next to it, and
   tell the user in one line what you corrected. If you can't search, say which facts
   are "as of" when, rather than presenting them as current. Never change the user's
   own results - their "한 문장에 10초" is a measurement, not a fact to update.
2. **Title** is what someone would type into a search box, with the search term near
   the front. See [seo.md](seo.md).
3. **Opening** answers the title's question in the first two or three sentences.
4. **Summary** - the 3줄 요약 saved with the draft. `get_note` shows it as `summary`,
   with any change the user made in the editor; keep their wording. If the post has
   changed what it says since, or an older draft has none, write one (one lead
   sentence saying what the reader gets, then up to 3 lines starting with "- ", plain
   text, 500 characters at most) and save it on the note with `update_note`
   (`pageId` and `summary` only). It becomes the line above the post, the search
   result snippet and the share card text. If `get_note` shows the note is already
   published (the user may have published it from the editor), its summary is live:
   don't replace it without showing the old and new one and getting a yes.
5. **Tags**: up to five, words people search for (`로컬LLM`, `Ollama`), not filing labels
   (`AI`, `메모`, `TIL`).
6. **One topic.** If the conversation produced two posts' worth, offer to split.
7. **Links** are pages you actually opened. Links to the user's own posts use the
   `publicUrl` the tools returned (`https://tilnote.io/pages/<id>`) - published posts
   only, none whose `publicUrl` is null (a paid book's chapter) - never a
   `https://tilnote.io/home?pages=...` address.
8. **Footnotes** match: every `[^n]` in the body has its `[^n]: [제목](URL)` line under
   `## 참고` (`## References`) at the end, every line there is cited, and no `[^1, 2]` - write
   `[^1][^2]`. Something the user added in the editor may have broken this.

Then, unless the request itself already counts as the yes ("5. Publish" in the skill:
they asked to publish - "올려줘" - a draft they have seen, or a post built on their own
part of this conversation), ask once, plainly: "이대로 공개할까요?" A clear yes publishes.
Anything else - a change, a question, silence - doesn't.

## Publishing

`publish_note` with:

- `pageId` of the saved note - never omit it to create a second copy
- `summary` - the one on the note (check 4), `tags`
- `thumbnailUrl`: the cover image you drew on the yes - see [cover.md](cover.md). Leave
  it out when the note already has a cover or the post has a photo of the user's own
- `aiGenerated: true` (you drafted it; the mark can't be removed later, which is fine
  because it is true)
- `content` only if the body changed since saving

Report the returned URL, one share line, and one offer - nothing more. Write the
share line in the post's own voice (its endings, not the example's); it goes out
under the user's name:

> 올렸어요: https://tilnote.io/pages/... (대표 이미지도 만들어 넣었어요)
> 공유용 한 줄: "맥북 에어 8GB로 로컬 LLM 돌려 봤더니, 느리지만 문서 요약엔 쓸 만했어요."
> 스레드·링크드인 같은 SNS용 문구도 만들어 드릴까요?

If the user says yes, the share-post skill takes it from there (a version per network,
a tracked link and a share window for each).

## If a call fails

| Error | What to do |
|---|---|
| insufficient permissions / `mcp:publish` | The connection was approved without publishing. The user has to reconnect Tilnote and allow publishing; retrying won't help |
| content too short | Below the server minimum. Keep it private. Don't pad |
| daily limit | Shared with posts made on tilnote.io. Keep it private; it can go out after the reset the error names (00:00 Korea time = 15:00 UTC) |
| did not pass the publish check | Tilnote's spam check stopped it. Say so plainly: a draft stays private, but a post that was already live (a republish for summary, tags or cover) is now off the blog - say that too. Don't reword to get past it, and don't try again without their OK |
| wiki or clip page | Those pages can't be published |

Spam control is the server's job (daily limit, minimum length, spam check, delayed
search indexing for new accounts), not yours. Don't lecture.

## The cover image

Every post goes out with one, without asking: on the yes, draw it as in
[cover.md](cover.md) and pass its URL as `thumbnailUrl`. Don't ask about it before
publishing - every extra question before publishing is a reason to stop.

## Changing it later

A saved draft is private: change it as in "Talk and revise" in the skill. A
published post changes live at once:

- "고쳐줘" → `edit_note` on the published note: a typo or a word → `find` with a short
  phrase around it; a whole paragraph → `target_id` from `get_note_blocks`. Report what
  changed and where in the user's words ("「설치 방법」 절 둘째 문단"), not the text
  again and never a block id. The fix is live at once - no need to publish again. Apply
  straight away only what the user spelled out (a typo, a sentence they gave); for new
  wording of your own, `preview_note_edit` the operations first, show what will change
  and where, ask "이대로 반영할까요?", and on a yes send the same arguments to
  `edit_note` (no `confirm` or `save` field).
- Title change → `edit_note` with `title` (and `operations: []` when nothing else
  changes), or in the same call as body fixes.
- New summary, tags or cover → `publish_note` again with the same `pageId` and only
  those fields. A republish keeps the original publish date and does not notify
  subscribers again.
- "표지 바꿔줘", "대표 이미지 다시" → draw a new one as in [cover.md](cover.md), with
  what they asked for (other words, another colour), and republish with only
  `thumbnailUrl`.
- "이 글에 사진 넣고 싶어" → the upload link and placing, as in [photos.md](photos.md) -
  show where each picture goes and ask before it goes live.
- More than a fix - bringing an older post up to date, making it easier to find,
  linking it to later posts ("이 글 업그레이드해줘", "이 글 업데이트해줘") → upgrade-post.
- "아까 버전으로 되돌려줘", "AI가 고치기 전으로" → `list_note_versions`. If the request
  points to exactly one version (one recent change made by AI), `restore_note_version`
  it and name the other recent versions in one line; otherwise show the two or three
  likeliest (when, what changed it, the first line) and restore the one they pick.
  One version can cover several changes: an AI app's edits to the same note within
  about 10 minutes are kept as one version, and its `change` line names only the
  first. So when this conversation changed the note more than once, `get_note_version`
  the one you'd restore and compare it with the current note first; if more would go
  back than they asked for, say so in one line ("이 판으로 돌리면 아까 넣은 ○○도 같이
  빠져요") and restore on a yes. To undo only the last change, follow the undo line of
  its `edit_note` result instead.
  Tilnote keeps the latest 20 versions of a note plus the first of each day, for 30 days, and a restore saves the
  current state first, so it can be undone too - tell them so. Publish status, tags and
  cover stay as they are. This works on a private draft too.
- "내려줘" → `unpublish_note`. The note stays as a private draft; say so. Delete only if
  they explicitly ask for the note to be destroyed - that can't be undone.
