# Card images

A card is words on a plain background, drawn as SVG and turned into a picture by
`create_image_from_svg`. No AI-drawn pictures, no photos - just the post's own point,
set large enough to read on a phone.

## What Tilnote's renderer accepts

- A root `<svg>` with `width`, `height` and `viewBox`.
- Shapes and text: `rect`, `line`, `path`, `circle`, `text`, `tspan`, `g`, gradients.
- Presentation attributes for looks: `fill`, `font-family`, `font-size`,
  `font-weight`, `text-anchor`, `opacity`.
- **Not accepted:** `<style>` or `style="..."` (stripped), `<image>`, `<use>`,
  `<foreignObject>`, `url(...)` pointing outside the file, web fonts, `<!DOCTYPE>`.
  The SVG must be self-contained.
- Emoji may render as empty boxes - leave them out.
- Escape `&` as `&amp;` and `<` as `&lt;` inside text.

Call it with the size you drew at, so it isn't scaled:

```text
create_image_from_svg({ svg, alt, maxWidth: 1080 })   // 1080×1350 card
create_image_from_svg({ svg, alt, maxWidth: 1200 })   // 1200×630 link card
```

`alt` says what the card shows, in the user's language: "맥북 에어 8GB로 로컬 LLM 돌려
본 후기 - 3B 모델 한 문장 10초, 회의록 요약은 쓸 만". Pass the post's `pageId` too.
Images are limited per day, so a 카드뉴스 set stays at six cards or fewer.

## Breaking lines by hand

SVG does not wrap text. Every line is its own `<tspan>` with its own `x` and `y`.

- **Width per character:** a Korean syllable is about 1.0 × font-size wide, a Latin
  letter or digit about 0.55 ×, a space about 0.3 ×.
- **Characters per line** ≈ usable width ÷ font-size for Korean text. On the
  1080-wide card with 96px margins (888 usable): 80px → about 11 syllables, 64px →
  about 13, 42px → about 21. English text fits about 1.8 times as many letters: 80px →
  about 20, 64px → about 24, 42px → about 38.
- **Break between words** (어절), never inside one. Keep a particle with its word
  ("8GB로", not "8GB / 로"), a number with its unit ("10초", "10 sec"), and don't
  leave a single short word alone on the last line.
- **Line height** about 1.35 × font-size.
- **Too long?** Three title lines at most. Over that, drop the title to the next size
  down; still over, use a shorter phrase from the post (its own words, not new ones).

## Template: 1080×1350 (Instagram)

```svg
<svg xmlns="http://www.w3.org/2000/svg" width="1080" height="1350" viewBox="0 0 1080 1350">
  <rect width="1080" height="1350" fill="#F6F4EF"/>
  <g font-family="Pretendard, Noto Sans CJK KR, Noto Sans KR, Apple SD Gothic Neo, Malgun Gothic, sans-serif">
    <rect x="96" y="140" width="80" height="10" fill="#2F5BDA"/>
    <text x="96" y="236" font-size="40" font-weight="700" fill="#2F5BDA">로컬 LLM 후기</text>
    <text font-size="80" font-weight="800" fill="#16181D">
      <tspan x="96" y="400">맥북 에어 8GB로</tspan>
      <tspan x="96" y="508">로컬 LLM</tspan>
      <tspan x="96" y="616">돌려 본 후기</tspan>
    </text>
    <rect x="96" y="720" width="888" height="2" fill="#D8D4CA"/>
    <text font-size="42" fill="#3A3F4A">
      <tspan x="96" y="820">3B 모델, 한 문장에 10초쯤</tspan>
      <tspan x="96" y="890">회의록 요약은 쓸 만</tspan>
      <tspan x="96" y="960">긴 글쓰기는 아직 답답</tspan>
    </text>
    <text x="96" y="1250" font-size="32" fill="#6B7080">전체 글은 프로필 링크에서</text>
  </g>
</svg>
```

Slots: a small label (top), the title (2-3 lines), a rule, 2-3 key points from the
post, a footer. Keep the bottom 100px clear - Instagram's grid crops portrait cards
toward the middle.

## A 카드뉴스 set (3-6 cards)

Same canvas, same colours, same margins on every card:

1. **Cover** - the template above.
2. **One point per card** - a big line (the point, 64-72px, up to 3 lines) and one or
   two small lines (40-42px) explaining it. Number them in the label ("1/3").
3. **Last card** - one line of what the post adds ("설치부터 결과까지") and
   "전체 글은 프로필 링크에서".

Points come from the post in its order. A card set is not the place for anything the
post doesn't say.

## Template: 1200×630 (link card)

For Facebook, LinkedIn or a blog cover when the user wants one. If they want it as the
post's cover image, that is `publish_note` with the same `pageId` and the image URL as
`thumbnailUrl` - only when they ask. (When this skill publishes a private post first,
its cover is drawn as in [cover.md](cover.md), not from this card.)

```svg
<svg xmlns="http://www.w3.org/2000/svg" width="1200" height="630" viewBox="0 0 1200 630">
  <rect width="1200" height="630" fill="#F6F4EF"/>
  <g font-family="Pretendard, Noto Sans CJK KR, Noto Sans KR, Apple SD Gothic Neo, Malgun Gothic, sans-serif">
    <rect x="80" y="96" width="64" height="8" fill="#2F5BDA"/>
    <text font-size="64" font-weight="800" fill="#16181D">
      <tspan x="80" y="220">맥북 에어 8GB로 로컬 LLM</tspan>
      <tspan x="80" y="306">돌려 본 후기</tspan>
    </text>
    <text x="80" y="420" font-size="34" fill="#3A3F4A">3B 모델, 한 문장에 10초 · 회의록 요약은 쓸 만</text>
  </g>
</svg>
```

Usable width is 1040: 64px → about 16 syllables a line, 34px → about 30. Keep the
words in the middle 1000×500 - some networks crop the edges.

## Colours

One accent colour on a light, plain background, dark text. If the user names a colour
or their blog has one, use it for the accent only. Keep contrast high - a card is read
small, on a phone, in a scroll.
