# Set up `~/my-workspace.toml`

If `~/my-workspace.toml` does not exist, set it up with the user before continuing:

1. List the existing Herdr workspaces, and take each one's folder from its first pane:

   ```bash
   herdr workspace list | jq -r '.result.workspaces[] | .workspace_id + " " + .label'
   herdr pane list --workspace <WS_ID> | jq -r '.result.panes[0].cwd'
   ```

2. Show them as a draft list, label and folder. Ask which to keep, which to add, and a one-line description for each.
3. Ask where their tickets live (`linear`, `github` or none), to set the top-level `tracker`.
4. Draft `~/my-workspace.toml` in the format of `my-workspace.toml.example`, next to this file. Show the draft. **Wait for approval**, then write it.
