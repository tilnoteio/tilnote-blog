# The cover image (대표 이미지)

Every published post gets a cover. Tilnote shows it on the post's card in lists and
search, and as the picture when the link is pasted into KakaoTalk, Threads or
LinkedIn. A post without one has a bare card, and its share card falls back to plain
text.

## When

- On the yes to publish, right before `publish_note`, when `get_note` says the note
  has no cover: `Cover: none` in its text (or `thumbnailUrl: null` in its data - some
  apps show only the text). Pass the cover's URL as `thumbnailUrl`.
- The note already has a cover - a `Cover:` line with an address, or a
  `thumbnailUrl` → keep it. Never replace a cover you can see; draw a new one only
  when they ask ("표지 바꿔줘", "대표 이미지 다시").
- The post has a photo or screenshot the user put in themselves → don't draw one;
  Tilnote uses the post's first image. A diagram you drew doesn't count.
- They said they don't want one → none.

## Draw it

A 1200×630 SVG, rendered with
`create_image_from_svg({ svg, alt, pageId, maxWidth: 1200 })`:

```svg
<svg xmlns="http://www.w3.org/2000/svg" width="1200" height="630" viewBox="0 0 1200 630">
  <rect width="1200" height="630" fill="#F6F4EF"/>
  <rect x="560" y="150" width="80" height="10" fill="#2F5BDA"/>
  <g font-family="Pretendard, Noto Sans CJK KR, Noto Sans KR, Apple SD Gothic Neo, Malgun Gothic, sans-serif">
    <text font-size="80" font-weight="800" fill="#16181D" text-anchor="middle">
      <tspan x="600" y="290">맥북 에어 8GB로</tspan>
      <tspan x="600" y="398">로컬 LLM 돌리기</tspan>
    </text>
  </g>
</svg>
```

- **Small and cropped.** Tilnote's list cards crop the cover to 4:3 and show it about
  110px wide. Keep every word centred (`text-anchor="middle"`, `x="600"`) and inside
  the middle 840px (x 180-1020), and keep the type big.
- **Words:** the post's core in two lines, three at most - the search term and the
  hook, taken from the title's own words, not the whole title and nothing the post
  doesn't say. 80px, weight 800, about 10 Korean syllables a line at most - about 17
  letters of English (a syllable is about 1.0 × the font size wide, a small Latin
  letter or digit 0.55 ×, a capital 0.7 ×, a space 0.3 ×; the line has 10.5 × to
  spend).
  Break between words, never inside one, and keep a particle with its word
  ("8GB로"). Too long → a shorter phrase from the title, not smaller type.
- **Lines:** two lines sit at y 290 and 398 with the bar at y 150; three at y 236, 344
  and 452 with the bar at y 96.
- **Colour:** one plain background, one text colour, one accent for the bar. Pick a
  set that suits the topic:

  | 배경 | 글자 | 막대 |
  |---|---|---|
  | `#F6F4EF` | `#16181D` | `#2F5BDA` |
  | `#FFF1E6` | `#1F1300` | `#C2410C` |
  | `#1E3A8A` | `#FFFFFF` | `#93C5FD` |
  | `#0F5132` | `#FFFFFF` | `#A7F3D0` |
  | `#16181D` | `#FFFFFF` | `#FACC15` |

  If `내 문체 메모` or the user names a colour, use it for the bar.
- **Not accepted by the renderer:** `<style>` or `style="..."`, `<image>`, `<use>`,
  `<foreignObject>`, `url(...)` to anything outside the file, web fonts. Emoji can
  come out as empty boxes - leave them out. Escape `&` as `&amp;` and `<` as `&lt;`.
- No photos, logos or AI-drawn pictures - the post's own words on a plain background.
- `alt` says what the cover reads, in the user's language: "맥북 에어 8GB로 로컬 LLM
  돌리기 - 글 표지".

If the render fails or the day's image limit is reached, publish without a cover and
say so in one line. The first image in the post, if any, becomes the cover.
