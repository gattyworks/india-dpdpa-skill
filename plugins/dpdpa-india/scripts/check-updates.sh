#!/usr/bin/env bash
# Check whether the dpdpa-india skill's upstream legal sources have changed.
# Native bash (uses curl + sha256sum/shasum + jq). Falls back to check-updates.py if jq is absent.
#
#   ./check-updates.sh            # check and report (exit 1 if any changed)
#   ./check-updates.sh --update   # re-pin hashes after re-verifying the references
#   ./check-updates.sh --json     # machine-readable output
set -euo pipefail

DIR="$(cd "$(dirname "$0")" && pwd)"
LOCK="$DIR/sources.lock.json"
UA="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36"
UPDATE=0; JSON=0
for a in "$@"; do case "$a" in --update) UPDATE=1;; --json) JSON=1;; *) ;; esac; done

if ! command -v jq >/dev/null 2>&1; then
  if command -v python3 >/dev/null 2>&1; then exec python3 "$DIR/check-updates.py" "$@"; fi
  echo "check-updates.sh needs 'jq' or 'python3' installed." >&2; exit 2
fi

sha256() { if command -v sha256sum >/dev/null 2>&1; then sha256sum | cut -d' ' -f1; else shasum -a 256 | cut -d' ' -f1; fi; }

if [ -t 1 ]; then G=$'\033[32m'; Y=$'\033[33m'; R=$'\033[31m'; D=$'\033[2m'; N=$'\033[0m'; else G=""; Y=""; R=""; D=""; N=""; fi

n=$(jq '.sources | length' "$LOCK")
verified=$(jq -r '.verified' "$LOCK")
changed=0; errors=0; report=""; updates=""

for i in $(seq 0 $((n-1))); do
  id=$(jq -r ".sources[$i].id" "$LOCK")
  url=$(jq -r ".sources[$i].url" "$LOCK")
  old=$(jq -r ".sources[$i].sha256 // \"\"" "$LOCK")
  feeds=$(jq -r ".sources[$i].feeds // \"\"" "$LOCK")
  if live=$(curl -sSL --max-time 45 -A "$UA" "$url" 2>/dev/null | sha256); then
    if [ -z "$old" ]; then status="BASELINE"; col="$D"
    elif [ "$live" = "$old" ]; then status="OK"; col="$G"
    else status="CHANGED"; col="$R"; changed=$((changed+1)); report+="    - $id  ->  $feeds"$'\n'; fi
    updates+="$id $live"$'\n'
  else status="ERROR"; col="$Y"; errors=$((errors+1)); fi
  printf "  %s%-9s%s %-24s %s\n" "$col" "$status" "$N" "$id" "$url"
done

echo
if [ "$UPDATE" -eq 1 ]; then
  tmp=$(mktemp)
  cp "$LOCK" "$tmp"
  while read -r id live; do [ -z "$id" ] && continue
    jq --arg id "$id" --arg h "$live" '(.sources[] | select(.id==$id) | .sha256) = $h' "$tmp" > "$tmp.2" && mv "$tmp.2" "$tmp"
  done <<< "$updates"
  jq --arg d "$(date +%F)" '.verified = $d' "$tmp" > "$LOCK"
  rm -f "$tmp"
  echo "${G}Lock file re-pinned to current hashes.${N}"
elif [ "$changed" -gt 0 ]; then
  echo "${R}${changed} source(s) CHANGED - re-verify the affected reference files:${N}"
  printf "%s" "$report"
  echo "  Re-verify against the source, update the .md files, then run with --update."
elif [ "$errors" -gt 0 ]; then
  echo "${Y}All reachable sources current; ${errors} could not be fetched (retry / check network).${N}"
else
  echo "${G}All sources current.${N}"
fi

[ "$changed" -gt 0 ] && exit 1 || exit 0
