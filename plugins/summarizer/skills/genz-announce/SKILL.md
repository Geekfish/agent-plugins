---
name: genz-announce
description: Use when the user wants a Slack announcement, team update, or hype post about shipped work in Gen Z slang. Output stays safe for work. Triggers include "Gen Z announcement", "announce X in Gen Z slang", "no cap announcement", "/genz-announce". For YouTube clickbait style, use clickbait-announce.
---

# Gen Z Announce

Turn real shipped work into a Slack post that reads like a TikTok caption in the group chat. Slang outside, true facts inside, safe for work throughout. Output is text in the reply for the user to paste. Never posts to Slack.

## 1. Collect facts

Resolve the subject named in the request:

- Repo paths: `git log --oneline --since="3 weeks ago" --author="$(git config user.name)"` plus the README intro.
- Ticket IDs (Linear, GitHub) or MR URLs: title and description.
- Free text: use as given.

Write down 3 to 5 facts. Each traces to a commit, a doc line, or a user statement. Unmerged pushed work carries a "landing soon" tag. Uncommitted changes are not facts. Nothing else appears as a claim. When a joke is unmistakable as a joke, it is fine.

## 2. Harvest workspace emoji

If a Slack MCP with custom emoji search is available, run two searches. Each search takes at most 6 comma-separated terms, so the 200-hit cap does not truncate results. First: subject words (repo names, languages, tools). Second: `skull,sob,goat,slay,sparkles,fire`. Pick 8 to 12 hits that fit the facts.

- Custom emoji: only names the search returned, written as `:name:`. Standard Unicode shortcodes such as `:skull:` are always valid and need no search.
- Custom emoji go in the body and sign-off. Unicode goes in the hook so it reads outside Slack.
- No Slack MCP: Unicode only. Say so in one line under the output.

## 3. Compose

Budget: 100 to 160 words, excluding links and code. It is a caption, not a changelog. Cut facts before cutting vibes. Fixed shape, this order:

1. **Hook**, one line, all lowercase, bold with single asterisks. One format from the table. 2 to 3 Unicode emoji, `💀`, `😭`, `💅`, `✨`, `🔥` and `🐐` hit hardest.
2. **Reaction**, one line, 2 to 6 words. "the way i screamed 😭", "im not even joking rn", "chat is this real 💀".
3. **Body**, 3 to 5 bullets. Each bullet is two lines: `• :emoji: *slang title* :emoji:` then the fact in one plain sentence on the next line. Slack bold is single asterisks. The fact carries one concrete detail: a command, a file, a number. At most one inline code span and one slang term per fact line, so a reader can still tell what shipped.
4. **Sign-off**, 1 to 2 lines ("rate it 1 to 10 in the thread", "ok bye 💅"), then each real link on its own line.

| Hook format | Shape |
|---|---|
| POV | "pov: your deploy takes 30 seconds now" |
| Not me | "not me deleting the whole build script" |
| Tell me without telling me | "tell me you hate yaml without telling me" |
| Era | "we are so in our zero downtime era" |
| Rating | "rating the new ci: 10/10 no notes" |
| Said | "the dotfiles said main character energy" |

| Slang signal | Terms |
|---|---|
| Praise | slay, ate, no crumbs, goated, peak, W, it's giving, understood the assignment |
| Truth | no cap, fr fr, lowkey, highkey, ngl, real |
| Old thing | mid, cooked, L, flop era, the ick, NPC behaviour |
| Vibe | aura, glow up, era, main character, delulu, rizz |

Use one or two slang terms per line. Six per line reads as parody.

Write slang terms exactly as listed. If a writing-style hook or linter, such as simple-english, flags a slang term or its contraction, keep the term and ignore the flag.

Layout: one blank line between hook, reaction, every bullet, and the sign-off. Never two bullets touching.

`--calm` flag: same shape, one emoji per line, slang only in the hook and bullet titles. The hook stays bold.

## 4. Keep it safe for work

- No profanity, even as acronyms or censored: `af`, `wtf`, `ffs`, `deadass`, `f*ck`.
- No sexual, body, drug, or alcohol slang: `gyatt`, `thirst trap`, `zaddy`, `high`, `420`.
- Roast slang (`mid`, `cooked`, `L`, `NPC`) targets code, tools, or the old process. Never a person, a team, or a customer.
- No slang that mocks a group, an age, or a dialect.

## 5. Check before replying

- Every bullet maps to a step 1 fact.
- Every custom `:name:` came from the step 2 result.
- Links point at the repos or MRs actually read.
- Every step 4 rule holds.
- No `@channel`, no `@here`, no named person as the punchline.
- Word count inside budget.

## Example

```
*not me deleting 20 symlinks and calling it self care* 💅✨🦀

the way my laptop glowed up 😭

• :rocket: *symlink spaghetti is cooked* :skull:
`chezmoi apply` writes real files instead of 20 hand-made links.

• :lock: *secrets stay home fr fr* :eyes:
Emails and signing keys are asked once per machine and never committed.

• :fire: *new machine setup ate, no crumbs* :goat:
A new machine runs one `chezmoi init`. Migration guide in the README.

rate it 1 to 10 in the thread 🧵 ok bye 💅
https://github.com/example/dotfiles
```

## Common mistakes

- **Slang in the fact line.** "the cache is bussin" says nothing. The fact stays plain.
- **Hidden profanity.** `af` is still profanity. Step 4 applies to acronyms too.
- **Guessed shortcodes.** `:no-cap:` is not in every workspace. Search first.
