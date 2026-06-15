---
name: dpdp-india
description: >-
  Audit an application, codebase, product, or data flow for compliance with India's Digital
  Personal Data Protection Act, 2023 (DPDP Act) and the DPDP Rules, 2025. Use this skill
  whenever the user wants to check Indian data-protection / privacy compliance — phrases like
  "audit my app for DPDP", "is this DPDPA compliant", "Indian data protection / privacy audit",
  "DPDP / DPDPA / data fiduciary compliance", "do we handle Indian user data correctly",
  "consent / data retention / breach-notification compliance for India", "are we a Significant
  Data Fiduciary", or "what privacy policies / templates do we need for India". Ships the
  statutory text (Act + Rules), penalty schedule, data-principal rights, a section-by-section
  audit checklist, codebase detection patterns, GDPR↔DPDP mapping, and ready-reference policy
  templates. Trigger even if the user only says "privacy audit" while building for an Indian
  audience. Engineering aid, not legal advice.
---

# DPDP India Compliance Audit

Audit any build — web app, mobile app, backend, API, or data pipeline — against **India's Digital
Personal Data Protection Act, 2023** and the **DPDP Rules, 2025** (notified 13 Nov 2025, G.S.R.
846(E); substantive obligations phase in by ~2027). This skill turns the law into a concrete,
evidence-backed audit and points each gap at the fix.

> One country in a family of compliance skills. This one covers **India (DPDP)**.

## When this applies

DPDP reaches you if you process **digital personal data** and either (a) operate **in India**, or
(b) offer goods/services to **Data Principals in India** from anywhere (extraterritorial, §3). If
the app touches Indian users' personal data, audit it.

## How to run an audit

Work in four passes. Read references on demand — don't load everything up front.

**1. Scope the system.** Establish the facts the rest of the audit depends on:
- What **personal data** is collected/processed, and for what **purpose(s)**? (Build a quick data inventory.)
- Role: is the org a **Data Fiduciary** (decides purpose & means) or a **Data Processor** (acts for a fiduciary)? See [act-2023.md](references/act-2023.md) §2.
- Are **children (under 18)** in scope? (§9 — strict.)
- Could it be a **Significant Data Fiduciary** (high volume / sensitivity)? (§10, Rules.)
- Any **cross-border** transfer or third-party / processor sharing?

**2. Run the checklist.** Go dimension by dimension through
**[references/audit-checklist.md](references/audit-checklist.md)** — the core engine. Each item
cites its DPDP section/rule, tells you what compliant looks like, and maps to a penalty band.

**3. Find the evidence.** For a codebase, use
**[references/code-patterns.md](references/code-patterns.md)** — what to grep for (PII fields,
consent flows, retention jobs, breach handlers, third-party SDKs, cross-border endpoints, PII in
logs). Cite real `file:line` evidence for every finding; never assert a gap you haven't looked for.

**4. Report.** Use the output format below. For each gap, name the **template** that closes it
(e.g. a missing privacy notice → [templates/privacy-policy.md](references/templates/privacy-policy.md)).

## Output format

Lead with a one-line verdict and a risk summary table, then findings ordered by severity.

```
DPDP Audit — <system> (against DPDP Act 2023 + Rules 2025, verified 2026-06-15)
Verdict: <Materially compliant | Gaps found | Not assessed>

| # | Requirement (DPDP cite) | Status | Severity | Evidence | Fix |
|---|------------------------|--------|----------|----------|-----|
```

- **Status:** ✅ Compliant · ⚠️ Gap · ❓ Needs review (can't tell from code alone) · ➖ N/A.
- **Severity:** map to penalty exposure via [penalties-schedule.md](references/penalties-schedule.md).
  Security-safeguard failures (§8(5), up to **₹250 crore**) and children's-data breaches are **Critical**.
- **Evidence:** `path/to/file:line` or "not found in repo".
- **Fix:** the concrete change + the template/reference that specifies it.

Close with: top 3 risks, what to verify with counsel/ops (things not visible in code), and the
one-line disclaimer below.

## Reference map

| Need | Read |
|------|------|
| Section-by-section audit engine | [references/audit-checklist.md](references/audit-checklist.md) |
| What to grep for in a codebase | [references/code-patterns.md](references/code-patterns.md) |
| Full Act index + definitions | [references/act-2023.md](references/act-2023.md) |
| Consent & notice rules (§4–7) | [references/consent-notice.md](references/consent-notice.md) |
| Data Fiduciary duties (§8–10, 16) | [references/fiduciary-obligations.md](references/fiduciary-obligations.md) |
| Data Principal rights (§11–15) | [references/data-principal-rights.md](references/data-principal-rights.md) |
| Penalties (the Schedule) | [references/penalties-schedule.md](references/penalties-schedule.md) |
| DPDP Rules 2025 (operational detail) | [references/rules-2025.md](references/rules-2025.md) |
| GDPR ↔ DPDP gap mapping | [references/gdpr-comparison.md](references/gdpr-comparison.md) |
| Puttaswamy / IT Act / CERT-In context | [references/legal-context.md](references/legal-context.md) |
| Policy/template artifacts a build needs | [references/templates/README.md](references/templates/README.md) |

## Staying current

Law changes; phased commencement is ongoing. Before relying on an audit, run the update check to
see whether the upstream sources have moved since this skill was pinned:

```
python "${CLAUDE_PLUGIN_ROOT}/scripts/check-updates.py"
```

(Cross-platform `.ps1` and `.sh` variants sit alongside it. See [scripts/](scripts/).)

---

<sub>This skill is an engineering aid for finding likely compliance gaps; it is **not legal advice**
and does not create a lawyer–client relationship. Always run your own audit and have a qualified
Indian data-protection practitioner review before you rely on any result. Provided "as is" — see the
repository disclaimer.</sub>
