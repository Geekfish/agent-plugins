---
name: brainrot-announce
description: Use when the user wants a Slack announcement, team update, or hype post about shipped work in internet brainrot meme style, such as Italian brainrot creatures, skibidi, sigma, Ohio, 6 7. SFW. Triggers include "brainrot announcement", "announce X in brainrot", "skibidi announcement", "/brainrot-announce". For everyday Gen Z slang, use genz-announce. For YouTube clickbait style, use clickbait-announce. For British slang (innit, bruv), use british-slang-announce.
---

# Brainrot Announce

Turn real shipped work into a Slack post that reads like a 2025 meme compilation. Memes outside, true facts inside, safe for work throughout. Brainrot is meme nonsense, not everyday slang: creature names, catchphrases, absurd escalation.

Read [the shared rules](../../references/announce-rules.md) first. They hold fact collection, emoji harvest, bullet shape, the `--calm` flag, safe-for-work rules and the final check. This file adds only the brainrot style.

## 1. Collect facts

As in the shared rules.

## 2. Harvest workspace emoji

As in the shared rules. Mood terms for the second search: `skull,moai,toilet,brain,crocodile,shark`.

## 3. Compose

Budget: 100 to 160 words, excluding links and code. Fixed shape, this order:

1. **Hook**, one line, bold with single asterisks. One format from the table. 2 to 3 Unicode emoji that match the meme: `🐊✈️`, `🦈👟`, `🗿`, `🚽`, `🧠`, `💀`, `🙌`.
2. **Reaction**, one line, 2 to 6 words from the reactions row. "chat is this real 💀", "erm what the sigma", "6 7 🙌".
3. **Body**, bullets as in the shared shape. Bullet titles carry the memes. Fact lines carry none.
4. **Sign-off**, 1 to 2 lines ("lock in and drop bugs in the thread", "tung tung tung sahur 🪵"), then the links.

| Hook format | Shape |
|---|---|
| Italian brainrot | "bombardiro dotfilo has entered the chat". A creature-style name mashed with the subject. |
| Only in Ohio | "only in ohio does ci pass first try" |
| Erm what the sigma | "erm what the sigma, the build takes 30 seconds now" |
| Just dropped | "skibidi deploy pipeline just dropped" |
| Lore | "the lore behind the old build script is crazy" |
| Meme shout | "FLINT AND STEEL. the yaml is gone". One caps shout, then the subject. |

| Meme family | Terms |
|---|---|
| Creatures | Tralalero Tralala 🦈👟, Bombardiro Crocodilo 🐊✈️, Tung Tung Tung Sahur 🪵, Ballerina Cappuccina ☕🩰, Brr Brr Patapim 🌳, Chimpanzini Bananini 🐒🍌. Remix the pattern on the subject: "Deployerino Zerodowntimo". |
| Sigma | sigma, alpha, mogging, +1000 aura, -1000 aura, lock in, grindset, mewing 🤫 |
| Skibidi | skibidi, Ohio, rizz, rizzler, fanum tax, NPC, sus, baka |
| Reactions | erm what the sigma, chat is this real, 6 7 🙌, we're so back, it's so over, crashing out, cooked, tuff, ong, sheesh |
| Minecraft movie | chicken jockey, I am Steve, flint and steel, water bucket release |

Use one or two memes per line and at least two families per post. Six creatures in a row is a zoo, not a post.

`--calm`: memes only in the hook and bullet titles. The hook stays bold.

## 4. Keep it safe for work

The shared rules apply. Brainrot examples of what they exclude:

- Sexual or body memes: `gyatt`, `hawk tuah`, `goon`, `edging`, `freaky`, `huzz`, `glazing`.
- Profanity acronyms, even censored: `sybau`, `ts pmo`, `goofy ahh`, `bombaclat`.
- Memes built on a real person: streamer names, `Baby Gronk`, `Livvy Dunne rizz`, Diddy jokes. `fanum tax` as a plain term is fine.
- Memes that mock a condition: `rizz with the tism`.
- Roast memes (`cooked`, `NPC`, `-1000 aura`) aimed at a person, a team, or a customer.

## 5. Check before replying

As in the shared rules.

## Example

```
*bombardiro dotfilo has entered the chat* 🐊✈️🦀

chat is this real 💀 6 7 🙌

• :rocket: *symlink spaghetti got fanum taxed* :skull:
`chezmoi apply` writes real files instead of 20 hand-made links.

• :lock: *secrets locked in, zero leaks ong* :moyai:
Emails and signing keys are asked once per machine and never committed.

• :fire: *new machine setup is +1000 aura* :brain:
A new machine runs one `chezmoi init`. Migration guide in the README.

lock in and drop bugs in the thread 🧵 tung tung tung sahur 🪵
https://github.com/example/dotfiles
```

## Common mistakes

- **Memes in the fact line.** "the cache is skibidi" says nothing. The fact stays plain.
- **One-family post.** Five creature names and nothing else. Mix the table rows.
- **Real-person memes.** A streamer name is a named person as the punchline. The safe-for-work rules exclude it.
- **Guessed shortcodes.** `:moyai:` is standard Unicode, `:tralalero:` is not. Search first.
