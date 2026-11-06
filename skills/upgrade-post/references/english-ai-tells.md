# English that reads as AI-written

The same idea as [korean-ai-tells.md](korean-ai-tells.md), for a post written in
English. Readers spot these within a paragraph, and once they do they stop trusting the
rest - including the parts the writer wrote.

When polishing, every sentence is the writer's, and rewriting these phrases in it is
the job. Use this list at the level the user asked for (SKILL.md, "How far to go"):
for "proofread this" or "just check the spelling" fix spelling, typos, punctuation and
plain grammar slips only; for "polish this" and above, including the upgrade, rewrite
these phrases - keeping the writer's meaning, facts and voice (their register, their
plain words), and adding nothing they didn't say. Sentences you add in an upgrade stay
clear of them too.

The writing memo (`tilnote-style`) wins over this list: a phrase it lists as the
writer's own is never changed. A phrase merely appearing in the pasted text is not
evidence that the writer chose it - an AI draft they pasted has these too.

## Openings and closings

- "In this post, we'll explore...", "Let's dive in", "In today's fast-paced world",
  "Have you ever wondered...?" → open with the question or the problem itself.
- "In conclusion", "To sum up", "Overall", "Ultimately", "I hope this helps!",
  "Happy coding!" → end on the writer's view or the next step, not a recap.
- A summary sentence at the end of every paragraph.

## Stock phrasing

- "It's important to note that", "It's worth mentioning that", "When it comes to" as
  filler before the actual point.
- "Not just X, but Y", "It's not about X - it's about Y" used again and again.
- "Whether you're a beginner or a seasoned pro" and other audiences nobody named.
- Long noun stacks where a verb would do: "the implementation of error handling" →
  "handling errors".

## Empty words

- "delve", "leverage", "unlock", "harness", "elevate", "streamline", "empower"
- "robust", "seamless", "cutting-edge", "powerful", "game-changer", "crucial role"
- "landscape", "realm", "journey", "tapestry", "testament to"
- Hedges with nothing behind them: "may potentially", "it could be argued that" (when
  it isn't the writer's actual uncertainty).

## Shape

- Everything in bullets; prose turned into lists of noun phrases.
- An emoji on every heading; bold on every other phrase; Title Case On Every Heading.
- Three-item lists everywhere ("fast, simple, and powerful").
- A dash in every other sentence to bolt on an afterthought.
- Every sentence the same length and rhythm.

## Before and after

Each "after" keeps the facts that were already there and adds none. When a sentence
is empty - "a wide range of benefits" with nothing behind it - the fix is to cut it or
to ask the writer what they meant, not to fill it with content of your own. Match the
writer's register: contractions or none, "I" or "we", as the surrounding text does.

1. **Opening**
   - Before: In this post, we'll explore how to fix environment variable issues in Next.js.
   - After: My Next.js app, deployed with Docker, kept reading NEXT_PUBLIC_API_URL as undefined.

2. **Closing recap**
   - Before: In conclusion, local LLMs offer a wide range of benefits in terms of privacy and cost.
   - After: For meeting notes, my laptop was enough. For long drafts it's still too slow.
   - (The "after" is the writer's own view from earlier in the post, moved to the end.
     If they gave none, end on the last real point and cut the recap.)

3. **Filler before the point**
   - Before: When it comes to fetching data from an API, it's important to note that error handling plays a crucial role.
   - After: When you fetch data from an API, handle the errors first.

4. **Noun stacks**
   - Before: The modification of the config file was completed, followed by a redeployment.
   - After: I fixed the config file and deployed again.

5. **Empty praise**
   - Before: A powerful, cutting-edge tool that seamlessly streamlines your workflow.
   - After (the writer said "meeting notes went from 30 minutes to 5"): Meeting notes went from 30 minutes to 5.
   - After (the writer gave no number): cut the sentence, or ask "If you timed it, I'll put the number in."

6. **Hedge with nothing behind it**
   - Before: This could arguably be considered a potentially better option.
   - After: This way is better.
   - After (the writer really isn't sure): I've only tried it once, so I can't say it's always better yet.

7. **Bullets standing in for sentences**
   - Before:
     - Fast installation
     - Easy to use
     - Supports various models
   - After: It installed with one command. Switching models is just a different name in the pull command.

8. **Emoji headings and bold everywhere**
   - Before: `## 🚀 Getting Started` / The **really important** thing here is **configuration**!
   - After: `## Install it` / What matters is the config.

## What to do instead

Keep the register and level of detail of the surrounding text: casual or formal,
contractions or none, "I" or "we", their plain words, their jokes if they made any.
A sentence the writer actually wrote, lightly cleaned, beats a polished sentence they
never would have written.
