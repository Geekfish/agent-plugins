# OpenCode

If the selected kind is `opencode`, use this file. Do not use it for other kinds. It is for OpenCode v2. It launches with `herdr agent start` like the other kinds in step 7.

## Model and effort

Resolve both a model and reasoning effort before you create the work tab. Use values that the user already gave. Otherwise ask for the missing value. List the models and their efforts:

```bash
opencode api model.list | jq -r '.data[] | "\(.providerID)/\(.id)  \(.name)  [\([.variants[]?.id]|join(","))]"'
```

If a plugin does not load, `opencode models` fails. Use this command instead. A model with an empty list has no efforts. In that case, skip the effort and report it.

Match the model name of the user to a name in the list. If several versions match, use the latest. If more than one model still matches, ask the user. For example, "OpenCode sol xhigh" means the model `GPT-6.1 Sol` with the `xhigh` effort, and "kimi" means `kimi-k3`. Type that name in the model picker.

## Launch

The OpenCode v2 TUI has no `--model` flag, and it has no flag for the effort. Arguments after `--`:

```
--auto
```

`--auto` approves permission requests that are not explicitly denied. Do not pass `--prompt`, because OpenCode then sends the task before you can set the model.

The TUI uses the background service. Do not set `OPENCODE_CONFIG_CONTENT` or `--standalone`. The service ignores the variable, and `--standalone` starts without the providers of the service.

When the pane shows the input box and a footer line `Build auto · <model name> <provider>`, it is ready.

## Set the model and effort

Read the pane after each step, because a picker that is still open takes the next text.

```bash
herdr pane send-text <PANE_ID> "/model"
herdr pane send-keys <PANE_ID> enter
herdr pane send-text <PANE_ID> "<PICKER_NAME>"
herdr pane send-keys <PANE_ID> enter
herdr pane read <PANE_ID> | grep 'Build'
```

Then do the same with `/effort` and the effort name. The footer then ends with `· <effort>`. If the picker does not work, cycle the efforts with `ctrl+t`. Do not send the task prompt until the footer shows the requested model and effort.

The model and effort are shared by all OpenCode TUIs on the same service. A change also applies to other OpenCode panes that have not sent a prompt yet. If such a pane exists, report this in step 8.

## Example

OpenCode with Sol and xhigh effort:

```bash
herdr agent start abc123profilepostcodedropped --kind opencode --pane pane-123 --timeout 60000 -- --auto
herdr pane send-text pane-123 "/model"
herdr pane send-keys pane-123 enter
herdr pane send-text pane-123 "GPT-6.1 Sol"
herdr pane send-keys pane-123 enter
herdr pane send-text pane-123 "/effort"
herdr pane send-keys pane-123 enter
herdr pane send-text pane-123 "xhigh"
herdr pane send-keys pane-123 enter
herdr pane read pane-123 | grep 'Build'
herdr agent prompt abc123profilepostcodedropped "Work on https://linear.app/acme/issue/ABC-123 . Your full brief is in <BRIEF_PATH> : read it first and follow it."
```
