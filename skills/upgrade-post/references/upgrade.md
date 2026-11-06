# The upgrade, area by area

An upgrade grows a post that already works; it doesn't rewrite it. Readers who come
back should recognise it; search engines that rank it should still find what they
ranked. Each area below says what to look for, where a new piece goes, and how the
change shows.

## 최신화 - what goes stale

**Look for:** prices and plans, version numbers, model names, limits (tokens, quotas,
file sizes), release status (베타, 미리보기, 출시 예정), policies and laws, and words
that tie a sentence to a moment - "현재", "최신", "아직", "곧", "이번 달", "올해".

**Check** each against its primary source - the vendor's pricing page, release
notes, official docs, the law or the announcement itself - and open it. A news
article is second best; say which kind you used. One fact per source you opened; never
a number from memory or from a search snippet you didn't open.

**Three outcomes:**

- Still true → leave the sentence as it is. Adding "2026년 11월 기준" to a fact you
  didn't change is fake freshness.
- Changed → correct it in place, in the post's own endings, with the date and its
  source: `현재 최신 버전은 Next.js ○○이다(2026년 11월 기준).[^1]`
- Gone (a product ended, a feature was removed, a free tier closed) → say so in that
  sentence ("2026년 9월에 서비스가 끝났다"). Don't quietly delete the section - a
  reader who searched for it should learn it is gone.

**The writer's own results stay.** A measurement, a screenshot, a verdict - those are
what they saw then. If the product changed so much that the result may not hold, add
one dated sentence after it ("2026년 11월 버전에서는 다를 수 있어요") and leave
theirs untouched.

**Can't search** → change nothing in this area. In what you report, list the facts you
could not check, and offer one line near the top instead: "이 글의 요금과 버전은 2025년 2월
기준이에요."

## Marking what changed

- Next to each corrected fact: "(2026년 11월 기준)" - the month you checked.
- When at least one fact changed, one line at the very top, in the post's voice:

  ```markdown
  > 2026년 11월 업데이트: 버전과 설치 명령을 지금 기준으로 고쳤다.
  ```

  One line, not a changelog. A later upgrade replaces it with the newer month and what
  changed then.
- Nothing factual changed (wording, links, summary, cover) → no update line.
- Tilnote keeps the original publish date; don't write the post as if it were new.

## Citing what you add

The post's existing links stay as they are. A source for a fact you corrected:

- The post has `## 참고` (or `## References`) footnotes → the next unused number, which `get_note` prints
  (`Footnotes: highest [^2], next free [^3]`); in the same `edit_note` as the
  sentence, its line `append`ed with that section (`section: "참고"`). Don't renumber
  the others.
- It has none → start them for what you added: `[^1]` right after the sentence, after
  the period, and a `## 참고` section (`## References` in an English post) at the very
  end (`append` with no `section`,
  `content` starting with the heading):

  ```markdown
  ## 참고

  [^1]: [Next.js ○○ - Next.js Blog](https://nextjs.org/blog/...)
  ```

  The link text is the page's own title, with `[` and `]` escaped as `\[` `\]`. Only
  pages you opened.

## 더하기 - where a new piece goes

Before writing anything in, check whether the post already says it. If it does, make
that sentence better (a number, a date, a source) instead of adding a second one.

| What | Where |
|---|---|
| A corrected fact | In place, in the sentence that held the old one |
| Their result or experience | At the end of the section it is about - continuing its last paragraph when it carries on from it, otherwise (or when it starts with a month) as the next paragraph |
| Their view | Where the post draws its conclusion - or the opening, if it is the point |
| An answer to a reader's question | Where the question would come up while reading - but not inside a section that is the writer's own account (「써 보니」, 「후기」); next to it instead. A short FAQ only from questions the user asked, before `## 참고` |
| A new subtopic from a source | Its own section next to the one it relates to, before `## 참고` - only when it is more than a sentence or two |
| A follow-up post's link | Near the top: "이후 바뀐 내용은 [○○](...)에 정리했다." |

**A source they bring**, set against the post:

- Already in the post → nothing to add. Say so; it confirms the post.
- New → in, where the table says, cited.
- Contradicts the post → the newer primary source wins. When the change itself is
  worth knowing (a free tier that closed, a default that flipped), keep what was true
  then: "처음엔 무료였는데 2026년 9월부터 유료다." Otherwise - or when the post was
  already wrong the day it went up - just correct it.
- The source itself is out of date (it says 15 is out; 16 is out now) → check it like
  any other, use the newest primary source, and tell the user in a line.
- A news article that cites a primary source → open the primary source and cite that.
- Nothing you can open backs it (a lecture, a book, an internal document) → it goes
  in on the user's word, with its origin in the sentence: "○○ 밋업 발표에 따르면 …",
  "『○○』에서는 …". No footnote, since there is no page you opened.
- Someone else's text → retold in the writer's voice. Two of its sentences in a row
  copied as they are is too much; a short quote in quotation marks, with its origin,
  is the most.

**Leave the rest as it was.** Sections the addition doesn't touch stay word for word,
with the writer's own punctuation (—, “ ”, …) and line breaks. Change a sentence of
theirs only where the addition needs it (a tense, a "아직" that is no longer true).

**Their words** go in as they said them, first person, fixing only spelling. Don't
add hedges or details they didn't give ("체감상", "대략"), and don't explain their
sentence to the reader.

## 정리 - keeping a grown post readable

A post that keeps taking things in drifts: a new section for every addition, the same
point twice, an "추가:" paragraph at the end, an opening that no longer says what the
post now covers.

- **Fold, don't stack.** An addition that repeats an earlier point merges into it. A
  section holding one sentence joins the section next to it.
- **Move what landed at the end** to where it belongs.
- **Headings** still say the answer or the step; rename one only when what's under it
  changed.
- **Opening** still answers the title - and mentions what the post now covers when the
  additions changed that.
- **Two topics** → the second becomes a follow-up post (write-post), linked from this
  one. This post keeps its address and its question.
- **Shorter is fine.** Cutting a paragraph that the additions made redundant is
  tidying too.
- Tidying moves and folds. Apart from dropping words a fold repeats, it doesn't reword
  their sentences. Asked for, it goes straight in, live post or not (SKILL.md, "Asked
  for, or suggested"); the report names what moved and what was dropped.

## 검색 - title, opening, summary, cover

- **Title on a post that already gets views:** people find it by those words. Keep its
  search term and its first words. Change it only when it is a label ("○○ 생각") or
  now wrong ("2025년 최신 비교" after the facts moved to 2026) - and then change only
  the wrong part ("2026년 비교"). A post with few views can take a better title more
  freely ([seo.md](seo.md)).
- **Opening:** the first two or three sentences answer the title's question. If the
  post opens with background, name the sentence to bring forward - their sentence,
  moved, not a new one of yours, unless an answer exists nowhere in the post.
- **Headings** that say the answer or the step, not "결과", "마무리".
- **Summary** missing → one lead sentence and up to three "- " lines from what the
  post says, in its voice.
- **Cover** missing (`Cover: none` in `get_note`'s text, or `thumbnailUrl: null` in
  its data, and no photo of their own in the post) → draw one as in
  [cover.md](cover.md). A cover you can see stays - never replace it unasked.
- **Tags:** up to five search words; filing labels (`AI`, `메모`, `TIL`) give way.

## 연결 - links to their own posts

- From this post to the writer's related **published** posts: a later follow-up on the
  same topic is the most useful, near the top - "이후 바뀐 내용은 [○○](...)에 정리했다."
  Then one or two posts that go deeper on a step this one skims.
- Public addresses only: the `publicUrl` that `search_notes` / `get_note` return
  (`https://tilnote.io/pages/<pageId>`); skip a post whose `publicUrl` is null - a paid
  book's chapter has no page of its own. Never the `url` they also return,
  `https://tilnote.io/home?pages=...` - that is the private editor and readers can't
  open it.
- One to three links. Only this post is edited; if an older post should point here
  too, offer it as its own upgrade.
- An outside link whose page is gone → the page's new address, or an equivalent
  official page you opened, named before it goes in.

## 작성자 몫 - what only they can add

- One question in the first message, tied to a place in the post: "'이런 분께' 절 -
  지금은 어느 요금제 쓰세요?" Others come up only as the conversation does.
- Always optional: the upgrade goes in without the answers.
- An answer goes in close to their words, first person, where it belongs. Never write
  it for them, not even as a placeholder.

## What an upgrade doesn't do

- Merge two posts or move one to a new address. A second topic becomes a follow-up
  post (write-post), linked from this one.
- Turn one kind of post into another - a review into a how-to.
- Pad. An upgrade can make a post shorter: an empty paragraph cut is an upgrade too.
