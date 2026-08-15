---
name: dpdpa-india
description: >-
  Audit an application, codebase, product, or data flow for compliance with India's Digital
  Personal Data Protection Act, 2023 (DPDP Act) and the DPDP Rules, 2025. Use this skill
  whenever the user wants to check Indian data-protection / privacy compliance - phrases like
  "audit my app for DPDP", "is this DPDPA compliant", "Indian data protection / privacy audit",
  "DPDP / DPDPA / data fiduciary compliance", "do we handle Indian user data correctly",
  "consent / data retention / breach-notification compliance for India", "are we a Significant
  Data Fiduciary", or "what privacy policies / templates do we need for India". Ships the
  statutory text (Act + Rules), penalty schedule, data-principal rights, a section-by-section
  audit checklist, codebase detection patterns, GDPR vs DPDP mapping, and ready-reference policy
  templates. Trigger even if the user only says "privacy audit" while building for an Indian
  audience. Engineering aid, not legal advice.
---

# DPDP India Compliance Audit

Audit any build - web app, mobile app, backend, API, or data pipeline - against **India's Digital
Personal Data Protection Act, 2023** and the **DPDP Rules, 2025** (notified 13 Nov 2025, G.S.R.
846(E), with a corrigendum in December 2025). This skill turns the law into a concrete,
evidence-backed audit and points each gap at the fix.

## Check the legal phase first

Read [references/rules-2025.md](references/rules-2025.md) before scoring. As of 2026-08-15, most product-facing duties are notified but remain in the eighteen-month phase. Act 6(9), 27(1)(d), and Rule 4 enter the one-year phase. Board and listed administrative provisions are already in force.

Use **Current compliance** mode for in-force duties. Use **Readiness** mode for notified duties whose phase has not started. Never call a readiness gap a current violation.

## When this applies

DPDP reaches you if you process **digital personal data** and either (a) operate **in India**, or
(b) offer goods/services to **Data Principals in India** from anywhere (extraterritorial, 3). If
the app touches Indian users' personal data, audit it.

## How to run an audit

Work in four passes. Read references on demand - don't load everything up front.

**1. Scope the system.** Establish the facts the rest of the audit depends on:
- What **personal data** is collected/processed, and for what **purpose(s)**? (Build a quick data inventory.)
- Role: is the org a **Data Fiduciary** (decides purpose & means) or a **Data Processor** (acts for a fiduciary)? See [act-2023.md](references/act-2023.md) 2.
- Are **children (under 18)** in scope? (9 - strict.)
- Could it be a **Significant Data Fiduciary** (high volume / sensitivity)? (10, Rules.)
- Any **cross-border** transfer or third-party / processor sharing?

**2. Run the checklist.** Go dimension by dimension through
**[references/audit-checklist.md](references/audit-checklist.md)** - the core engine. Each item
cites its DPDP section/rule, tells you what compliant looks like, and maps to a penalty band.

**3. Find the evidence.** For a codebase, use
**[references/code-patterns.md](references/code-patterns.md)** - what to grep for (PII fields,
consent flows, retention jobs, breach handlers, third-party SDKs, cross-border endpoints, PII in
logs). Cite real `file:line` evidence for every finding; never assert a gap you haven't looked for.

**4. Report.** Use the output format below. For each gap, name the **template** that closes it
(e.g. a missing privacy notice -> [templates/privacy-policy.md](references/templates/privacy-policy.md)).

## Output format

Report **exactly** per **[references/report-format.md](references/report-format.md)** - the output
contract that fixes the structure, severity levels, statuses, finding fields, and the canonical
issue IDs, so every audit returns the same fields and the same issues. In brief:

```
DPDPA Audit - <system>
Audit date: <YYYY-MM-DD> | Legal-source baseline: 2026-08-15
Mode: <Current compliance | Readiness>
Verdict: <Materially compliant | Gaps found | Readiness gaps found | Not assessed>

| ID | Requirement (cite) | Status | Severity | Evidence | Fix |
|----|--------------------|--------|----------|----------|-----|
```

- **ID:** the catalog ID from [audit-checklist.md](references/audit-checklist.md) (A1 ... J5), never invented.
- **Status:** ✅ Compliant / ⚠️ Gap / ~ Readiness gap / ❓ Needs review (can't tell from code alone) / ➖ N/A.
- **Severity:** Critical / High / Medium / Low, mapped to penalty exposure and harm via [penalties-schedule.md](references/penalties-schedule.md). Security-safeguard failures, breach-notice failures, and children's-data duties are **Critical**.
- **Evidence:** `path/to/file:line`, or "not found".
- **Fix:** the concrete change + the template/reference that closes it.

Write for a non-lawyer. Each gap's detail must state, in plain language: **what it is**, the **fix**,
and **what happens if unfixed** (the penalty exposure and the real-world risk). Close with the
risk-summary counts, those gap details, the top 3 risks, what to confirm with counsel/ops (things
not visible in code), and the one-line disclaimer below.

## Reference map

| Need | Read |
|------|------|
| Section-by-section audit engine | [references/audit-checklist.md](references/audit-checklist.md) |
| The report format (fields, levels, issue IDs) | [references/report-format.md](references/report-format.md) |
| What to grep for in a codebase | [references/code-patterns.md](references/code-patterns.md) |
| Full Act index + definitions | [references/act-2023.md](references/act-2023.md) |
| Consent & notice rules (4-7) | [references/consent-notice.md](references/consent-notice.md) |
| Data Fiduciary duties (8-10, 16) | [references/fiduciary-obligations.md](references/fiduciary-obligations.md) |
| Data Principal rights (11-15) | [references/data-principal-rights.md](references/data-principal-rights.md) |
| Penalties (the Schedule) | [references/penalties-schedule.md](references/penalties-schedule.md) |
| DPDP Rules 2025 (operational detail) | [references/rules-2025.md](references/rules-2025.md) |
| GDPR vs DPDP gap mapping | [references/gdpr-comparison.md](references/gdpr-comparison.md) |
| Puttaswamy / IT Act / CERT-In context | [references/legal-context.md](references/legal-context.md) |
| Policy/template artifacts a build needs | [references/templates/README.md](references/templates/README.md) |

## Staying current

Law changes; phased commencement is ongoing. Before relying on an audit, run the update check to
see whether the upstream sources have moved since this skill was pinned:

Run the bundled [source checker](scripts/check-updates.py) before relying on an audit. Resolve the
path from this `SKILL.md` file, then run `python <skill-directory>/scripts/check-updates.py`.

For a direct repository checkout, run
`python plugins/dpdpa-india/skills/dpdpa-india/scripts/check-updates.py` from the repository root.
Cross-platform `.ps1` and `.sh` variants sit beside the Python checker.

---

<sub>This skill is an engineering aid for finding likely compliance gaps; it is **not legal advice**
and does not create a lawyer-client relationship. Always run your own audit and have a qualified
Indian data-protection practitioner review before you rely on any result. Provided "as is" - see the
repository disclaimer.</sub>
