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

1. `references/harnesses/` in the skill, which ships `opencode.md`
2. `~/.config/herdr-new-task/harnesses/`, for your own kinds

### Requirements

- Herdr, with the skill running inside a Herdr pane
- `jq`
- For tickets: the Linear MCP server, or the `gh` CLI for GitHub issues
