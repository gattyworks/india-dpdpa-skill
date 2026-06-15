# Staying current

The DPDP regime is a moving target. The skill bakes its legal conclusions into versioned reference files; this page explains the tooling that tells you when those files have drifted from their upstream sources, and the runbook for re-pinning them.

This is an engineering aid, not legal advice. The checker flags *that* a source moved - a human still re-verifies *what* changed.

## Why it exists

The DPDP Act 2023 (Act 22 of 2023) commences in phases, and the DPDP Rules 2025 were notified only on 13 Nov 2025 (G.S.R. 846(E)). Provisions switch on over time, government PDFs get re-hosted, and the secondary sites the skill cross-references against re-render their HTML constantly. A reference file that was accurate when pinned can silently fall out of date.

`check-updates` is the early-warning system: it re-fetches every source the skill was built from and tells you whether the bytes still match what was verified.

## How the checker works

Each variant performs the same loop over the sources pinned in [`sources.lock.json`](../plugins/dpdpa-india/scripts/sources.lock.json):

1. Issue a single HTTP GET to the pinned `url` (browser User-Agent, 45s timeout).
2. Compute the SHA-256 of the response body.
3. Compare against the stored `sha256` and assign a status.

| Status | Meaning |
|---|---|
| `OK` | Live hash matches the pinned hash. Source unchanged. |
| `CHANGED` | Live hash differs. The reference files fed by this source may be stale. |
| `ERROR` | Fetch failed (network, TLS, HTTP error, timeout). Non-fatal. |
| `BASELINE` | No hash was pinned yet (`sha256` is null). First-time capture. |

The process exits `1` if any source is `CHANGED`, and `0` otherwise. Errors alone do not fail the run - an unreachable host is treated as "retry / check network," not as drift. This makes `CHANGED` a clean signal for CI.

The User-Agent is a real browser string by design: some government / WAF-fronted hosts (such as `meity.gov.in`) return 403 to obvious bots.

### Privacy

The checker only issues GET requests to the public URLs in the lock file. It sends no user data, no telemetry, and no audit content; it stores nothing beyond the hashes you explicitly re-pin with `--update`. Nothing about the codebase being audited ever leaves the machine.

## The lock file

[`sources.lock.json`](../plugins/dpdpa-india/scripts/sources.lock.json) is the single source of truth. It has a top-level `verified` date (the day the hashes were last confirmed against re-verified reference files) and a `sources` array. Each source carries:

| Field | Purpose |
|---|---|
| `id` | Stable identifier used in output and `--update` matching. |
| `label` | Human-readable description. |
| `url` | The public URL fetched and hashed. |
| `type` | `pdf` or `html` (governs how to read a `CHANGED` result, below). |
| `sha256` | The pinned content hash (`null` until baselined). |
| `feeds` | Which reference `.md` files derive from this source - your re-verification worklist. |

### Pinned sources

| id | type | feeds |
|---|---|---|
| `act-2023-pdf` | pdf | act-2023.md, consent-notice.md, fiduciary-obligations.md, data-principal-rights.md, penalties-schedule.md |
| `lw-gdpr-comparison-pdf` | pdf | gdpr-comparison.md |
| `dpdpa-com-home` | html | templates/_site-map.md |
| `dpdpa-com-templates` | html | templates/*.md |
| `dpdpa-com-rules` | html | rules-2025.md |
| `dpdpa-com-mapping` | html | audit-checklist.md, rules-2025.md |
| `dpdpa-in-home` | html | rules-2025.md |

The two PDFs - the MeitY gazette of the Act and the Latham & Watkins DPDP-vs-GDPR comparison - are the authoritative, stable anchors. The `dpdpa.com` / `dpdpa.in` HTML pages are convenience indexes and cross-verification, not primary law.

## The three script variants

All three are functionally identical and share the lock file. Pick by what is already installed.

| Script | Runtime | Use when |
|---|---|---|
| [`check-updates.py`](../plugins/dpdpa-india/scripts/check-updates.py) | Python 3, stdlib only | Canonical. Default; works anywhere Python 3 is present. |
| [`check-updates.ps1`](../plugins/dpdpa-india/scripts/check-updates.ps1) | Windows PowerShell | Native Windows, no Python needed. |
| [`check-updates.sh`](../plugins/dpdpa-india/scripts/check-updates.sh) | bash + `curl` + `jq` | Native macOS/Linux. Falls back to `python3` if `jq` is absent; errors only if neither is present. |

The `/dpdpa-update-check` command ([`dpdpa-update-check.md`](../plugins/dpdpa-india/commands/dpdpa-update-check.md)) runs the Python variant via `${CLAUDE_PLUGIN_ROOT}` and points to the platform variants when `python` is unavailable.

All variants accept the same flags:

```
check-updates           # check and report; exit 1 if any CHANGED
check-updates --update  # re-pin current hashes (PowerShell: -Update)
check-updates --json    # machine-readable output
```

## PDF vs HTML changes

A `CHANGED` on an HTML source is frequently benign - ads, markup churn, rotating banners - and does not necessarily mean the law moved. Open the page and look for a substantive change before touching reference files.

A `CHANGED` on a PDF source is significant: the two gazette/comparison PDFs are stable anchors, so a hash change there means the document was genuinely re-issued or re-hosted and the dependent reference files almost certainly need re-verification.

## Re-pinning with --update

`--update` overwrites the stored hashes with whatever is live right now and stamps `verified` with today's date.

Run it **only after** you have re-verified the affected reference files against the source. Running `--update` blindly destroys the baseline - it tells the tool "this drift is now the accepted truth" without anyone having checked that it is.

The correct sequence is: investigate first, fix the `.md` files, then `--update` to lock in the new baseline.

## Runbook: a source is CHANGED

1. **Re-verify the feeds.** Read the `feeds` list for the changed source and open the upstream URL. Confirm what actually changed in the law or document (ignore benign HTML churn).
2. **Update the reference files.** Edit the affected `.md` files so the skill's conclusions match the current source.
3. **Re-pin.** Run the checker with `--update` to capture the new hashes and bump the `verified` date.
4. **Release.** Bump the plugin/skill version and cut a release so consumers pick up the corrected references.

## Suggested cadence

Run a check at least monthly, and immediately whenever you hear of a phased commencement or a new Rules notification. A scheduled CI job keeps it honest - the non-zero exit on `CHANGED` makes failure automatic:

```yaml
# .github/workflows/dpdp-source-check.yml
on:
  schedule:
    - cron: "0 6 1 * *"   # 06:00 UTC on the 1st of each month
  workflow_dispatch:
jobs:
  check:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - run: python plugins/dpdpa-india/scripts/check-updates.py
```

A failed run is the prompt to walk the runbook above. Sources verified 2026-06-15.

## See also

- [Extending the skill](extending.md)
- [Legal sourcing and provenance](legal-and-provenance.md)
