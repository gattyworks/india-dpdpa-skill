---
description: Check whether the DPDP Act/Rules/templates sources changed since this skill was pinned
argument-hint: ""
---

Run the dpdpa-india update checker to detect upstream legal changes:

```
python "${CLAUDE_PLUGIN_ROOT}/scripts/check-updates.py"
```

If `python` is unavailable, use the platform variant in `${CLAUDE_PLUGIN_ROOT}/scripts/`
(`check-updates.ps1` on Windows, `check-updates.sh` on macOS/Linux).

The script re-fetches the pinned sources in `scripts/sources.lock.json`, compares content hashes,
and reports any that changed. Exit code `0` means every known source matched, `1` means at least
one source changed, and `2` means the check was incomplete because one or more sources could not
be fetched or processed. Never report an exit-code-2 run as current, and never update the lock
file from a partial run.

If anything is flagged **CHANGED**, summarise what likely shifted, advise the user to re-verify the
dependent reference files against the source, and offer to refresh them. Also review the official
MeitY DPDP Rules page for newly published notifications: the hash checker can detect changes only
at URLs already in the lock file. Then report the overall status and date of the check.
