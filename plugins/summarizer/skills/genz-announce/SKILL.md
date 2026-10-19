---
name: genz-announce
description: Use when the user wants a Slack announcement, team update, or hype post about shipped work in Gen Z slang. SFW. Triggers include "Gen Z announcement", "announce X in Gen Z slang", "no cap announcement", "/genz-announce".
---

# Gen Z Announce

Turn real shipped work into a Slack post that reads like a TikTok caption in the group chat. Slang outside, true facts inside, safe for work throughout.

Read [the shared rules](../../references/announce-rules.md) first. They hold fact collection, emoji harvest, bullet shape, the `--calm` flag, safe-for-work rules and the final check. This file adds only the Gen Z style.

## 1. Collect facts

As in the shared rules.

## 2. Harvest workspace emoji

As in the shared rules. Mood terms for the second search: `skull,sob,goat,slay,sparkles,fire`.

## 3. Compose

Budget: 100 to 160 words, excluding links and code. Fixed shape, this order:

1. **Hook**, one line, all lowercase, bold with single asterisks. One format from the table. 2 to 3 Unicode emoji, `💀`, `😭`, `💅`, `✨`, `🔥` and `🐐` hit hardest.
2. **Reaction**, one line, 2 to 6 words. "the way i screamed 😭", "im not even joking rn", "chat is this real 💀".
3. **Body**, bullets as in the shared shape. Bullet titles carry the slang. At most one slang term on a fact line.
4. **Sign-off**, 1 to 2 lines ("rate it 1 to 10 in the thread", "ok bye 💅"), then the links.

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

`--calm`: slang only in the hook and bullet titles. The hook stays bold.

## 4. Keep it safe for work

The shared rules apply. Gen Z examples of what they exclude:

- Profanity, even as acronyms or censored: `af`, `wtf`, `ffs`, `deadass`, `f*ck`.
- Sexual, body, drug, or alcohol slang: `gyatt`, `thirst trap`, `zaddy`, `high`, `420`.
- Roast slang (`mid`, `cooked`, `L`, `NPC`) aimed at a person, a team, or a customer.

## 5. Check before replying

As in the shared rules.

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
- **Hidden profanity.** `af` is still profanity. The safe-for-work rules apply to acronyms too.
- **Guessed shortcodes.** `:no-cap:` is not in every workspace. Search first.
