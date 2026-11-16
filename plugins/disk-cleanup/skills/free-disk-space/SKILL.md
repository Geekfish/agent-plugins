---
name: free-disk-space
description: Find what fills a Mac disk and plan a safe cleanup. Use for "disk is full", "free up disk space" or "System Data is huge". Covers Spotlight, containers, Homebrew and caches.
---

# Free Disk Space

Investigate first, read-only. Then give a ranked plan. Delete only the items the user approves.

Never run `sudo` yourself, in any step. Give sudo commands to the user to run.

## 1. Survey (read-only)

Run [the survey script](scripts/survey.sh): `bash scripts/survey.sh`. It needs no sudo and changes nothing. It takes a few minutes on a large disk, so run it with a 10-minute timeout or in the background. macOS may ask the user to allow access to some folders.

The script has a built-in list of known hot spots. To size other folders there, such as tool data folders the user names or that you know, pass them as arguments: `bash scripts/survey.sh <path>…`.

Do not delete, move, prune or restart anything in this step. Commands such as `docker system df`, `brew cleanup -n` and `mise prune --dry-run` are fine.

## 2. Account for every GB

Compare the Data volume's used space with what `du` can see. If the gap is more than a few GB, the space is in folders only root can read, in privacy-protected folders (Mail, Messages, app containers), or it is not in files. Do not guess. Give the user the commands from "Hidden system space" in [the system catalogue](references/system.md):

- Commands must start with `sudo`. Users often paste a command without it. Check the command line in their output before you trust the numbers.
- If `sudo du` still says "Operation not permitted", the terminal needs Full Disk Access (System Settings → Privacy & Security). Without it, plain `du` also skips privacy-protected folders in the home folder.
- Do not use `*` with paths that only root can read, or with paths inside a VM. zsh expands the glob on the host first and fails with "no matches found". Use full paths, or `sudo find <dir> -mindepth 1 -maxdepth 1 -exec … {} +`.

## 3. Drill into each large area

For each large area, read the matching section of one catalogue. Each section has the check commands, the fixes and the risk:

- [System, containers and open files](references/system.md):
  - hidden system space: Spotlight index, root's Bin, staged macOS updates, purgeable space
  - container VMs: Docker logs, images, volumes, and handing the space back to macOS
  - deleted files that a running process still holds open
- [Dev artefacts, toolchains, caches and user files](references/dev-and-apps.md):
  - worktrees, build folders, dependencies, language-server indexes
  - Homebrew, mise, rustup, pnpm, npm, Go, pip and uv
  - app caches and temp folders, including browser code-sign clones
  - Downloads, installers, duplicates, data exports
  - coding-agent session data

Before you suggest deleting a repo folder or worktree, check its state: uncommitted files, unpushed commits, merged or open branch. Use the code host if one is available.

## 4. Report a ranked plan

Use one table, biggest win first:

| # | What | Frees | Command | Risk / regenerable? |

- Mark every item as regenerable or not. Data in container volumes, uncommitted work and personal files cannot be regenerated.
- Mark sizes as measured or estimated.
- Name the cause when the space will fill up again, for example unbounded logs or an updater that leaks old copies. Suggest a fix for the cause, not only the cleanup.
- Prefer `trash` (built into macOS 15 and later) over `rm` for user files, so they can be restored. On older macOS, use `mv -n <file> ~/.Trash/`, then check that the file has moved. Use `rm` for sensitive data such as log or database exports.
- Put the commands that need sudo in a separate block for the user to run.

## 5. Clean up

Run only the items the user approves. A request for the plan does not approve deletion.

- After each item, measure free space again with `df -h /System/Volumes/Data`. Report the space actually freed. APFS clones share disk blocks, so deleting them often frees much less than `du` showed.
- Stop and report if a command fails, or if it would touch more than the approved item.
- At the end, show free space before and after, and the items that are left.
