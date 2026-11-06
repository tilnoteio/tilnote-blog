# Learning first: explain, then lead the conversation

Only for a user who asked to understand the topic before writing ("먼저 설명해줘",
"나도 잘 몰라서 이해하고 쓰고 싶어", "공부하면서 같이 써 보자"). The explanation is for one
person who wants to learn the topic well enough to have questions and try it - not a
blog draft and not a report. It goes in the chat, in the user's language, for them to
read in 3-5 minutes. Nothing is saved yet - reading and asking is the point. (On the
usual path you write the post first and explain the topic in a few lines after it;
that is "Show the draft" in the skill.)

## Shape

```markdown
**한 줄로:** (what it is, in one sentence a newcomer understands)

**꼭 알아야 할 것**
1. ... (3-5 points; unpack every term the first time it appears)

**말이 갈리는 곳**
- ... (where sources disagree, or where "it depends" - and on what)
- ... (what is still unknown or changing fast)

**직접 해 보려면 (약 10분)**
1. ... (concrete steps they can do right now, with the exact command, menu or link)
2. ...
- 해 보면서 봐 둘 것: ... (the one thing worth noticing - speed, a difference, an error)

**출처**
- [page title](url) - one line on what it supports
```

The try section is optional: leave it out when the topic has no small one. Then one
next step, not a menu of different ones. After an explanation that step is inviting
their questions, with two or three example questions phrased the way they would ask -
the short list is still one step. The try is already above; don't offer it again as
an alternative. Add one short line that they can have the post any time:

> 궁금한 게 있으면 편하게 물어보세요. 예를 들면 이런 것들요:
> - 8GB 맥북에서도 기다릴 만한 속도가 나와요?
> - 회사 문서를 넣어도 정말 밖으로 안 나가요?
>
> 바로 쓰려면 '이제 써줘'라고 하세요.

## Rules that matter

- **Plain words over completeness.** Three points they understand beat seven they
  skim. If a term needs a paragraph, it probably isn't one of the 3-5.
- **Disagreement is content.** "Sources disagree on whether an 8GB laptop is enough"
  gives the writer something to test and an opinion to form. Smoothing it over removes
  the most interesting part of their future post.
- **The try must be small and real.** Something they can finish in one sitting with
  what they have. If the topic has no hands-on angle (a policy change, a news item),
  replace it with a question to think about: "내 일에는 어떤 영향이 있을지".
- **Sources are pages you opened.** No links from memory, no homepage links standing
  in for a specific claim. If you couldn't search, say which points need checking.
- **Dates.** For anything new, say when it is from ("2026년 9월 발표 기준").

## Example (abridged)

User: 로컬 LLM에 대해 블로그 글 쓰고 싶은데 잘 몰라서, 먼저 쉽게 설명해 줘

> **한 줄로:** 인터넷 너머 서버가 아니라 내 컴퓨터에서 직접 돌리는 AI 모델이에요. 데이터를 밖으로 보내지 않고 쓸 수 있어요.
>
> **꼭 알아야 할 것**
> 1. 모델 크기와 메모리: 모델이 클수록 똑똑하지만 메모리를 많이 먹어요. 노트북에서는 보통 작은 모델을 씁니다.
> 2. 실행 도구: 모델을 내려받아 대화창처럼 쓰게 해 주는 프로그램이 따로 있어요(예: Ollama, LM Studio).
> 3. 속도: 같은 질문도 클라우드 AI보다 느릴 수 있어요. 컴퓨터 사양에 따라 차이가 커요.
>
> **말이 갈리는 곳**
> - 일반 노트북으로 "쓸 만한가"는 용도에 따라 평가가 갈려요. 짧은 요약은 된다는 쪽, 긴 글쓰기는 답답하다는 쪽.
>
> **직접 해 보려면 (약 10분)**
> 1. Ollama 설치 → 2. 터미널에서 작은 모델 하나 받기 → 3. 평소 쓰던 질문 하나를 똑같이 해 보기
> - 해 보면서 봐 둘 것: 한 문장이 나오는 데 몇 초 걸리는지, 답이 클라우드 AI와 얼마나 다른지
>
> **출처**
> - (actually opened pages)
>
> 궁금한 게 있으면 편하게 물어보세요. 예를 들면 이런 것들요:
> - 8GB 맥북에서도 기다릴 만한 속도가 나와요?
> - 회사 문서를 넣어도 정말 밖으로 안 나가요?
>
> 바로 쓰려면 '이제 써줘'라고 하세요.

## Leading the conversation

Move it forward one step at a time. Each reply ends with one of these, or with the
offer to write (below) - one next step, not a menu of different ones:

- **Questions.** Offer two or three questions they might have, phrased the way they
  would ask them, and say they can ask their own instead. That short list is the
  reply's one step. Their own questions matter most - a question a beginner actually
  asked is what other beginners search for.
- **A try.** Give a small hands-on step they can do now: exact steps, and what to
  watch for while doing it ("속도가 얼마나 걸리는지 봐 두세요").
- **Their view.** After a try, or once they have asked enough: "해 보니 어땠어요?",
  "어느 쪽이 맞다고 보세요?"

Answer their questions properly and briefly - this is them learning, and a good answer
is what makes them want to keep going.

**Keep the writer's part.** Note, as close to their words as you can, every question
they asked, everything they tried and what they saw, and every opinion they gave.
These become the spine of the post. When you are working from an idea note, write
each one into that note as it comes, not only at the end - see
[idea-note.md](idea-note.md), "Keeping it up to date".

**When to suggest writing.** Once the writer has contributed at least one thing of
their own - a question with its answer, a result from trying, or a view, here or
already in their idea note - offer: "이제 글로 정리해 볼까요?" Let them decide when,
and write as soon as they ask ("이제 써줘", "그냥 써줘"). Don't drag it out with more
questions.

**If they stop part-way** ("오늘은 여기까지", "주말에 해 볼게"), save what you have as a
private idea note so a new conversation can pick it up - or, when you are working
from one, update its "어디까지 했나" - see [idea-note.md](idea-note.md). Tell them how
to resume: "다음에 '○○ 글 아이디어 이어서'라고 하시면 돼요."
