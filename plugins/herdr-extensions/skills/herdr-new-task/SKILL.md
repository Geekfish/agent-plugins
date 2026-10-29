---
name: herdr-new-task
description: Start a Herdr tab with an agent primed on a task. Use when asked to start a new tab or task for a prompt, issue or thread, optionally naming a workspace, agent, model or effort.
allowed-tools: Read, Bash(herdr:*), Bash(jq:*), Bash(cp:*), Bash(test:*), Bash(gh issue:*), Bash(gh repo view:*), mcp__Linear__get_issue, mcp__Linear__list_teams, mcp__Linear__save_issue, mcp__claude_ai_Slack__slack_read_thread
---

# Herdr New Task

```bash
test "${HERDR_ENV:-}" = 1
```

If this fails, say you are not inside Herdr and stop.

## Workspaces

Read `~/my-workspace.toml`, one `[[workspace]]` block per Herdr workspace:

| Field | Meaning |
|---|---|
| `label` | Herdr workspace label. Match by label, not cwd. |
| `cwd` | A path, or a list of `{ path, hint }` tables. The first is the default. `hint` says which tasks go there. Expand a leading `~` to `$HOME`. |
| `description` | What the workspace is for. Step 2 picks by it. |
| `named_only` | Optional. If `true`, use only when the user names it. |
| `prompt_suffix` | Optional. A sentence that ends the brief. |
| `tracker` | Optional. `linear`, `github` (the repo of the default cwd), or `github:<owner>/<repo>`. A top-level `tracker` sets the default. Else ask the user when a step needs it. |

If the file does not exist, follow [setup](references/setup.md) first. If the user names a workspace that is not in the file, ask for its cwd and description, then append a `[[workspace]]` block before continuing.

## Step 1 — Resolve the task

[Trackers](references/trackers.md) covers `linear` and `github` tickets. A URL names its own tracker. A bare id like `ABC-123` or `#42` does not: use the workspace `tracker`, picking the workspace (step 2) from the user's words only.

**Chat thread URL**: read the thread with the chat tool you have. Scan its text, attachments and link previews for a ticket URL or id. Take the first one and read it.

Keep every resolved URL for step 7.

### Step 1a — No ticket

If no ticket was found, ask the user whether to create one, even for a plain idea with no thread. If yes, draft it per [trackers](references/trackers.md) and show the draft. **Wait for approval.** Never create the ticket without it. Use the new id from here on. If no, continue without a ticket.

### Step 1b — Claim

Assign an unassigned ticket to the user without asking. Leave an existing assignee and report it.

## Step 2 — Pick the workspace

Use the workspace the user named. Else pick the best `description` fit, skipping `named_only = true`. Signals: the ticket's team or repo, and technology or project names. Also a path under a named project, customer report or incident versus planned change, and whether there is a ticket. If two fit equally, or none does, ask the user.

### Step 2a — Select the agent

Kind is `claude` unless the user asks for another. For `claude` or `codex`, pass a model or effort only if the user gives one.

Read the first `<kind>.md` harness file found in `references/harnesses/`, then `~/.config/herdr-new-task/harnesses/`, before creating the work tab. For that kind, it overrides this skill. For a kind other than `claude`, also read [other kinds](references/other-kinds.md) now.

### Step 2b — Pick the task cwd

For a single path, that is the task cwd. For a list, use the entry whose `hint` fits the task. If none fits clearly, use the first. Never use a folder that is not listed.

## Step 3 — Build the label

`<TICKET-ID>-<3-to-4-word-slug>`, or `<3-to-4-word-slug>` without a ticket. A GitHub ticket id is `<repo>-<N>`. Slug from the ticket title or the user's description: lowercase, hyphen separated, only the words that identify the problem.

| Input | Label |
|---|---|
| ABC-123 "Saving the profile form drops the postcode field" | `ABC-123-profile-postcode-dropped` |
| "look into why the nightly export writes duplicate rows" | `export-duplicate-rows` |

## Step 4 — Find or create the workspace

```bash
herdr workspace list | jq -r '.result.workspaces[] | .workspace_id + " " + .label'
```

Match the label case-insensitively. If several match, use the first and report it. With no match, follow [new workspace](references/new-workspace.md).

## Step 5 — Ensure a "Term" tab

```bash
herdr tab list --workspace <WS_ID> | jq -r '.result.tabs[] | .tab_id + " " + .label'
```

If no label matches `^Term$` (case-insensitive), create one. Never start an agent in it. Do not close or rename tabs you did not create.

```bash
herdr tab create --workspace <WS_ID> --cwd "<DEFAULT_CWD>" --label "Term" --no-focus
```

## Step 6 — Create the work tab

If a step 5 label contains the ticket id (or slug), report it and ask whether to reuse it or create a second.

```bash
herdr tab create --workspace <WS_ID> --cwd "<TASK_CWD>" --label "<LABEL>" --no-focus
```

The pane id is at `.result.root_pane.pane_id`. Keep `--no-focus` on every command unless the user asks to switch.

## Step 7 — Start the agent

Agent name: the label lowercased, non-alphanumerics removed, cut to 32 characters. It must match `[a-z][a-z0-9_-]{0,31}` and be unique in `herdr agent list`. If taken, append `-2`.

### Brief

A pane takes about 1,000 bytes per write, so keep every launch command under 500 bytes. Put the instructions in `~/.config/herdr-new-task/briefs/<LABEL>.md` (create the folder):

- First line: a heading with the ticket id and title, or the slug.
- Ticket: `Work on <TICKET_URL> . Start by reading the ticket, then investigate in this workspace.`
- Chat thread too: add `Reported in this thread: <THREAD_URL>` before the "Start by reading" sentence.
- No ticket: `<the user's description, in full> . Start by orienting yourself in this workspace.`
- Everything else the user asked for: constraints, files to read first, what done means, hand-over. Never in the launch command.
- If the workspace has a `prompt_suffix`, end with it.
- If the task explains a failure, error or incident and the suffix does not say so, end with: `Do not change code until you have reported your diagnosis.`

Launch prompt, one line:

- Ticket: `Work on <TICKET_URL> . Your full brief is in <BRIEF_PATH> : read it first and follow it.`
- No ticket: `Your task brief is in <BRIEF_PATH> : read it first and follow it.`

### Launch

```bash
herdr agent start <AGENT_NAME> --kind <KIND> --pane <PANE_ID> --timeout 60000 [-- <AGENT_ARGS>...]
```

For `claude`, the arguments after `--` are `--model <MODEL> --effort <EFFORT> --permission-mode auto "<PROMPT>"`. Omit `--model` and `--effort` unless the user selected them. Pass no flags to kinds without a harness file unless the user asked. Herdr shell-quotes arguments.

### Check that the agent runs

After every launch, check the pane, not the exit code:

```bash
herdr pane read <PANE_ID> | tail -20
herdr agent list | jq -c '.result.agents[] | select(.pane_id=="<PANE_ID>")'
```

The agent runs if the pane shows its input box (for `claude`, the Claude Code prompt box) and `herdr agent list` has its row. If not, follow [launch recovery](references/launch-recovery.md). Ignore a failed MCP server, but report it.

## Step 8 — Report back

Output exactly these lines and nothing else:

```
- Workspace "<workspace label>" (<workspace id>) created
- Tab "Term" created
- Tab "<tab label>" created in <TASK_CWD>
- Agent <agent name> (<kind>) prompted with <the full prompt text you sent>
- Agent <agent name> (<kind>, <model> <effort>) prompted with <the full prompt text you sent>
- Brief written to <BRIEF_PATH>
- Ticket <TICKET-ID> assigned to you
```

Use one agent line, with model and effort if selected. Say `created` or `updated` for the workspace. Include `Tab "Term"` only if this skill made or renamed it. Include the ticket line only if this skill changed the assignee. If someone else holds it, write `- Ticket <TICKET-ID> already assigned to <name>`. Add a line for an inferred workspace, an agent restart, or a failed MCP server. Harness files can add lines.
