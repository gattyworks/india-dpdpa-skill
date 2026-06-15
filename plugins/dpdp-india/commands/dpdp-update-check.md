---
description: Check whether the DPDP Act/Rules/templates sources changed since this skill was pinned
argument-hint: ""
---

Run the dpdp-india update checker to detect upstream legal changes:

```
python "${CLAUDE_PLUGIN_ROOT}/scripts/check-updates.py"
```

If `python` is unavailable, use the platform variant in `${CLAUDE_PLUGIN_ROOT}/scripts/`
(`check-updates.ps1` on Windows, `check-updates.sh` on macOS/Linux).

The script re-fetches the pinned sources in `scripts/sources.lock.json`, compares content hashes,
and reports any that changed (the law commences in phases, so sources do move). If anything is
flagged **CHANGED**, summarise what likely shifted, advise the user to re-verify the affected
reference files against the source, and offer to refresh them. Then report the overall status
(all current vs. N sources changed) and the date of the check.
