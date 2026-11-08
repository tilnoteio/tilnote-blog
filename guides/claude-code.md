# Claude Code에서 틸노트 블로그 연결하기

Claude Code(터미널)에 Tilnote Blog 플러그인을 넣고 내 틸노트 계정과 연결하는 방법입니다. 처음 한 번만
하면 되고, 5분쯤 걸립니다. 그 뒤로는 Claude Code에서 "로컬 LLM에 대해 블로그 글 써 보고 싶어"처럼
말하기만 하면 됩니다.

준비할 것

- 로그인까지 마친 Claude Code. 터미널에서 `claude` 를 치면 대화가 열려야 합니다.
- 틸노트 계정. 같은 컴퓨터의 기본 브라우저에서 [tilnote.io](https://tilnote.io)에 미리 로그인해 두면
  연결이 더 빠릅니다.

순서는 세 단계입니다. **① 플러그인 설치 → ② 틸노트 연결 → ③ 확인**

---

## ① 플러그인 설치

### 1. 마켓플레이스 추가와 설치

Claude Code 대화창에서 아래 두 줄을 차례로 입력합니다.

```text
/plugin marketplace add tilnoteio/tilnote-blog
/plugin install tilnote-blog@tilnote-blog
```

대화를 열지 않고 터미널에서 바로 해도 똑같습니다.

```text
claude plugin marketplace add tilnoteio/tilnote-blog
claude plugin install tilnote-blog@tilnote-blog
```

이렇게 나오면 설치된 것입니다.

```text
✔ Successfully added marketplace: tilnote-blog (declared in user settings)
✔ Successfully installed plugin: tilnote-blog@tilnote-blog (scope: user)
```

### 2. Claude Code 다시 시작

열려 있던 Claude Code를 닫고(`/exit`) `claude` 로 다시 엽니다. 새로 연 대화부터 플러그인의 스킬
8개와 틸노트 연결이 들어옵니다.

설치됐는지는 터미널에서 이렇게 봅니다.

```text
claude plugin list
```

```text
  ❯ tilnote-blog@tilnote-blog
    Version: 0.5.6
    Scope: user
    Status: ✔ enabled
```

버전 숫자는 그때그때 다릅니다. **enabled** 이면 됩니다.

---

## ② 틸노트 연결

플러그인은 설치됐지만, 아직 내 틸노트 계정에 들어갈 수 없습니다. 로그인은 사람마다 따로 해야 해서
설치할 때 저절로 되지 않습니다. 처음 한 번만 하면 됩니다.

지금 상태는 터미널에서 `claude mcp list` 로 볼 수 있습니다. 아직 연결 전이면 이렇게 나옵니다.

```text
plugin:tilnote-blog:tilnote: https://tilnote.io/mcp (HTTP) - ! Needs authentication
```

### 3. /mcp 에서 Authenticate

Claude Code 대화창에서 `/mcp` 를 입력합니다. 목록에서 **plugin:tilnote-blog:tilnote** 를 방향키로
고르고 Enter, 이어서 **Authenticate** 를 고릅니다. 기본 브라우저에 틸노트 화면이 열립니다.

> `claude mcp add` 로 주소(`https://tilnote.io/mcp`)를 직접 넣어 새로 만들지는 마세요. 연결이 두 개가
> 되어 틸노트 도구가 두 벌로 보입니다. 플러그인에 이미 들어 있습니다.

### 4. 틸노트에서 허용

틸노트에 로그인돼 있지 않으면 로그인 화면이 먼저 나옵니다. 로그인하면 동의 화면이 나옵니다.

**연결 계정**이 내가 쓰려는 틸노트 계정인지 확인하고 **허용**을 누릅니다. 동의 화면은
[Claude 웹 가이드의 5번](claude-web.md#5-틸노트에서-허용)과 같은 모양입니다.

- 틸노트 비밀번호는 Claude에 넘어가지 않습니다.
- 글은 비공개 노트로 저장되고, 내가 "올려줘"라고 할 때만 블로그에 공개됩니다.

브라우저에 완료 안내가 뜨면 터미널로 돌아옵니다. `/mcp` 목록에서 틸노트가 연결됨(connected)으로
바뀌어 있으면 끝입니다. `claude mcp list` 로 보면 `Needs authentication` 대신 `Connected` 가 나옵니다.

---

## ③ 확인: 첫 대화

Claude Code 대화창에서 이렇게 말해 봅니다.

```text
틸노트 블로그 처음인데 뭐부터 해?
```

`/tilnote-blog:start` 를 입력해도 같습니다.

내 계정 상태(올린 글 수, 문체 메모·뉴스 토픽이 있는지, 책)를 읽고, 할 수 있는 일과 첫 걸음 하나를
권하면 연결이 끝난 것입니다. 이 질문에는 아무것도 저장하지 않습니다.

"틸노트가 아직 연결 안 돼 있어"라고 답하면 ②로 돌아가 `/mcp` 에서 틸노트가 연결됐는지 확인하세요.

---

## 업데이트

이 마켓플레이스의 플러그인은 저절로 업데이트되지 않습니다. 터미널에서 아래 두 줄을 실행하고 Claude
Code를 다시 시작합니다.

```text
claude plugin marketplace update tilnote-blog
claude plugin update tilnote-blog@tilnote-blog
```

`/plugin` 에서 `tilnote-blog` 마켓플레이스의 자동 업데이트를 켜 두어도 됩니다.

## 막힐 때

| 이럴 때 | 이렇게 |
|---|---|
| "틸노트가 연결 안 돼 있다"고 답해요 | `/mcp` 에서 **plugin:tilnote-blog:tilnote** 가 연결됐는지 봅니다. 아니면 3번부터 다시 합니다 |
| 스킬이 안 불려요 (`/tilnote-blog:start` 가 없다고 해요) | 설치 뒤 Claude Code를 다시 시작했는지 봅니다. `claude plugin list` 에서 **enabled** 가 아니면 `claude plugin enable tilnote-blog@tilnote-blog` |
| 브라우저가 안 열려요 | `/mcp` 화면에 나온 주소를 복사해 브라우저에 붙여 넣습니다 |
| 틸노트 도구가 두 벌로 보여요 | 예전에 `claude mcp add` 로 직접 만든 틸노트 연결이 있는 경우입니다. `claude mcp list` 에서 이름을 보고 `claude mcp remove <이름>` 으로 지웁니다(플러그인 쪽 `plugin:tilnote-blog:tilnote` 는 남깁니다) |
| 다른 틸노트 계정으로 연결됐어요 | `/mcp` → 틸노트 → 인증 지우기(Clear authentication) → tilnote.io에서 로그아웃하고 원하는 계정으로 로그인 → 3번부터 다시 합니다 |
| 플러그인을 빼고 싶어요 | `claude plugin uninstall tilnote-blog@tilnote-blog` |

## 다음에 해 볼 말

| 하고 싶은 것 | 이렇게 말하기 |
|---|---|
| 블로그 글 쓰기 | "로컬 LLM에 대해 블로그 글 써 보고 싶어" |
| 다음 글 고르기 | "내 블로그 글 반응 어때? 다음에 뭐 쓰지?" |
| SNS용으로 바꾸기 | "내 최근 공개 글 스레드랑 X용으로 바꿔줘" |
| 관심 분야 소식 받기 | "관심 토픽 등록해줘" → "틸노트 뉴스 리더 돌려줘" |
| 내 말투 남기기 | "내 문체 기억해줘" |
| 책 만들기 | "Git 책 만들어줘" |
| 내 컴퓨터 사진 넣기 | "이 글에 ~/Pictures/screenshot.png 넣어줘" |

초안은 모두 비공개 노트로 저장되고, "올려줘"라고 할 때만 블로그에 공개됩니다. Claude Code는 내
컴퓨터의 사진 파일을 바로 가리킬 수 있어서, 올리기 링크를 열지 않아도 그 파일만 틸노트에 올립니다.
