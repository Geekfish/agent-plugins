# herdr-extensions

Skills for [Herdr](https://herdr.dev/).

## herdr-new-task

Starts a Herdr tab in the right workspace, with an agent already primed on a task. The task can be a Linear or GitHub ticket, a chat thread or a plain description.

Ask for example: "start a new task for ABC-123" or "new tab in Support: look into the failing nightly export".

### Setup

The skill reads your workspaces from `~/my-workspace.toml`. If the file is missing, the skill offers to create it on first use. It lists your current Herdr workspaces, asks what each one is for, and writes the file after you approve it.

To write it by hand, copy [the example](skills/herdr-new-task/references/my-workspace.toml.example). It documents every field.

### Agent kinds with special launch steps

Some agent kinds need launch steps that Herdr cannot do alone. Each has a harness file named `<kind>.md`. The skill looks in two places, and uses the first file it finds:

1. `references/harnesses/` in the skill, which ships `codex.md` and `opencode.md`
2. `~/.config/herdr-new-task/harnesses/`, for your own kinds

### Design notes

- Workspaces match by label, not folder, because several workspaces can share a folder.
- Claude gets its prompt as a launch argument. Claude Code wraps a long typed-in paste in `<pasted_content>` tags, and the agent then treats it as text from someone else.
- Claude starts with `--permission-mode auto`, so it does not stall on permission prompts in a tab nobody watches. Codex `--approve-for-me` does the same for Codex.

### Requirements

- Herdr, with the skill running inside a Herdr pane
- `jq`
- For tickets: the Linear MCP server, or the `gh` CLI for GitHub issues
