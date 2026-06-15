# Changelog

All notable changes to this project are documented here. Format loosely follows
[Keep a Changelog](https://keepachangelog.com/); this project uses semantic versioning.

## [1.0.0] — 2026-06-15

First release. India is the first jurisdiction in the `gattyworks-compliance` skill family.

### Added
- **`dpdp-india` skill** (`SKILL.md`) — four-pass audit playbook for the DPDP Act 2023 + Rules 2025,
  portable to Claude Code and any AI harness.
- **Audit engine** — `audit-checklist.md` (section-by-section, severity mapped to penalty exposure)
  and `code-patterns.md` (ripgrep detection patterns for evidence-gathering).
- **Legal references** distilled from primary text — `act-2023.md`, `rules-2025.md`,
  `penalties-schedule.md`, `consent-notice.md`, `fiduciary-obligations.md`,
  `data-principal-rights.md`, `gdpr-comparison.md`, `legal-context.md`.
- **13 policy templates** (paraphrased, attributed) under `references/templates/`.
- **Commands** — `/dpdp-audit`, `/dpdp-update-check`.
- **Update checker** — `check-updates.py` / `.ps1` / `.sh` with a pinned `sources.lock.json`
  (MeitY Act PDF, DPDP Rules, dpdpa.com, dpdpa.in, L&W comparison).
- **Marketplace + plugin manifests**, branding (banner, logo, social preview), and full community
  health files (README, CONTRIBUTING, SECURITY, CODE_OF_CONDUCT, LICENSE).

### Notes
- DPDP Rules 2025 notified 13 Nov 2025 (G.S.R. 846(E)); substantive obligations phase in by ~2027.
- Sources verified 2026-06-15. Engineering aid, not legal advice — see the disclaimer.
