#!/usr/bin/env bash
# Read-only disk survey for macOS. Needs no sudo, deletes nothing.
# Usage: survey.sh [extra paths to size under "Known hot spots"]
# The quick sections print first. Then one du pass over the Data volume feeds
# every size below it. du silently skips folders that only root can read and
# privacy-protected folders. The "gap" line shows how much that hides.
set -u

data=/System/Volumes/Data
tmp=$(mktemp)
trap 'rm -f "$tmp"' EXIT

section() { printf '\n== %s\n' "$1"; }
have() { command -v "$1" >/dev/null 2>&1; }
human() { awk -F'\t' '{ k=$1; u="K"; if (k>=1048576) {k/=1048576; u="G"} else if (k>=1024) {k/=1024; u="M"}; printf "%6.1f%s\t%s\n", k, u, $2 }'; }
# Children of a folder, biggest first: children <folder> <count>
children() {
  awk -F'\t' -v pre="$data$1/" 'index($2, pre)==1 && index(substr($2, length(pre)+1), "/")==0' "$tmp" |
    sort -rn | head -"$2" | sed "s|$data||" | human
}

section "Volume"
df -h "$data" | tail -1
diskutil apfs list 2>/dev/null | awk -F': *' '/Name:/ {n=$2} /Capacity Consumed/ {print "  " n ": " $2}'

section "Containers"
for f in "$HOME"/.colima/_lima/_disks/*/datadisk "$HOME"/.lima/*/diffdisk; do
  [ -e "$f" ] && printf '  %s on disk: %s\n' "$f" "$(du -h "$f" | cut -f1)"
done
if have docker && docker info >/dev/null 2>&1; then
  docker system df
else
  echo "  docker not running or not installed"
fi

section "Deleted files still held open (over 50 MB per process, a shared file counts in each process)"
lsof +c 0 -nP +L1 2>/dev/null |
  awk 'NR>1 && !seen[$2" "$9]++ {s[$1" "$2]+=$7} END {for (k in s) if (s[k]>5e7) printf "  %.2fG\t%s\n", s[k]/1e9, k}' |
  sort -rh | head

section "Package manager previews"
have brew && echo "  brew cleanup: $(brew cleanup -n 2>/dev/null | tail -1 | grep . || echo 'nothing to remove')"
have mise && echo "  mise prunable versions: $(mise ls --prunable 2>/dev/null | wc -l | tr -d ' ')"
have rustup && rustup toolchain list 2>/dev/null | sed 's/^/  rustup: /'

section "Pending macOS updates and snapshots"
softwareupdate --list 2>&1 | grep 'Title:' | sed 's/^[[:space:]]*/  /'
tmutil listlocalsnapshots / 2>/dev/null | tail -n +2 | sed 's/^/  /'

echo
echo "Measuring folder sizes. This takes a few minutes..."
du -xkd5 "$data" 2>/dev/null >"$tmp"

section "Visible to du"
used_kb=$(df -k "$data" | awk 'NR==2 {print $3}')
seen_kb=$(awk -F'\t' -v d="$data" '$2==d {print $1}' "$tmp")
awk -v u="$used_kb" -v s="$seen_kb" 'BEGIN {printf "  used %.0fG, visible %.0fG, gap %.0fG (root-only or privacy-protected folders, Spotlight, snapshots)\n", u/1048576, s/1048576, (u-s)/1048576}'
children "" 10

section "Home folder"
children "$HOME" 20

section "Library"
children "$HOME/Library" 8
children "$HOME/Library/Caches" 10
children "$HOME/Library/Application Support" 10

section "Known hot spots"
brew_cache=$(have brew && brew --cache 2>/dev/null)
for p in "$HOME/.colima" "$HOME/.lima" "$HOME/.orbstack" "$HOME/Library/Containers/com.docker.docker" \
  "$HOME/.local/share/mise" "$HOME/.rustup" "$HOME/.cargo" "$HOME/.npm" "$HOME/Library/pnpm" \
  "$HOME/go/pkg" "$HOME/.cache" "$HOME/.gradle" "$HOME/.m2" "$HOME/.hex" "$HOME/.mix" \
  "$HOME/.claude" "$HOME/.codex" "$HOME/.local/share/opencode" "$HOME/.local/share/claude" \
  "$HOME/Downloads" "$HOME/Movies" "$HOME/Library/Developer" \
  /opt/homebrew /usr/local /private/var/folders; do
  awk -F'\t' -v p="$data$p" '$2==p' "$tmp"
done | sort -rn | sed "s|$data||" | human
for p in "$@"; do [ -e "$p" ] && du -sk "$p" 2>/dev/null | human; done
[ -n "$brew_cache" ] && du -sk "$brew_cache" 2>/dev/null | awk -F'\t' '{print $1 "\tbrew cache: " $2}' | human
[ -d /nix ] && du -sk /nix 2>/dev/null | human

if [ -n "${TMPDIR:-}" ]; then
  section "Per-user temp folders (a parent's size includes its children)"
  du -xkd2 "$(dirname "${TMPDIR%/}")" 2>/dev/null | sort -rn | sed -n '2,6p' | human
fi
