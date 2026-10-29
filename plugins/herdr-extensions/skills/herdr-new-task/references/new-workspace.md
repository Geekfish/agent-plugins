# Create the workspace

If no workspace label matches in step 4, create the workspace:

```bash
herdr workspace create --label "<LABEL>" --cwd "<DEFAULT_CWD>" --no-focus
```

The id is at `.result.workspace.workspace_id`. Rename the first tab it creates (`.result.tab.tab_id`) with `herdr tab rename <new-tab-id> "Term"`.
