# Writing for each network

Tilnote's `get_share_kit` uses the same numbers as this file, so a version written to
these rules passes its check the first time.

## At a glance

| Network | Length | Link | Share window | How Korean bloggers do it |
|---|---|---|---|---|
| Threads | 500 per post (emoji count as their UTF-8 bytes), one topic tag | A thread: end of the last post. One post: attached by the share window | `threads.com/intent/post?text=&url=` (a thread: post 1 only, no `url`) | A thread of 3-5 posts, link at the end |
| X | Weighted 280 (Korean 2, link 23) → about 128 Korean or 250 English characters with the link | Attached by the share window | `x.com/intent/tweet?text=&url=` | One hook line + link |
| LinkedIn | 3,000, folds after about 210 | At the end | `share-offsite/?url=` (link only → paste the text) | Two-line hook, 600-1,300 characters |
| Facebook | Loose | Preview card | `sharer.php?u=` (link only) | 2-4 short paragraphs |
| Bluesky | 300 graphemes, link included (counted short, as the composer shows it) | Added after a blank line | `bsky.app/intent/compose?text=` | Short |
| KakaoTalk | About 4 lines | At the end | None → copy | 3-4 polite lines + link |
| Band | Loose | Added on a new line | `band.us/plugin/share?body=&route=` | Like KakaoTalk, a little longer |
| Naver Blog | - | At the end | `share.naver.com/web/shareView?url=&title=` (link and title only) | **Summary + link only** - copying the whole post makes a duplicate and both rank down |
| Instagram | Caption 2,200, first ~125 visible, at most 5 hashtags | Not clickable → "프로필 링크" | None → copy, plus a card image | 1080×1350 card + caption |

How each one is posted:

- **Share window with the text:** X, Bluesky, Band and a single Threads post open
  with your text and the link filled in. Don't write the link into the text.
- **A Threads thread:** the share window opens post 1 only, with no link. The user
  posts the rest as replies, and the tracked `link` goes at the end of the last post,
  after a blank line - you add it when presenting.
- **Share window with the link only:** Naver Blog opens with the link and title; the
  user pastes your summary. Don't write the link into the text. Tilnote reports Naver
  Blog as `copyOnly` true (the window doesn't take the text), but it is still posted
  through that window.
- **Copy and paste, no window for the text:** KakaoTalk, LinkedIn, Facebook and
  Instagram (`copyOnly` true). The text you present is the whole post - for KakaoTalk,
  LinkedIn and Facebook put the kit's tracked `link` where the section below says
  (pasting it makes the preview card); for Instagram, no link.

In every case the text you send to `get_share_kit` has no link - Tilnote counts the
link separately where it matters, including at the end of a thread's last post.

## Counting

- **Threads:** 500 per post. Every character is 1 (a Korean syllable is 1), except
  emoji, which count as their UTF-8 byte length - usually 4 each. In a thread, the
  last post's count includes the blank line and the tracked link (about 115), so
  leave that post's text under about 380.
- **X:** 280 weighted. Latin letters, digits, basic punctuation and spaces count 1;
  Korean, CJK and emoji count 2. The link counts 23 plus a space. So the text you
  write gets about 255 weighted - roughly 120-128 Korean characters with a few spaces
  and numbers, or about 250 characters of English.
- **Bluesky:** 300 graphemes including the blank line and the link. The link counts
  only as the short form the composer shows (`tilnote.io/pages/6a…`, about 26), not its
  full length, so the text gets about 270 - keep it under about 260.
- **LinkedIn:** 3,000; the first ~210 show before "더 보기".
- **Instagram:** 2,200; ~125 show before "더 보기"; 5 hashtags at most.
- **KakaoTalk, Band, Facebook:** no limit that matters; the preview shows about 4 lines.

## The example post

Every example below shares this post. Its facts are the only facts the examples use.
`(link)` in an example stands for that network's tracked `link` from the kit - it is
added when presenting, never sent in `texts`. Copy the shape, not the lines: a
sentence from these examples goes into your version only if your post says it.

> 맥북 에어 8GB로 로컬 LLM 돌려 본 후기 - Ollama로 3B 모델을 받아 회사 회의록 요약을
> 시켜 봤다. 한 문장에 10초쯤. 회의록 요약은 쓸 만했고 긴 글쓰기는 답답했다. 문서를
> 밖으로 보내지 않아도 된다는 게 컸다. 설치는 10분. (writer's endings: "~했어요")

## Threads

- **Shape:** 3-5 posts, separated by a line that is exactly `---`. Post 1 is the hook
  - the post's real point as a question or a sharp statement. The middle posts carry
  one point each. The last post wraps up and holds the link.
- **Tone:** spoken, short lines, line breaks for rhythm. The writer's endings.
- **Topic tag:** one, at the end of post 1 (`#로컬LLM`). Threads uses only one per
  post.
- **No emoji** unless the writer uses them; each costs 4.
- **Link:** at the end of the last post, after a blank line. The share window opens
  post 1 without a link; the user adds the rest as replies. (A single post, not a
  thread, gets the link from the share window instead.)

```text
맥북 에어 8GB로 로컬 LLM이 돌아갈까?
직접 돌려 봤어요.

#로컬LLM
---
Ollama로 3B 모델을 받아서
회사 회의록 요약을 시켜 봤어요.

한 문장 나오는 데 10초쯤.
느리긴 한데 기다릴 만은 했어요.
---
회의록 요약은 꽤 쓸 만했어요.
문서를 밖으로 안 보내도 된다는 게 제일 컸고요.

긴 글쓰기는 아직 답답해요.
---
설치부터 결과까지 정리해 뒀어요.
```

(When presenting, the last post gets a blank line and then the tracked link - the only
place the link appears in the thread.)

## X

- **Shape:** one post. One hook line, one line of the key fact. No thread unless asked.
- **Tone:** plain and direct.
- **Hashtags:** none, or one at most. They cost 2 per Korean character.
- **Link:** the share window attaches it; don't write it.

```text
맥북 에어 8GB로 로컬 LLM 돌려 봤어요. 3B 모델이 한 문장에 10초. 회의록 요약까진 쓸 만했고 긴 글은 답답했어요.
```

## LinkedIn

- **Shape:** the first two lines are the hook - they show before "더 보기". Then short
  paragraphs with blank lines: the situation, what was done, what was learned, who it
  helps. 600-1,300 characters when the post has that much to say; a short post gets a
  short version - never pad it.
- **Tone:** the writer, at work. First person only for what the post says they did.
  What it means for work, not hype.
- **Hashtags:** 3-5 at the end, search words.
- **Link:** at the end, after a line like "전체 과정은 블로그에 정리했어요:".

```text
회사 문서를 밖으로 보내지 않고 AI로 요약할 수 있을까요?
맥북 에어 8GB로 로컬 LLM을 직접 돌려 봤어요.

Ollama로 3B 모델을 받아 회의록 요약을 시켰더니 한 문장에 10초쯤 걸렸어요. 느리지만 회의록 요약에는 충분히 쓸 만했어요.

가장 컸던 건 문서가 내 노트북 밖으로 나가지 않는다는 점이에요. 다만 긴 글쓰기는 아직 답답했어요.

설치는 10분이면 끝나요. 전체 과정은 블로그에 정리했어요:
(link)

#로컬LLM #Ollama #업무자동화
```

## Facebook

- **Shape:** 2-4 short paragraphs. The link makes a preview card with the post's
  title and cover, so don't repeat the title.
- **Tone:** like talking to people who know the writer.
- **Link:** at the end of the pasted text; Facebook turns it into the preview card.

```text
맥북 에어 8GB로 로컬 LLM을 돌려 봤어요. 3B 모델로 회의록 요약을 시켰는데, 한 문장에 10초쯤 걸려도 쓸 만했어요.

문서를 밖으로 안 보내도 되는 게 제일 좋았고, 긴 글쓰기는 아직 답답했어요. 설치부터 정리해 뒀어요.
(link)
```

## Bluesky

- **Shape:** one short post, two or three lines.
- **Link:** added by Tilnote after a blank line, counted short - keep the text under
  about 260.

```text
맥북 에어 8GB로 로컬 LLM 돌려 본 후기.
3B 모델, 한 문장에 10초. 회의록 요약은 쓸 만, 긴 글은 답답.
```

## KakaoTalk

- **Shape:** 3-4 lines and the link. For a group chat (단톡방): what it is, the one
  finding, who it helps.
- **Tone:** polite (존댓말) unless the writer always writes 반말. No hashtags.
- **Link:** the last line. There is no share window - copy and paste.

```text
맥북 에어 8GB로 로컬 LLM을 돌려 본 후기를 정리했어요.
3B 모델로 회의록 요약까지는 쓸 만했고, 긴 글쓰기는 아직 답답했어요.
회사 문서를 밖으로 안 보내고 AI 써 보고 싶은 분께 도움이 될 것 같아요.
(link)
```

## Band

- **Shape:** like KakaoTalk, 4-6 lines - a band is a slower group, so a little context
  is welcome.
- **Link:** Tilnote adds it on a new line after the text.

```text
요즘 로컬 LLM 이야기가 많아서 맥북 에어 8GB로 직접 돌려 봤어요.
Ollama로 3B 모델을 받아 회의록 요약을 시켰더니 한 문장에 10초쯤 걸렸어요.
회의록 요약은 쓸 만했고, 긴 글쓰기는 아직 답답했어요.
설치는 10분이면 돼요. 과정은 블로그에 정리해 뒀어요.
```

## Naver Blog

- **Shape:** a 3-5 line summary to introduce the link. **Never the whole post** - a
  copy elsewhere is a duplicate document, and both pages rank down.
- **Link:** the share window fills the link and title; the user pastes the summary
  above it.

```text
맥북 에어 8GB로 로컬 LLM을 돌려 본 후기예요.
- 3B 모델은 한 문장에 10초쯤
- 회의록 요약은 쓸 만, 긴 글쓰기는 답답
- 설치는 10분
자세한 과정은 아래 링크에 정리했어요.
```

## Instagram

- **Shape:** a card image (see card.md) plus a caption. The caption's first line is
  the hook (it shows before "더 보기"), then 3-6 short lines of the key points, then
  where to read more.
- **Hashtags:** 3-5 at the end, at most 5.
- **Link:** not clickable in captions - write "전체 글은 프로필 링크에서", and remind the
  user to put the tracked link in their profile or a story link.

```text
맥북 에어 8GB로 로컬 LLM, 돌아갈까?

3B 모델로 회의록 요약을 시켜 봤어요.
한 문장에 10초쯤.
회의록 요약은 쓸 만했고, 긴 글쓰기는 아직 답답했어요.
문서를 밖으로 안 보내도 되는 게 제일 컸어요.

설치부터 결과까지 전체 글은 프로필 링크에서.

#로컬LLM #Ollama #맥북에어 #AI활용
```
