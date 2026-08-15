# Staying current

The source checker detects changes to known URLs. A maintainer must still look for newly published
notifications and review the dependent legal text.

Last baseline check: 2026-08-15. Engineering aid, not legal advice.

## Run the checker

From the repository root:

```bash
python plugins/dpdpa-india/scripts/check-updates.py
```

Platform variants:

| Script | Runtime |
|---|---|
| `check-updates.py` | Python 3, standard library only |
| `check-updates.ps1` | PowerShell |
| `check-updates.sh` | Bash, curl, jq; `--json` uses Python 3 |

All variants use
[`sources.lock.json`](../plugins/dpdpa-india/scripts/sources.lock.json).

## Status and exit codes

| Status | Meaning |
|---|---|
| `OK` | The live hash matches the baseline, or a secondary page is reachable |
| `CHANGED` | The live bytes differ |
| `ERROR` | The source could not be checked |
| `BASELINE` | A hash-checked source has no stored hash |

| Exit | Meaning |
|---|---|
| 0 | All sources match, or a requested update completed |
| 1 | At least one source changed |
| 2 | Currentness is unknown because at least one source failed |

Fetch errors fail the check. The scripts do not report `all current` when a source is unreachable.

## What is pinned

The lock file includes:

- the DPDP Act 2023;
- the final DPDP Rules 2025;
- the December 2025 corrigendum;
- the Act commencement notification;
- Board establishment and member-count notices;
- the May 2026 Board recruitment notice;
- the GDPR comparison; and
- secondary template and cross-check pages.

The `feeds` field lists the references that depend on each source.

## What the checker cannot do

A new notification normally gets a new URL. Hashing the old URLs will not discover it. A monthly
maintenance run must also inspect the official
[MeitY DPDP Rules page](https://www.meity.gov.in/documents/act-and-policies/digital-personal-data-protection-rules-2025-gDOxUjMtQWa).

Also check relevant sector regulators when an audit covers payments, health, telecom, insurance,
securities, or another regulated activity.

## Update runbook

1. Run the checker without `--update`.
2. Open every changed primary source.
3. Compare the source with each file in its `feeds` list.
4. Search the official MeitY page for new documents.
5. Update the legal references and their reviewed dates.
6. Run repository checks.
7. Re-pin with `--update`.
8. Review the resulting diff before commit.

```bash
python plugins/dpdpa-india/scripts/check-updates.py --update
```

The checker refuses a partial update if any source fails. Do not re-pin a changed source before you
understand the change.

## Suggested schedule

Run the check monthly, before each release, and when MeitY or the Board publishes a DPDPA update.
The current repository has no scheduled workflow, so this remains a maintainer task until CI is
added.

See [Legal sources and provenance](legal-and-provenance.md) for source ownership.
