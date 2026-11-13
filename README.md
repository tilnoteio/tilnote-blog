# Tilnote Blog

Write blog posts together with AI and publish them to your [Tilnote](https://tilnote.io)
blog - then grow them in conversation, share them, and find the next one.

Give the AI a topic and it looks it up and writes the post, without asking you
anything first (for a post about your own view or a story you lived, it first asks up
to three short questions), and tells you in a few lines what the topic is. Then keep talking: add
points or tell it what you tried and what you think, and it goes into the post; ask
what you wonder, and it answers (and adds the answer if you want it in). Want to understand the topic first? Ask, and it explains before writing. Every post is saved as a private note first and goes public
only when you say so.

Everything stays in your Tilnote account - idea notes, drafts, posts, share texts you choose to keep, your
writing memo, your news topics and past briefings, your books - so you can pick up in any AI app
where you use this plugin, right where you stopped.

한국어 안내: [README.ko.md](https://github.com/tilnoteio/tilnote-blog/blob/main/README.ko.md)

## Skills

| Skill | What it does | Try saying |
|---|---|---|
| `start` | Shows you around: checks the Tilnote connection and where your account stands, lists what you can ask for with a sentence to say for each, and suggests one first step. Saves nothing | "Where do I start?", "What can you do?", "How do I use this?" |
| `write-post` | Look it up → write the draft and explain the topic in a few lines (a full explanation first if you ask) → publish on your OK. Checks your blog for an earlier post on the topic first, follows a shape that fits the kind of post, cites sources as footnotes, and makes it easy to find in search. Draws a cover image when it publishes. Your own photos and screenshots come in through an upload link and go where they fit | "I'd like to write a blog post about local LLMs", "Turn this conversation into a post", "Continue my idea from yesterday", "Let's write about news item 2", "I want to add a screenshot to this post" |
| `upgrade-post` | Makes a post you already have better and keeps it yours. Light: spelling, or polishing in your own voice. Full: a conversation that keeps growing the one post ([how it works](#upgrades-in-plain-words)). Also adds your own photos, takes a post down or restores an earlier version | "Upgrade this post", "Polish this post", "Add this article to my post", "What does this part mean?", "Take that post down", "Go back to the earlier version" |
| `share-post` | Turns a published post into versions for Threads, X, LinkedIn, Facebook, Bluesky, KakaoTalk, Band, Naver Blog and Instagram, with a link that opens the network's post window already filled in where the network allows it (Threads, X, Bluesky, Band) and ready-to-paste text for the rest. Can draw a card image | "Turn this post into a Threads post", "Write a LinkedIn post for it", "Make Instagram cards from this post" |
| `news-reader` | Keeps the topics you follow in one private note, `My news topics`. When you run it, the AI researches recent news on them and gives you a short briefing - source, date, why it matters, a post idea per item - saved as a private `[News]` note | "Set up my news topics", "Run my Tilnote news reader", "Add a topic on AI agents", "Save 3 as an idea" |
| `make-book` | Makes a book you want to read. Researches how the subject is usually taught, what changed lately and where people get stuck, checks your notes, and drafts a table of contents for your level. On your OK it makes a private Tilnote book and a table of contents note with every chapter's plan; a chapter is written when you pick it from the contents or ask to see it | "Make me a book on Kubernetes", "I want to learn Git from a book", "Show me my books", "Show me chapter 3", "Next chapter" |
| `next-post` | Shows how your posts are doing and suggests 2-3 next posts with a reason each, plus posts whose facts may be out of date | "How is my blog doing?", "What should I write next?", "Any posts I should fix?" |
| `writing-style` | Keeps your tone, favourite phrases and words you never use in one private note, `My writing style`, that the writing skills (write-post, upgrade-post, share-post) read before they write. If you write differently for different kinds of posts (a newsletter and a how-to post), it keeps a mode for each, and every post uses the one that fits | "Remember my writing style", "From now on, keep it casual", "Never use 'delve' in my posts", "Learn my newsletter voice separately" |

## Upgrades, in plain words

An upgrade doesn't finish a post once - it keeps growing the same post in
conversation. What you learn, what readers would ask and what you've tried since end up
in the post instead of scattered across chats.

```text
understand → [ talk ⇄ add ] → tidy
```

1. **Understand**: say "Upgrade this post" and the AI reads it, looks things up and
   tells you, in about a phone screen, what changed since it went up (checked against
   the sources, with dates), what readers would ask that the post doesn't cover, and
   the one question only you can answer ("Do you still use the free plan?"). It says
   how it would add them and asks for the go-ahead. If the post still holds up, it
   says so.
2. **Talk and add**: then it's a conversation. Ask about the post ("What does this
   part mean?") and it answers - and, once, offers to add the answer if readers would
   want it too. Hand it an article, release notes or one of your notes ("Add this to
   my post") and it sets it against the post: what's new goes in, what contradicts it
   is corrected. Tell it what you tried or what you think, and it goes in, in your
   words, at the place it's about. What you give goes in as you give it, so nothing is
   lost if the chat ends there.
3. **Tidy**: it reads the grown post again, folds repeats together, moves what landed
   at the end to where it belongs, takes care of the summary, footnotes, links to your
   related posts and a cover, then shows how the post grew (one fact brought up to
   date, your words added in one place, sources 0 → 3).

When news comes out or you try something new, go round again with the same post. It
is always the same note - never a copy.

- **Who decides:** what you ask to put in goes straight in, even on a live post. What
  the AI finds on its own is offered first (on a private draft it goes in, and you
  take out what you don't want). Rewording your own sentences on a live post is shown
  first.
- **Undo:** Tilnote keeps earlier versions for 30 days, so "Go back to the earlier
  version" works.
- **Your voice, your experience:** what it adds is written in your voice (your writing
  memo). It never makes up a result, an experience or a view you didn't give.
- **One post at a time:** "Upgrade all my old posts" still goes one by one, starting
  with the most-read - rewriting a whole blog at once is what spam checks watch for.

## The news reader, in plain words

Tell the AI what you want to follow ("AI agents and local LLMs"). It turns that into a
few topics with concrete keywords, shows you the note it would save, and saves it in
your Tilnote as a private note, `My news topics`, once you say yes. You can edit that
note in Tilnote any time, or just say what changed ("drop Cursor", "pause AI agents").

When you say "Run my Tilnote news reader", the AI app you are talking to searches the web for news on
those topics since the last run, opens the sources it cites (a page with no publish
date doesn't count as news), and skips stories its briefings from the past week
already covered. You get a short briefing: per item a title, a link,
the source and date, what happened, why it matters for you, and a question it could
become a post about. The briefing is saved as a private note,
`[News] 2026-10-31 briefing` - when there is no new story at all, it says so in one
line and saves no note - and "save 3 as an idea" keeps an item as an idea note for later.
Dates follow the time zone in your topics note.

It needs an AI app that can search the web and open the pages it finds; without that
it says so instead of making news up. Tilnote runs nothing by itself. If your AI app
can run a task on a schedule, schedule the sentence "Run my Tilnote news reader. Save
new stories as a [News] note and record the run time" (say, weekdays at 8 a.m.) - or
ask "run it every weekday at 8am" and the AI sets it up with that sentence where the
app lets it - and new stories pile up in Tilnote as `[News]` notes. The sentence names
the save because some apps let an unattended run write only what its prompt asks for. The plugin and the Tilnote connection must be there in the
app that runs the schedule.

## Books, in plain words

Name a subject you want to read a book about ("Make me a book on Kubernetes"). The AI checks
your notes for what you already know, then researches how the subject is usually
taught and ordered - official guides, course syllabi, well-known books' tables of
contents - what changed recently, and where learners get stuck. It drafts a table of
contents in its own words for your level and goal, with the sources it used. Nothing
is saved yet.

When you say yes, it makes a private book in your Tilnote whose first page is the
table of contents note, holding each chapter's plan and status. No empty pages.
Say "Show me chapter 3" and the AI writes chapter 3 from its plan - looking up what changes,
like versions and commands - and puts it in the book at its place, after the table of
contents. Skip ahead to chapter 5 and it goes in right away; chapters 3 and 4 slot in
before it when they are written. Read it on the book's page in Tilnote, and
ask the AI about anything that's unclear. When you publish the book on the web, the
table of contents note stays private unless you tick it.

## Sharing, in plain words

After a post is published, the AI writes a version for each network you want - a
3-5 post thread for Threads, a two-line post for X, a longer note for LinkedIn, a
short Bluesky post (or a KakaoTalk message, for Korean readers) - using only what the post says, in your voice.
Tilnote checks each one against the network's length limit and gives you a link that
opens the network's post window with the text already in it (or a "copy and paste"
note where a network has no such window). **You press post.** The plugin never posts
anything to a social network for you. Each link carries a small tag
(`utm_source=threads` and so on) so you can tell where readers came from.

## Install

You need a Tilnote account - a free one works, and you can create it when you sign in -
and an AI app that takes plugins: Claude Code, Claude on the web or desktop, or the ChatGPT
desktop app (ChatGPT or Codex).
Publishing follows Tilnote's rules - a daily post limit, a minimum length and a spam
check - and the AI tells you when one applies.

**Claude Code**

```
/plugin marketplace add tilnoteio/tilnote-blog
/plugin install tilnote-blog@tilnote-blog
```

Then restart Claude Code, run `/mcp` and sign in to Tilnote. Step by step (in Korean):
[guides/claude-code.md](https://github.com/tilnoteio/tilnote-blog/blob/main/guides/claude-code.md).

**Claude (web and desktop, paid plans)**: Customize → Plugins → Add → Add marketplace →
`tilnoteio/tilnote-blog`. After adding the plugin, open its **Connectors** tab and
sign in to Tilnote. A step-by-step guide with screenshots (in Korean):
[guides/claude-web.md](https://github.com/tilnoteio/tilnote-blog/blob/main/guides/claude-web.md).

**ChatGPT (desktop app)**: upload the plugin ZIP at
[chatgpt.com/plugins](https://chatgpt.com/plugins) → Add → Upload plugin ZIP, then in the
desktop app (ChatGPT or Codex) open Plugins → Personal → Tilnote Blog, install it and connect Tilnote.
The skills don't run in chats on the web. Where to get the ZIP, with screenshots (in Korean):
[guides/chatgpt.md](https://github.com/tilnoteio/tilnote-blog/blob/main/guides/chatgpt.md).

If you already added Tilnote as a custom connector, keep only one of the two enabled -
otherwise you get two copies of the Tilnote tools.

**Updating (Claude Code):** plugins from this marketplace don't update on their own.
Run `claude plugin marketplace update tilnote-blog`, then
`claude plugin update tilnote-blog@tilnote-blog`, and restart Claude Code - or turn on
auto-update for the `tilnote-blog` marketplace in `/plugin`.

## Your first ten minutes

Once installed and signed in, say:

> Where do I start?

The AI checks the Tilnote connection, looks at where your account stands (posts, writing
memo, news topics, books), shows on one screen what you can ask for with a sentence to
say for each, and suggests one first step. It saves nothing. In Claude Code you can also
type `/tilnote-blog:start`.

To look around on your own, this order works well:

1. **"What should I write next?"**: looks at how your posts are doing and at your private and idea
   notes, and suggests 2-3 next posts with a reason each. With no posts yet, start
   straight away with "I'd like to write a blog post about something I tried this week".
2. **"Let's write number 1"**: the AI looks the topic up and saves a draft as a private note.
   Tell it your experience and view and they go into the post; ask about it and it
   answers. Say
   "publish it" to publish.
3. **"Turn it into a Threads post"**: turns the published post into social posts, with share links
   (filled in where the network allows it). You post them yourself.

If you already have posts, try "Upgrade this post" on one of them. If you want a
particular tone, keep it in the writing memo: state it ("From now on,
keep it casual"), or, if you have posts you wrote yourself, say "Remember my writing
style" to learn it from them. Try the news reader ("Set up my news topics") and books
("Make me a book on <topic>") on their own.

Everything works in Korean too - the Korean guide is
[README.ko.md](https://github.com/tilnoteio/tilnote-blog/blob/main/README.ko.md).

## What it connects to

The plugin bundles one remote connection, `https://tilnote.io/mcp`, which you sign in
to with your Tilnote account. Through it the skills read and write your own notes,
publish posts you confirm, read your post statistics, and prepare share links.

One more address, for your own pictures: when you want a photo or screenshot in a post,
the AI makes a one-hour upload link on tilnote.io (`https://tilnote.io/en/upload#...`) that opens without
signing in, so don't pass it on. In Claude Code, or another app that can run shell
commands, you can instead point the AI at picture files on your computer: it uploads
just those files with `curl` to `https://server.tilnote.io/api/image-upload-links/images`,
using that link's one-hour token. The plugin itself sends nothing else: web searches
are your AI app's own (see Privacy), and what Tilnote does with what it receives -
including the spam check new accounts' posts go through - is in Tilnote's privacy
policy.

## Privacy

- **Your notes:** the skills read and write only your own Tilnote notes. Drafts, idea
  notes and your writing memo are private notes; a post becomes public only after you
  confirm. You can open, edit or delete any of them in Tilnote.
- **Tags on its own notes:** the notes the plugin keeps for itself - your writing
  memo, news topics and briefings, idea notes, saved share texts - carry a tag starting
  `tilnote-` (`tilnote-style`, `tilnote-news` and so on) so the AI can find them again.
  If you remove that tag, the AI may miss the note.
- **Private notes in a post:** a blog post draws on your published posts and idea
  notes. Another private note goes into a post only when you point at it; if one is on
  the topic, the draft names it and leaves it out until you say "add that note too".
- **News reader:** your topics are a private note in your Tilnote account. The news
  is found by your AI app's own web search when you run it, and briefings are saved as
  private notes. Tilnote sends no email for it.
- **Books:** the book, its table of contents note and its chapters are private in
  your Tilnote account. Making a book public is something you do yourself on the web.
- **Sharing:** share texts are written in the chat and kept only if you ask to save
  them as a private note. Nothing is posted to any social network by the plugin.
- **Pictures:** covers, cards and diagrams the AI draws, photos you upload, and
  pictures it copies into a post from a page it cites (a company's own screenshot, with
  the source named) are stored on Tilnote's image hosting. Each has a long, unguessable
  address that opens without signing in, even while the post is a private draft.
- **AI label:** posts and book chapters the AI drafted carry Tilnote's AI-assisted label
  when published. An upgrade where the AI writes sentences of its own into a post you
  wrote (an answer, what a source adds) adds it too; spelling and wording fixes don't. Once set, the label stays.
- **Before publishing:** the AI reads the whole post once more. If it finds something
  that shouldn't be public - a password, key or token, an email address or phone
  number, an ID or card number, an internal address, or private details about another
  person or a client - it stops, tells you where and what kind (never the value), and
  offers a fix. You decide; it is your post.
- **Deleting:** the AI deletes a note only when you ask for exactly that and confirm.
  A deleted note goes to Tilnote's trash, and you can restore it from
  tilnote.io/home/trash for 30 days. Taking a post down keeps the note.
- **Web search:** when your AI app can search the web, the skills use it to look
  topics up, check facts and gather news for your topics. Search gets only search
  words, such as your topics' keywords - not your notes.

- Privacy policy: https://tilnote.io/en/privacy
- Terms: https://tilnote.io/en/terms

## Help

- The Tilnote tools don't show up: in Claude Code, run `/mcp` and sign in to Tilnote; in
  Claude on the web or desktop, open the plugin's **Connectors** tab and connect Tilnote.
- Two sets of Tilnote tools: keep only one (see Install).
- Anything else, or a security concern: open an issue at
  https://github.com/tilnoteio/tilnote-blog/issues or email tilnote@tilnote.io.

## License

MIT
