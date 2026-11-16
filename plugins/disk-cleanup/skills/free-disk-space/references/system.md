# System, containers and open files

Read only the sections that match a large area from the survey. Each section lists checks (read-only), fixes and the risk. Commands marked `sudo` are for the user to run.

## Hidden system space

When used space is much larger than what `du` can see. macOS Storage settings show this as "System Data".

- **Spotlight index.** Check: `sudo du -xhs /System/Volumes/Data/.Spotlight-V100`. A healthy index is a few GB. Tens of GB usually means it indexes millions of dev files (dependencies, build folders, package stores) or the index is damaged.
  - Fix: first exclude dev folders (System Settings → Spotlight → Search Privacy). Drag a folder from Finder into the list, or press `⌘⇧G` in the picker to type a hidden path. Then rebuild with `sudo mdutil -E /`.
  - Measure again after indexing finishes (`mds_stores` stops using CPU). If the index is still large, print the exclusions with `sudo /usr/libexec/PlistBuddy -c "Print :Exclusions" /System/Volumes/Data/.Spotlight-V100/VolumeConfiguration.plist`. Then list the stores with `sudo du -hd1 /System/Volumes/Data/.Spotlight-V100 | sort -rh`.
  - Risk: low. Finder and Spotlight search are incomplete during the rebuild. Excluded folders no longer show in Finder search.
- **Root's Bin.** Check: `sudo du -xhd1 /private/var/root | sort -rh`. Updaters and device-management tools that run as root can move every old app copy into `/private/var/root/.Trash`, and nothing empties it.
  - Fix: list it first with `sudo ls -la /private/var/root/.Trash`. Then empty it with `sudo find /private/var/root/.Trash -mindepth 1 -maxdepth 1 -exec rm -rf {} +`.
  - Risk: low. Check the listing for anything that is not an old app copy. Report the app that leaks, because the Bin will fill again.
- **Staged macOS update.** Check: `softwareupdate --list`, `tmutil listlocalsnapshots /`, and the Preboot volume size in `diskutil apfs list`. A `com.apple.os.update-MSUPrepareUpdate` snapshot, or an update listed by `softwareupdate --list`, means an update is staged. A Preboot above about 10 GB points the same way. A `com.apple.os.update-<hash>` snapshot is the normal boot snapshot. Do not delete it.
  - Fix: install the update and restart. Delete local Time Machine snapshots (`com.apple.TimeMachine.*` only) on request: `sudo tmutil deletelocalsnapshots <date>`.
- **VM volume.** This volume holds swap and the sleep image. A restart frees swap.
- **Purgeable space.** macOS frees it on demand. Do not count it as a problem.
- **Other root-only folders.** Check: `sudo du -xhd1 /System/Volumes/Data /System/Volumes/Data/private/var /System/Volumes/Data/private/var/db 2>/dev/null | sort -rh | head -25`.

## Container VMs

Container runtimes keep everything in a VM disk file on the host. Common locations: `~/.colima/_lima/_disks/*/datadisk` (Colima), `~/.lima` (Lima), `~/Library/Containers/com.docker.docker` (Docker Desktop), `~/.orbstack` (OrbStack). The commands below use Colima's `colima ssh --`. For Lima use `limactl shell <vm>`. For Docker Desktop, OrbStack and Podman, use the runtime's own shell or disk settings.

- **Where the space is.** Run `docker system df -v`. Inside the VM, run `colima ssh -- sudo du -xhd1 /var/lib/docker /var/lib/containerd | sort -rh`.
  - A large `docker/containers` folder means a container log has grown.
  - A large `containerd` folder holds images (with the containerd image store). Fix it with `docker image prune -a`.
- **Unbounded container logs.** Docker's default `json-file` driver never rotates. List each container's log path with `docker ps -aq | xargs docker inspect -f '{{.Name}} {{.LogPath}}'`. Measure them with `colima ssh -- sudo sh -c 'du -sh /var/lib/docker/containers/*/*-json.log | sort -rh | head -3'`.
  - Fix: `colima ssh -- sudo truncate -s 0 <LogPath>`. Use the full path, not a glob.
  - Fix the cause: set log options in the runtime config, for example `docker.log-opts: {max-size: 50m, max-file: "3"}` in `~/.colima/default/colima.yaml`. Keep any existing `features` keys there, because dropping `containerd-snapshotter` hides existing images. Restart the runtime, then recreate the containers, because a running container keeps its old log settings. A shared `x-logging` anchor in the project's compose file fixes it for every user.
  - Note: a container created by compose may also use override files. Read the `com.docker.compose.project.config_files` label, and recreate the container with the same files.
- **Unused images.** `docker image prune -a`. Risk: low, because images can be pulled or built again. Local builds can be slow.
- **Orphan volumes.** Find volumes no container uses: `docker volume ls -qf dangling=true`, and show their sizes with `docker system df -v`. Risk: medium, because volumes can hold databases or work that cannot be regenerated. Remove them only by name, after the user confirms.
- **Build cache.** `docker builder prune`. Risk: low.
- **Give the space back to macOS.** The VM disk file does not shrink when files are deleted inside the VM. Run `colima ssh -- sudo fstrim -av`, then compare the host file size with `du -h <datadisk>`.

## Deleted files still held open

Check: `lsof +c 0 -nP +L1 | awk 'NR>1 && !seen[$2" "$9]++ {s[$1" "$2]+=$7} END {for (k in s) if (s[k]>5e7) printf "%.2fG\t%s\n", s[k]/1e9, k}' | sort -rh`.

Totals are per process. Several processes can hold the same file, so do not add them up.

- A VM process (`com.apple.Virtualization…`) that holds deleted files from a shared folder: restart the VM.
- Many copies of a CLI that holds an old binary after an upgrade: restart those sessions.
- Risk: restarting a VM stops its containers. Ask first.
