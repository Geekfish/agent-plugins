# Create the workspace

If no workspace label matches in step 4, create the workspace:

```bash
herdr workspace create --label "<WORKSPACE_LABEL>" --cwd "<TASK_CWD>" --no-focus
```

The id is at `.result.workspace.workspace_id`. Use the first tab it creates as the work tab, so the workspace has no empty extra tab. Rename it to the step 3 label with `herdr tab rename <TAB_ID> "<LABEL>"`. The tab id is at `.result.tab.tab_id` and its pane id at `.result.root_pane.pane_id`.
