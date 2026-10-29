# Trackers

If the task names a ticket, or step 1a creates one, use this table.

| Tracker | Recognise it by | Read | Assign to me | Create |
|---|---|---|---|---|
| `linear` | a `linear.app/<org>/issue/<TEAM>-<N>` URL, or a bare `<TEAM>-<N>` id | Linear MCP `get_issue` | Linear MCP `save_issue` with `assignee: "me"` | Linear MCP `save_issue` with `assignee: "me"`. Ask for the team, using `list_teams` when you need the list. |
| `github` | a `github.com/<owner>/<repo>/issues/<N>` URL, or `<owner>/<repo>#<N>` | `gh issue view <N> --repo <owner>/<repo>` | `gh issue edit <N> --repo <owner>/<repo> --add-assignee @me` | `gh issue create --repo <owner>/<repo> --assignee @me` |

For plain `github`, get the repo with `gh repo view --json nameWithOwner` run in the default cwd of that workspace. If that fails, ask the user for `<owner>/<repo>`.

## Create a ticket

In step 1a, pick the workspace (step 2) and take its tracker. For Linear, ask which team, or confirm one you infer from the workspace. Draft the title and description. After approval, create it assigned to the user.
