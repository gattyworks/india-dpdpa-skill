# Changelog

All notable changes to this project are documented here. The format follows
[Keep a Changelog](https://keepachangelog.com/), and the project uses
[semantic versioning](https://semver.org/).

## [Unreleased]

### Added
- Renamed the plugin and skill from `dpdp-india` to `dpdpa-india`. This is a breaking path and
  command change from v1.0.0.
- A fixed report contract with canonical IDs A1 to J5.
- The full `docs/` guide, repository house rules, and current design sources.
- A Codex repository entry point under `.agents/skills/dpdpa-india/` that delegates to the
  canonical playbook.
- Official source pins for the final Rules, corrigendum, commencement notification, Board
  establishment, Board member-count notice, and 2026 Board recruitment notice.
- A readiness status and audit mode for notified duties that are not yet in force.

### Changed
- The repository documentation now describes the public source, install path, and project-audit boundary.
- The audit contract now separates current compliance gaps from readiness gaps.
- The Rules reference now uses exact rule numbers and primary MeitY sources.
- The legacy `dpdpa-guide/` now points to the canonical skill and no longer claims a DPDPA data
  portability right or unconditional deletion of every copy.
- The README uses the project banner at `design/banner.svg`. The old `assets/` and `.github/`
  banner variants remain removed.

### Fixed
- The source checker now treats fetch errors as an incomplete check, exits with code 2, and refuses
  partial `--update` writes.
- The shell checker now fails on HTTP errors and implements `--json` through the canonical Python
  checker.
- Corrected penalty-range, child-consent, SDF, transfer, and Rule 8 descriptions that overstated
  or generalised the final Rules.

## [1.0.0] - 2026-06-15

First release. It shipped the `dpdp-india` Claude Code plugin and portable skill.

### Added
- A four-pass audit playbook for scope, checklist, evidence, and report.
- The A to J audit checklist and code-evidence patterns.
- Act, Rules, penalties, consent, Fiduciary, rights, GDPR, and legal-context references.
- 13 paraphrased policy-artifact specifications.
- `/dpdp-audit` and `/dpdp-update-check`.
- Python, PowerShell, and shell source-check scripts.
- Claude marketplace packaging, branding, and repository health files.

### Notes
- The v1.0.0 tag uses the old `dpdp-india` path and command names.
- The source set was reviewed on 2026-06-15. Engineering aid, not legal advice.
