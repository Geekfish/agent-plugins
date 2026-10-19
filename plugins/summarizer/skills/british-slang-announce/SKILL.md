---
name: british-slang-announce
description: Use when the user wants a Slack announcement, team update, or hype post about shipped work in British slang. Slang examples: innit, bruv, proper chuffed, sorted. Output stays safe for work. Triggers include "British slang announcement", "announce X in British slang", "innit bruv announcement", "/british-slang-announce". For Gen Z slang, use genz-announce. For meme brainrot, use brainrot-announce. For YouTube clickbait style, use clickbait-announce.
---

# British Slang Announce

Turn real shipped work into a Slack post that reads like a mate down the road telling you about it. Slang outside, true facts inside, safe for work throughout.

Read [the shared rules](../../references/announce-rules.md) first. They hold fact collection, emoji harvest, bullet shape, the `--calm` flag, safe-for-work rules and the final check. This file adds only the British slang style.

## 1. Collect facts

As in the shared rules.

## 2. Harvest workspace emoji

As in the shared rules. Mood terms for the second search: `tea,uk,rain,crown,biscuit,cheers`.

## 3. Compose

Budget: 100 to 160 words, excluding links and code. Fixed shape, this order:

1. **Hook**, one line, all lowercase, bold with single asterisks. One format from the table. 2 to 3 Unicode emoji: `☕`, `🫖`, `🇬🇧`, `💂`, `🌧️`, `🍪`, `🚌`.
2. **Reaction**, one line, 2 to 6 words. "proper buzzing, innit 🫖", "absolute scenes 😤", "no word of a lie".
3. **Body**, bullets as in the shared shape. Bullet titles carry the slang. At most one slang term on a fact line.
4. **Sign-off**, 1 to 2 lines ("cheers bruv, bugs in the thread", "kettle's on ☕"), then the links.

| Hook format | Shape |
|---|---|
| Innit | "the build takes 30 seconds now, innit" |
| Sorted | "dotfiles sorted, bob's your uncle" |
| Chuffed | "proper chuffed with the new ci, not gonna lie" |
| Absolute scenes | "absolute scenes: ci passed first try" |
| Understatement | "the new deploy is not bad, to be fair". British understatement: "not bad" means great. |
| Rinsed | "the old build script got rinsed" |

| Slang signal | Terms |
|---|---|
| Praise | chuffed, buzzing, proper, well, mint, cracking, sound, lush, top notch, smashing, banging |
| Truth | innit, to be fair, no word of a lie, swear down, not gonna lie, honestly |
| Old thing | naff, dodgy, rubbish, a faff, a shambles, knackered, long, gone pear-shaped, cream crackered |
| Done | sorted, Bob's your uncle, done and dusted, job's a good 'un, easy peasy, absolute scenes, rinsed |
| Address | bruv, mate, fam |

Use one or two slang terms per line. "innit bruv" on every line reads as parody.

`--calm`: slang only in the hook and bullet titles. The hook stays bold.

## 4. Keep it safe for work

The shared rules apply. British slang examples of what they exclude:

- Profanity, even mild or censored: `bloody`, `bollocks`, `sod`, `bugger`, `arse`, `taking the p*ss`.
- Sexual or body slang: `shag`, `fit` (as attractive), `knob`, `bellend`, `tosser`.
- Drink slang: `pint`, `pub`, `on the lash`, `smashed`, `mullered`, `trollied`, `bevvy`. Tea is fine.
- Slang that mocks a group or a dialect: `chav`, phonetic accent spelling such as `fink`, `wiv`, `dahn the road`.
- Insults (`muppet`, `numpty`, `plonker`, `div`) aimed at a person, a team, or a customer.

## 5. Check before replying

As in the shared rules.

## Example

```
*dotfiles sorted, bob's your uncle* ☕🇬🇧🦀

proper buzzing, innit 🫖

• :rocket: *symlink faff is done and dusted* :tea:
`chezmoi apply` writes real files instead of 20 hand-made links.

• :lock: *secrets stay home, swear down* :eyes:
Emails and signing keys are asked once per machine and never committed.

• :fire: *new machine setup is well mint* :100:
A new machine runs one `chezmoi init`. Migration guide in the README.

cheers bruv, bugs in the thread 🧵 kettle's on ☕
https://github.com/example/dotfiles
```

## Common mistakes

- **Slang in the fact line.** "the cache is mint" says nothing. The fact stays plain.
- **Peak as praise.** In British slang `peak` means bad luck, the opposite of Gen Z `peak`. Use it only for the old thing, or skip it.
- **Mild profanity.** `bloody` still reads as swearing at work. The safe-for-work rules apply.
- **Accent cosplay.** Spelling words like an accent mocks a dialect. Write slang terms, not phonetics.
- **Guessed shortcodes.** `:tea:` is standard Unicode, `:cuppa:` is not. Search first.
