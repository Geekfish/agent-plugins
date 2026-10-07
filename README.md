# Agent plugins

Skills and plugins for coding agents. One marketplace serves Claude Code, Codex and OpenCode.

| Plugin | Skills | What it does |
|---|---|---|
| [herdr-extensions](plugins/herdr-extensions) | `herdr-new-task` | Starts a [Herdr](https://herdr.dev/) tab with an agent already primed on a task. Reads Linear or GitHub tickets, chat threads or a plain description. |
| [summarizer](plugins/summarizer) | `clickbait-announce` | Turns shipped work into a clickbait-style Slack announcement, built only from real commits, tickets and links. |

## Install

### Claude Code

```zsh
claude plugin marketplace add Geekfish/agent-plugins
claude plugin install herdr-extensions@geekfish
claude plugin install summarizer@geekfish
```

### Codex

```zsh
codex plugin marketplace add Geekfish/agent-plugins
codex plugin add herdr-extensions@geekfish
codex plugin add summarizer@geekfish
```

### OpenCode

OpenCode reads the catalog in `.opencode/marketplace.json` through a separate plugin manager. It needs its own install process.

## herdr-new-task setup

The skill reads your Herdr workspaces from `~/my-workspace.toml`. On first use it offers to copy the example from `references/my-workspace.toml.example`.

Agent kinds that need special launch steps have a harness file named `<kind>.md`. The skill ships some in `references/harnesses/`. Put your own in `~/.config/herdr-new-task/harnesses/`.

## Layout

```text
.claude-plugin/marketplace.json   Claude Code catalog
.agents/plugins/marketplace.json  Codex catalog
.opencode/marketplace.json        OpenCode catalog
plugins/<plugin>/
  .claude-plugin/plugin.json      Claude Code manifest
  .codex-plugin/plugin.json       Codex manifest
  skills/<skill>/SKILL.md
```

When a plugin changes, bump the version in both of its manifests. Keep them equal. Claude Code and Codex only pick up a change after a version bump.
