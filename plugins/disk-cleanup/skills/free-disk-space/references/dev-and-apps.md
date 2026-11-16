# Dev artefacts, toolchains, caches and user files

Read only the sections that match a large area from the survey. Each section lists checks (read-only), fixes and the risk.

## Dev artefacts

- **Git worktrees.** `git worktree list`. For each worktree, check `git status --porcelain`, commits ahead of the default branch, and whether its merge request or pull request is merged. Remove a merged and clean worktree with `git worktree remove <path>`. Never remove a worktree with uncommitted or unpushed work without approval.
- **Build folders and dependencies.** Find the largest:
  `find <root> -maxdepth 5 -type d \( -name node_modules -o -name target -o -name _build -o -name deps -o -name .venv -o -name dist \) -prune -exec du -sh {} + 2>/dev/null | sort -rh | head -30`
  - Fix: `cargo clean` for Rust. Delete the folder for the others. Prefer idle repos and worktrees.
  - Delete a folder only if git ignores it (`git -C <repo> check-ignore -q <dir>` succeeds). Some repos commit `dist` or `deps`.
  - Risk: low, because ignored build folders are regenerable. The next build takes longer.
- **Language-server indexes.** Folders such as `.expert`, `.elixir_ls` and `.lexical`, and editor caches. Indexes are often stored per toolchain version, so old versions stay behind after a toolchain upgrade. Compare the version folders with the project's current versions. If the user no longer uses that server, delete the whole folder.

## Package managers and toolchains

Preview first, then run the real command after approval.

| Tool | Preview | Clean |
|---|---|---|
| Homebrew | `brew cleanup -n`, `brew autoremove -n`, `brew leaves` | `brew cleanup`, `brew cleanup -s --prune=all` (also cached downloads), `brew autoremove` |
| mise | `mise ls --prunable` | `mise prune` (only versions that no tracked config uses) |
| rustup | `rustup toolchain list`, `du -sh ~/.rustup/toolchains/*` | `rustup toolchain uninstall <version>` |
| pnpm | `du -sh "$(pnpm store path)"` | `pnpm store prune` |
| npm | `du -sh ~/.npm/_cacache` | `npm cache clean --force` |
| Go | `du -sh "$(go env GOMODCACHE)" "$(go env GOCACHE)"` | `go clean -modcache`, `go clean -cache` |
| pip / uv | `pip cache info`, `du -sh "$(uv cache dir)"` | `pip cache purge`, `uv cache prune` |

A managed Homebrew, such as Workbrew, can keep its cache under `/opt` and can need admin rights. `brew --cache` shows where it is.

## App caches and temp folders

- `~/Library/Caches`: everything there is regenerable. Updater download caches (`*.ShipIt`, `*-updater`) and test-runner binaries (Cypress) are quick wins. Browsers manage their own caches.
- `~/Library/Application Support`: app data, not caches. Large VM bundles or model files of desktop apps can be removed in the app, or deleted if the feature is unused. They download again when needed. Never delete profiles or databases without approval.
- Per-user temp folders: `du -xhd2 "$TMPDIR/.." | sort -rh | head`. Chrome leaves old copies of itself in `X/com.google.Chrome.code_sign_clone` after updates. Quit Chrome, then delete that folder. Because of APFS clones, this frees less than `du` shows.

## User files

- Largest files: `find ~/Downloads -type f -size +20M -exec stat -f '%z %Sm %N' -t '%Y-%m-%d' {} + | sort -rn | head -40`.
- Duplicates: `find ~/Downloads -type f -size +5M -print0 | xargs -0 md5 -r | sort`, then look for repeated hashes.
- Installers (`.dmg`, `.pkg`, app `.zip`) can be deleted once the app is installed.
- Look inside unknown archives before you suggest keeping them. Exports of logs or data can contain personal data, so delete them permanently with `rm`.
- Ask about recordings, personal media and documents. Never delete them without approval.

## Coding-agent session data

Check: `du -sh ~/.claude/projects ~/.codex/sessions ~/.local/share/opencode ~/.local/share/claude/versions 2>/dev/null`.

- Old CLI versions under `versions` folders are regenerable.
- Session transcripts can hold history the user wants to keep. Delete them only on request, and the oldest first.
