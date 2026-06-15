---
description: Audit this app/codebase for India DPDP Act 2023 + Rules 2025 compliance
argument-hint: "[path or scope — e.g. . | ./api | \"the signup + analytics flow\"]"
---

Use the **dpdp-india** skill to run a Digital Personal Data Protection (India) compliance audit.

Target: **$ARGUMENTS** (if empty, audit the current repository / working directory).

Follow the skill's four-pass method: (1) scope the system and build a quick personal-data
inventory; (2) work through `references/audit-checklist.md` dimension by dimension; (3) gather
real `file:line` evidence using `references/code-patterns.md`; (4) produce the report in the
skill's output format — verdict, risk table, findings ordered by severity, top 3 risks, what to
confirm with counsel, and the disclaimer. Cite DPDP sections/rules for every finding and name the
template that closes each gap. Do not assert a gap you have not looked for.
