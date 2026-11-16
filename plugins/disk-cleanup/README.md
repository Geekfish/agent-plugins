# disk-cleanup

A skill that finds what fills a Mac disk and plans a safe cleanup.

## free-disk-space

1. Runs a read-only survey. One `du` pass covers the Data volume, home, Library, known hot spots, container VMs, deleted files that are still open, package-manager previews and pending macOS updates.
2. Compares used space with what `du` can see. It gives you `sudo` commands for the folders only root can read.
3. Reports a ranked plan: what to clean, how much it frees, the command, the risk, and whether the data can be regenerated.
4. Deletes only the items you approve, and measures the space actually freed after each one.

Ask for example: "my disk is almost full, find out why" or "free up disk space".

Two catalogues list the places it checks and their fixes: [system, containers and open files](skills/free-disk-space/references/system.md), and [dev artefacts, toolchains, caches and user files](skills/free-disk-space/references/dev-and-apps.md). For example:

- an oversized Spotlight index
- old app copies in root's Bin
- unbounded Docker container logs
- orphan container volumes
- VM disks that do not shrink until you run `fstrim`
- stale language-server indexes
- browser code-sign clones

## Requirements

- macOS. The survey uses `diskutil`, `tmutil`, `softwareupdate` and the APFS Data volume path.
- Optional: `docker`, `colima`, `brew`, `mise` and `rustup`. The survey skips tools that are not installed.
- Some checks need `sudo`. The skill gives you those commands to run. It never runs `sudo` itself.
