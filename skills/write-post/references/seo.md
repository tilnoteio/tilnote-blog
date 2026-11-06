# Easy to find in search and in AI answers (SEO·GEO)

Search engines and AI answer engines reward the same thing: a page that answers a real
question clearly, with something in it only this writer knows. There is no separate
trick for AI answers. Tilnote already builds the page's meta description, share card,
sitemap and article markup from the post's title, summary and cover - your part is
the writing below.

## Title

- The search term near the front: "로컬 LLM 맥북 에어 8GB 후기" rather than "후기:
  맥북으로 해 본 로컬 LLM".
- Specific: the model, the version, the number, the situation.
- About 20-40 Korean characters (50-60 characters in English). Search results cut
  long titles.
- Honest: the post delivers what the title promises. No "충격", no "총정리" unless it
  is one.
- Not the blog name - the title is the post's alone.

## Opening: answer first

The first two or three sentences answer the title's question. Search snippets and AI
answers quote the start of a page; a post that opens with background loses both.

- 전: "요즘 로컬 LLM에 대한 관심이 높아지고 있습니다. 오늘은 맥북에서 로컬 LLM을 실행하는 방법에 대해 알아보겠습니다."
- 후: "맥북 에어 M2 8GB로도 3B 모델은 돌아간다. 한 문장에 10초쯤 걸려서, 회의록 요약까지는 쓸 만했고 긴 글쓰기는 답답했다."

## Headings that answer

- A `##` heading says the answer or the step, not a label:
  `## 8GB에서 3B 모델은 한 문장에 10초` beats `## 결과`.
- One idea per section. Someone reading only the headings should get the gist.
- No `#` in the body - the title is the page's only top heading.

## Dates on facts that move

- Prices, versions, limits, release status, policies: put "2026년 10월 기준" (the
  current month) next to them, or once near the top if the whole post is
  time-sensitive.
- Name versions: "Ollama 0.x" rather than "최신 버전".

## Summary - Tilnote's 3줄 요약 (`summary` in create_note, update_note, publish_note)

One lead sentence saying what the reader gets, then up to three lines starting with
"- ". Plain text, 500 characters at most, no headings or markdown links. It shows
above the published post and becomes the search description and the share card
text, so include the search term once. Save it with the draft (`create_note`), so the
note carries it from the start; the publish dialog then keeps it instead of
generating one.

```text
맥북 에어 M2 8GB로 로컬 LLM을 돌려 보고 어디까지 쓸 만한지 정리했어요.
- 3B 모델은 한 문장에 10초 안팎
- 회의록 요약은 쓸 만, 긴 글쓰기는 답답
- Ollama 설치부터 첫 질문까지 10분
```

## Tags are search words

Up to five, the words people type (`로컬LLM`, `Ollama`, `맥북에어`), not filing labels
(`AI`, `메모`, `TIL`, `일상`).

## Links

- **Internal:** 1-3 related published posts by the same writer, where they help the
  reader. Address: the note's `publicUrl` from the tools only
  (`https://tilnote.io/pages/<pageId>`) - skip one whose `publicUrl` is null (a paid
  book's chapter). Never `https://tilnote.io/home?pages=...` - that is the private
  editor address. Link text says what is there ("[설치 과정은 이전 글에
  정리](https://tilnote.io/pages/...)").
- **External:** pages you opened, primary sources first (official docs, release
  notes, the announcement itself), with link text that names them ("[Ollama 설치
  문서](...)"), not "여기". A source you cite in a post you write is a footnote -
  `[^1]` in the sentence, the page under `## 참고` (`## References` in English) at the end. A post the user wrote
  keeps its links as they are.

## One diagram, only when it helps

When a process (steps, a flow) or a comparison is hard to follow in text, draw one
simple diagram:

- Write a self-contained SVG: a width and height or a viewBox, presentation
  attributes (`fill`, `font-size`) rather than `style`, no `<image>`, `<use>` or
  `<foreignObject>`, no outside fonts or pictures. Keep the words in it short.
- `create_image_from_svg` with `alt` that says what it shows ("Dockerfile 빌드 단계에서
  ARG 값이 ENV로 넘어가는 흐름"), and pass the note's `pageId` when you have it.
- Put the returned markdown where the diagram belongs.

One per post at most. No decorative pictures.

## FAQ only from real questions

If the user asked questions in the conversation that readers would also ask, and the
body doesn't already answer them, end with `## 자주 묻는 질문` (`## FAQ` in English) and 2-4 of *their*
questions in their words, each with a short answer. Never invent questions to fill an
FAQ - the real ones are what people search for.

## Don't

- Repeat the search term in every heading and paragraph.
- Add an llms.txt, an "AI 요약용" section, hidden text, or a fake "업데이트" date. None
  of it helps, and some of it gets a page ranked down.
- Copy the whole post to another blog. Duplicates compete with each other; share a
  summary and the link instead.
- Pad to reach a length.
