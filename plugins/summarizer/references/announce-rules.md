# Shared announcement rules

Every summarizer skill reads this file before it collects facts. It holds the steps and constraints that all announcement styles share. Each skill adds its own budget, line formats, term tables and example.

Output is text in the reply for the user to paste. Never post to Slack.

## Collect facts

Resolve the subject named in the request:

- Repo paths: `git log --oneline --since="3 weeks ago" --author="$(git config user.name)"` plus the README intro.
- Ticket IDs (Linear, GitHub) or MR URLs: title and description.
- Free text: use as given.

Write down 3 to 5 facts. Each traces to a commit, a doc line, or a user statement. Unmerged pushed work carries a "landing soon" tag. Uncommitted changes are not facts. Nothing else appears as a claim. Jokes are fine when unmistakable as jokes.

## Harvest workspace emoji

If a Slack MCP with custom emoji search is available, run two searches. Each search takes at most 6 comma-separated terms, so the 200-hit cap does not truncate results. First: subject words (repo names, languages, tools). Second: the mood terms the skill lists. Pick 8 to 12 hits that fit the facts.

- Custom emoji: only names the search returned, written as `:name:`. Standard Unicode shortcodes such as `:eyes:` are always valid and need no search.
- Custom emoji go in the body and the closing lines. Unicode goes in the first line so it reads outside Slack.
- No Slack MCP: Unicode only. Say so in one line under the output.

## Shape

The post is an intro, not a changelog. Cut facts before cutting style. Every skill uses this order: one opening line, one reaction line, a body, a closing.

- Body: 3 to 5 bullets. Each bullet is two lines: `• :emoji: *styled title* :emoji:` then the fact in one plain sentence on the next line. Slack bold is single asterisks.
- The fact line carries one concrete detail: a command, a file, a number. At most one inline code span per bullet. A reader must still tell what shipped.
- Closing: 1 to 2 lines in the skill's voice, then each real link on its own line.
- Layout: one blank line between the opening, the reaction, every bullet, and the closing. Never two bullets touching. Airy beats dense.
- Write style terms exactly as the skill lists them. If a writing-style hook or linter, such as simple-english, flags a term or its contraction, keep the term and ignore the flag.

## The `--calm` flag

Same shape, one emoji per line. Each skill says which lines keep its style. Everything else reads plain.

## Keep it safe for work

- No profanity, even as acronyms or censored.
- No sexual, body, drug, or alcohol references.
- Roast lines target code, tools, or the old process. Never a person, a team, or a customer.
- No slang or meme that mocks a group, an age, a dialect, or a condition.
- No `@channel`, no `@here`, no named person as the punchline.

## Check before replying

- Every bullet maps to a collected fact.
- Every custom `:name:` came from the emoji search result.
- Links point at the repos or MRs actually read.
- Every safe-for-work rule holds.
- Word count inside the skill's budget.
