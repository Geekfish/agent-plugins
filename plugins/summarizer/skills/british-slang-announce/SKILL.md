---
name: british-slang-announce
description: Use when the user wants a Slack announcement, team update, or hype post about shipped work in British slang. Slang examples: innit, bruv, bare, allow it. Output stays safe for work. Triggers include "British slang announcement", "announce X in British slang", "innit bruv announcement", "/british-slang-announce". For Gen Z slang, use genz-announce. For meme brainrot, use brainrot-announce. For YouTube clickbait style, use clickbait-announce.
---

# British Slang Announce

Turn real shipped work into a Slack post that reads like UK youth slang in the group chat. Slang outside, true facts inside, safe for work throughout. The style is current slang, mostly from London youth speech, not old British idioms.

Read [the shared rules](../../references/announce-rules.md) first. They hold fact collection, emoji harvest, bullet shape, the `--calm` flag, safe-for-work rules and the final check. This file adds only the British slang style.

## 1. Collect facts

As in the shared rules.

## 2. Harvest workspace emoji

As in the shared rules. Mood terms for the second search: `teapot,tea_cup,cuppa,biscuit,cheers,crown`.

## 3. Compose

Budget: 100 to 160 words, excluding links and code. Fixed shape, this order:

1. **Hook**, one line, all lowercase, bold with single asterisks. One format from the table. 2 to 3 Unicode emoji: `☕`, `🫖`, `🇬🇧`, `💂`, `🌧️`, `🍪`, `🚌`.
2. **Reaction**, one line, 2 to 6 words. "bare gassed, innit 🫖", "absolute scenes 😤", "swear down".
3. **Body**, bullets as in the shared shape. Bullet titles carry the slang. At most one slang term on a fact line.
4. **Sign-off**, 1 to 2 lines ("safe bruv, bugs in the thread", "kettle's on ☕"), then the links.

| Hook format | Shape |
|---|---|
| Innit | "the build takes 30 seconds now, innit" |
| Allow it | "allow it, the yaml is gone" |
| Gassed | "bare gassed about the new deploy" |
| Shook | "proper shook: ci passed first try" |
| Absolute scenes | "absolute scenes: the old build script got rinsed" |
| Calm | "the new deploy is calm, you get me". Understatement: "calm" means fine. |

| Slang signal | Terms |
|---|---|
| Praise | safe, calm, peng (things only), lush, jokes (funny), buzzing, on job (focused) |
| Intensifier | bare, proper, well, blates |
| Truth | innit, swear down, you get me |
| Old thing | peak (bad luck), long (tedious), bait (obvious), buki (strange), wasteman (code only) |
| Reaction | gassed, shook, vexed, absolute scenes, rinsed, allow it (stop it) |
| Address | bruv, fam |
| Classics | sorted, proper chuffed, Bob's your uncle, a faff. At most one per post, for a dad-joke tone. Lowercase in the hook. |

Use one or two slang terms per line. "innit bruv" on every line reads as parody.

`--calm`: slang only in the hook and bullet titles. The hook stays bold.

## 4. Keep it safe for work

The shared rules apply. British slang examples of what they exclude:

- Profanity, even mild or censored: `bloody`, `bollocks`, `sod`, `bugger`, `arse`, `taking the p*ss`.
- Sexual, body or looks slang: `leng`, `ting`, `fit`, `butters`, `chopped`, `clapped`, `mogged`, `shag`, `bellend`. `peng` only about things.
- Drink or drug slang: `pint`, `on the lash`, `trollied`, `get waved`, `bevvy`. Tea is fine.
- Crime and street slang: `cheffed`, `ops`, `feds`, `jakes`, `on road`.
- Slang that mocks a group or a dialect: `chav`, borrowed Patois greetings such as `wagwan`, phonetic accent spelling such as `fink` or `wiv`.
- Insults (`wasteman`, `muppet`, `numpty`, `neek`) aimed at a person, a team, or a customer.

## 5. Check before replying

As in the shared rules.

## Example

```
*allow it, the symlinks are gone* ☕🇬🇧🦀

bare gassed, innit 🫖

• :rocket: *symlink spaghetti got rinsed* :tea:
`chezmoi apply` writes real files instead of 20 hand-made links.

• :lock: *secrets stay home, swear down* :eyes:
Emails and signing keys are asked once per machine and never committed.

• :fire: *new machine setup is blates peng* :100:
A new machine runs one `chezmoi init`. Migration guide in the README.

safe bruv, bugs in the thread 🧵 kettle's on ☕
https://github.com/example/dotfiles
```

## Common mistakes

- **Slang in the fact line.** "the cache is peng" says nothing. The fact stays plain.
- **Dad slang.** "sorted, Bob's your uncle, cracking" is old British idiom, not current slang. Use the classics row once at most.
- **Peak as praise.** In British slang `peak` means bad luck, the opposite of Gen Z `peak`. Use it only for the old thing.
- **Accent cosplay.** Spelling words like an accent mocks a dialect. Write slang terms, not phonetics.
- **Guessed shortcodes.** `:tea:` is standard Unicode, `:cuppa:` is not. Search first.
