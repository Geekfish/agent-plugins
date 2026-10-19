# summarizer

Skills that turn shipped work into short Slack announcements. Each skill builds the post only from real commits, tickets, doc lines and what you tell it. The skills write text for you to paste. They never post to Slack.

## clickbait-announce

Writes the post like a YouTube clickbait title and thumbnail, with heavy emoji.

Ask for example: "clickbait announcement for my work on the dotfiles repo" or "announce ABC-123 like a YouTuber".

```
🚨🦀 I REWROTE MY DOTFILES AND MY LAPTOP WILL NEVER BE THE SAME 😱 (NOT CLICKBAIT)

🔴➡️ ONE COMMAND. EVERY MACHINE. 👀

• :rocket: *NO MORE SYMLINK SPAGHETTI* :exploding_head:
`chezmoi apply` writes real files instead of 20 hand-made links.
```

## genz-announce

Writes the post in Gen Z social media slang. The post stays safe for work: no profanity, and roast slang targets code, never people.

Ask for example: "Gen Z announcement for my work on the dotfiles repo" or "announce ABC-123 in Gen Z slang".

```
*not me deleting 20 symlinks and calling it self care* 💅✨🦀

the way my laptop glowed up 😭

• :rocket: *symlink spaghetti is cooked* :skull:
`chezmoi apply` writes real files instead of 20 hand-made links.
```

## brainrot-announce

Writes the post in internet brainrot meme style: Italian brainrot creatures, skibidi, sigma, Ohio, 6 7. The post stays safe for work: no sexual or body memes, no memes built on a real person, and roast memes target code, never people.

Ask for example: "brainrot announcement for my work on the dotfiles repo" or "announce ABC-123 in brainrot".

```
*bombardiro dotfilo has entered the chat* 🐊✈️🦀

chat is this real 💀 6 7 🙌

• :rocket: *symlink spaghetti got fanum taxed* :skull:
`chezmoi apply` writes real files instead of 20 hand-made links.
```

## british-slang-announce

Writes the post in British slang: innit, bruv, proper chuffed, sorted, Bob's your uncle. The post stays safe for work: no mild swearing such as "bloody", no drink slang, no accent spelling, and roast slang targets code, never people.

Ask for example: "British slang announcement for my work on the dotfiles repo" or "announce ABC-123 in British slang".

```
*dotfiles sorted, bob's your uncle* ☕🇬🇧🦀

proper buzzing, innit 🫖

• :rocket: *symlink faff is done and dusted* :tea:
`chezmoi apply` writes real files instead of 20 hand-made links.
```

## The `--calm` flag

All skills accept `--calm`. The post keeps the same shape with one emoji per line. In clickbait-announce, only the title uses ALL CAPS. In genz-announce, brainrot-announce and british-slang-announce, only the hook and bullet titles use slang or memes.

## Shared rules

The skills share fact collection, emoji harvest, bullet shape, the `--calm` flag and the safe-for-work rules. They live in [references/announce-rules.md](references/announce-rules.md). Each skill adds its own budget, line formats and term tables.

## Requirements

- For repo work: `git` and a local clone of the repo
- For tickets or merge requests: access to them, for example through the Linear MCP server or the `gh` CLI
- Optional: a Slack MCP server with custom emoji search. Without it, the skills use standard emoji only.
