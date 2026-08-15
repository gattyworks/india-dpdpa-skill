---
description: Audit this app/codebase for India DPDP Act 2023 + Rules 2025 compliance
argument-hint: "[path or scope - e.g. . | ./api | \"the signup + analytics flow\"]"
---

Use the **dpdpa-india** skill to run a Digital Personal Data Protection (India) compliance audit.

Target: **$ARGUMENTS** (if empty, audit the current repository / working directory).

Before evaluating controls, record the audit date, source baseline, system scope, and whether the
report is a **current-obligation audit** or a **full-readiness audit**. If the user did not choose,
use full-readiness mode and keep future-phase items labelled `Readiness gap`, not `Non-compliant`.

Follow the skill's four-pass method: (1) scope the system and build a quick personal-data
inventory; (2) work through `references/audit-checklist.md` dimension by dimension; (3) gather
real `file:line` evidence using `references/code-patterns.md`; (4) produce the report in
`references/report-format.md`. Include the verdict, separate severity and status summaries,
findings ordered by severity, top 3 risks, items to confirm with counsel, and the disclaimer. Cite
DPDP sections/rules for every finding and name the artifact that closes each gap. Do not assert a
gap you have not looked for, and do not turn missing repository evidence into a factual claim
about off-repository operations.
