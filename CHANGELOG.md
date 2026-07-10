# Changelog

All notable changes to this project are documented here. The format follows
[Keep a Changelog](https://keepachangelog.com/), and the project uses
[semantic versioning](https://semver.org/).

## [Unreleased]

### Changed
- README banner replaced with the org-wide pixel mascot banner (Kavach, a
  tricolor shield). Removed the old `assets/banner-dark.png`,
  `banner-light.png`, `banner-dark.svg`, `banner-light.svg`, and the
  now-purposeless `assets/banner.html` proofing page. `assets/logo.*` and
  `assets/social-preview.*` are untouched. See `DESIGN.md` for the
  rationale.

### Fixed
- The mascot banner initially used a light/dark `picture`/`source` block
  with absolute raw.githubusercontent.com URLs, which return 404 for this
  repo because it is private and that CDN requires authentication. Switched
  to a single static `.github/banner-dark.svg` referenced by a plain
  relative `img src`, the pattern GitHub actually resolves for private-repo
  images. Light/dark switching is dropped as a result.

## [1.0.0] - 2026-06-15

First release. India (`india-dpdpa-skill`) is the first jurisdiction in the
`gattyworks-compliance` skill family. A portable Claude Code plugin and AI skill that audits an
app, codebase, or data flow against the Digital Personal Data Protection Act, 2023 (the DPDP Act,
also written DPDPA) and the DPDP Rules, 2025.

### Audit skill and engine
- `dpdpa-india` skill (`SKILL.md`): a four-pass audit playbook (scope, checklist, evidence, report),
  portable to Claude Code and any harness that reads `SKILL.md` plus references.
- `audit-checklist.md`: the section-by-section engine, dimensions A-J, each item mapped to a DPDP
  section or rule, with severity tied to penalty exposure. The check IDs (A1 ... J5) are the
  canonical issue catalog.
- `code-patterns.md`: ripgrep detection patterns for gathering `file:line` evidence.
- `report-format.md`: the output contract. Every audit returns the same structure, severity levels
  (Critical, High, Medium, Low), statuses, finding fields, and issue IDs, with a worked example, so
  runs are consistent and comparable.

### Legal references
- Distilled from primary text: `act-2023.md`, `rules-2025.md`, `penalties-schedule.md`,
  `consent-notice.md`, `fiduciary-obligations.md`, `data-principal-rights.md`, `gdpr-comparison.md`,
  and `legal-context.md`. Each carries a dated source header.
- 13 policy templates under `references/templates/` (paraphrased and attributed, not mirrored).

### Tooling
- `/dpdpa-audit` and `/dpdpa-update-check` commands.
- Update checker (`check-updates.py` / `.ps1` / `.sh`) with a pinned, hash-verified
  `sources.lock.json` (MeitY Act PDF, DPDP Rules, dpdpa.com, dpdpa.in, the GDPR comparison PDF).

### Docs and packaging
- `docs/`: architecture, audit method, reference library, usage, staying current, extending,
  legal and provenance, FAQ, and an index.
- Marketplace and plugin manifests; full community health files (README, CONTRIBUTING, SECURITY,
  CODE_OF_CONDUCT, LICENSE, CLAUDE.md).
- Branding: light and dark banners in the GattyWorks house style, with the GattyWorks monogram
  watermark and an Ashoka Chakra mark; logo and social preview.

### Conventions
- Branded as DPDPA (repo `india-dpdpa-skill`); legal references keep the precise statutory forms
  ("DPDP Act", "DPDP Rules").
- House style: brief responses, plain ASCII punctuation, no en or em dashes.

### Notes
- DPDP Rules 2025 notified 13 Nov 2025 (G.S.R. 846(E)); substantive obligations phase in by ~2027.
- Sources verified 2026-06-15. Engineering aid, not legal advice. See the disclaimer.
