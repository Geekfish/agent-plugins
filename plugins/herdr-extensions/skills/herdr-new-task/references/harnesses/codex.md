# Codex

If the selected kind is `codex`, use this file. It launches with `herdr agent start` like the other kinds in step 7.

## Launch

Arguments after `--`:

```
--model <MODEL> --config model_reasoning_effort=<EFFORT> --approve-for-me
```

If the user did not select a model or effort, omit `--model` and the effort argument. `--approve-for-me` routes Codex approval requests through automatic review.

Ready pane: `Ask Codex to do anything`.

Codex takes the prompt after launch, through "Send the prompt" in `../other-kinds.md`.

## Example

```bash
herdr agent start abc123profilepostcodedropped --kind codex --pane pane-123 --timeout 60000 -- --approve-for-me
herdr agent prompt abc123profilepostcodedropped "Work on https://linear.app/acme/issue/ABC-123 . Your full brief is in /Users/me/.config/herdr-new-task/briefs/ABC-123-profile-postcode-dropped.md : read it first and follow it."
```

Perform the readiness checks before sending the prompt.
