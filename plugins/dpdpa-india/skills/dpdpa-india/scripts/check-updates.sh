#!/usr/bin/env bash
# Check whether the dpdpa-india skill's upstream legal sources have changed.
# The Python checker is canonical because it supports SHA-256 and reachability checks.
#
#   ./check-updates.sh            # check and report (exit 1 if any changed)
#   ./check-updates.sh --update   # re-pin hashes after re-verifying the references
#   ./check-updates.sh --json     # machine-readable output
set -euo pipefail

DIR="$(cd "$(dirname "$0")" && pwd)"

if command -v python3 >/dev/null 2>&1; then exec python3 "$DIR/check-updates.py" "$@"; fi
if command -v python >/dev/null 2>&1; then exec python "$DIR/check-updates.py" "$@"; fi
echo "check-updates.sh needs Python 3." >&2
exit 2
