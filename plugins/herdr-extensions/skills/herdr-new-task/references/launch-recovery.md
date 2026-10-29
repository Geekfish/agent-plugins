# Launch recovery

If the step 7 pane check shows that the agent is not running, or `herdr agent start` fails, use this file.

`herdr agent start` reports success as soon as it sends the launch command. It can also report `timed out waiting for agent startup` while the agent is already running and reading the brief. Trust the pane, not the exit code. A CLI that auto-updates on launch prints its release notes, tells you to restart it, and exits. A prompt sent to that pane goes to the shell and is lost.

If the pane shows a shell prompt, an update notice, a crash, or a login request, the agent is not running. Launch it again with the same pane, then check again. An auto-update needs one restart and then works. Stop after two failed attempts and report what the pane shows, because a login or a missing binary needs the user.

If the pane shows your launch command sitting at the shell prompt, cut off mid-sentence, the command was too long for the terminal. Clear the line with `herdr pane send-keys <PANE_ID> c-c`, shorten the launch prompt to the one line in step 7, and launch again.

A pane that shows the agent's input box but has no row in `herdr agent list` is still running: Herdr's detection timed out, nothing else. If instead `herdr agent start` answers `agent_name_taken` for a pane whose agent is not running, that pane holds a stale record and refuses a relaunch as busy. Close that tab if this skill created it, create a new work tab, and launch there under a new name.
