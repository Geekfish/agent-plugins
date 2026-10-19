---
name: clickbait-announce
description: Use when the user wants a Slack announcement, team update, or hype post about shipped work written like a YouTube clickbait title and thumbnail, with heavy emoji. Triggers include "clickbait announcement", "YouTube-style announcement", "hype up my work on X", "announce X like a YouTuber".
---

# Clickbait Announce

Turn real shipped work into a Slack post shaped like a YouTube title plus thumbnail. Loud outside, true inside.

Read [the shared rules](../../references/announce-rules.md) first. They hold fact collection, emoji harvest, bullet shape, the `--calm` flag, safe-for-work rules and the final check. This file adds only the clickbait style.

## 1. Collect facts

As in the shared rules.

## 2. Harvest workspace emoji

As in the shared rules. Mood terms for the second search: `party,hype,mind,fire,eyes,ship`.

## 3. Compose

Budget: 120 to 180 words, excluding links and code. Fixed shape, this order:

1. **Title**, one line. One hook device from the table. 1 to 3 words in ALL CAPS. 2 to 4 Unicode emoji. Ends with one tag from the tag table.
2. **Thumbnail**, one line. 3 to 6 words in caps, opened by one thumbnail pointer: `🔴➡️`, `👉`, `🫵`, `⭕👀`, `⬇️😱`. Vary it across posts. Not `🚩`, that reads as a warning.
3. **Body**, bullets as in the shared shape. Bullet titles use clickbait phrasing.
4. **CTA**, creator sign-off ("SMASH that :eyes:", "link in bio 👇"), then the links.

| Hook device | Shape |
|---|---|
| Curiosity gap | "...and what happened next" |
| Number bait | "5 COMMANDS that..." |
| Before/after | "Day 1 vs Day 30" |
| Forbidden knowledge | "the ONE flag they don't want you to know" |
| Reaction | "I tried X for a week" |
| Versus | "X vs Y (who wins?)" |

| Tag signal | Tags |
|---|---|
| Truth claim | `(NOT CLICKBAIT)`, `(100% REAL)`, `(PROOF)`, `(NO CAP)` |
| Outcome | `(GONE WRONG)`, `(GONE RIGHT)`, `(IT ACTUALLY WORKED)`, `(SHOCKING RESULTS)`, `(IT'S NOT WHAT YOU THINK)` |
| Tone | `(EMOTIONAL)`, `(MUST WATCH)`, `(WHOLESOME)` |
| Time pressure | `(24 HOUR CHALLENGE)`, `(FINALLY)`, `(LAST CHANCE)` |
| Dev twist | `(NO REWRITE)`, `(ZERO DOWNTIME)`, `(IN PROD)`, `(FIRST TRY)` |

`--calm`: ALL CAPS only in the title.

## 4. Check before replying

As in the shared rules.

## Example

```
🚨🦀 I REWROTE MY DOTFILES AND MY LAPTOP WILL NEVER BE THE SAME 😱 (NOT CLICKBAIT)

🔴➡️ ONE COMMAND. EVERY MACHINE. 👀

• :rocket: *NO MORE SYMLINK SPAGHETTI* :exploding_head:
`chezmoi apply` writes real files instead of 20 hand-made links.

• :lock: *THE SECRET THAT NEVER LEAVES YOUR LAPTOP* :eyes:
Emails and signing keys are asked once per machine and never committed.

• :fire: *THE INSTALL SCRIPT IS DEAD* :100:
A new machine runs one `chezmoi init`. Migration guide in the README.

SMASH that :eyes: and drop bugs in the thread 🧵👇
https://github.com/example/dotfiles
```

## Common mistakes

- **Changelog in disguise.** Ten bullets, 400 words. The budget exists for this.
- **Guessed shortcodes.** `:partyparrot:` may not exist in this workspace. Search first.
- **Hype without a hook.** "Big update!" is not a title. Pick a device from the table.
