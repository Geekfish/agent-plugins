# Other agent kinds

Use this file for any kind other than `claude`.

`herdr agent start` kinds: `pi`, `claude`, `codex`, `gemini`, `cursor`, `devin`, `agy`, `cline`, `omp`, `mastracode`, `opencode`, `copilot`, `kimi`, `kiro`, `droid`, `amp`, `grok`, `hermes`, `kilo`, `qodercli`, `qwen`, `maki`.

A kind not in this list and without a harness file is not supported: say so and stop.

## Send the prompt

After the step 7 check, send the prompt. Skip this for `claude` and for a harness that passes the prompt at launch. Send without `--wait`, then confirm:

```bash
herdr agent prompt <AGENT_NAME> "<PROMPT>"
herdr pane read <PANE_ID> | tail -15
```

The prompt must appear in the agent's transcript above a working indicator. Next to a shell prompt means the agent is not running: go back to the check.

