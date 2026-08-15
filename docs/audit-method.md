# The four-pass audit method

The skill runs every audit in four passes: **Scope -> Run the checklist -> Find the evidence -> Report.** The order is deliberate - each pass depends on facts the previous one established. References load on demand, not all up front.

This is an engineering aid for finding likely compliance gaps. It is not legal advice. Have a qualified Indian data-protection practitioner review anything before you rely on it.

Legal-source baseline checked 2026-08-15 against the **DPDP Act 2023**, final **DPDP Rules 2025**, the December 2025 corrigendum, and the Act commencement notification.

## Preflight - choose the audit mode

Read the phase table in [`rules-2025.md`](../plugins/dpdpa-india/skills/dpdpa-india/references/rules-2025.md). Use `Current compliance` for in-force duties. Use `Readiness` for notified duties whose phase has not started. As of 2026-08-15, most product-facing checks are readiness checks.

---

## Pass 1 - Scope the system

Establish the facts the rest of the audit hangs on. Skipping this produces findings against the wrong obligations.

| Question | Why it matters | Where to confirm |
|---|---|---|
| What **personal data** is collected/processed, and for what **purpose(s)**? | Builds the data inventory that drives dimension A and the evidence pass. | [../plugins/dpdpa-india/skills/dpdpa-india/references/code-patterns.md](../plugins/dpdpa-india/skills/dpdpa-india/references/code-patterns.md) 1 |
| Is the org a **Data Fiduciary** (decides purpose & means) or a **Data Processor** (acts for a fiduciary)? | Determines which 8 duties land on you vs. your customer. | Act 2 |
| Are **children (under 18)** in scope? | 9 is strict - verifiable parental consent, no behavioural tracking, no targeted ads. | Act 9 |
| Could it be a **Significant Data Fiduciary** (high volume / sensitivity)? | Triggers the 10 extras (India-based DPO, independent audit, DPIA). | Act 10 + Rules |
| Any **cross-border** transfer or third-party / processor sharing? | Pulls in 16 and the notified restricted-country list. | Act 16 + Rules |

DPDP reaches a system if it processes digital personal data and either operates **in India** or offers goods/services to **Data Principals in India** from anywhere (extraterritorial, 3). If the app touches Indian users' personal data, it is in scope.

The output of this pass is a quick data inventory: **category, storage, purpose, and recipients**. Build it from the section 1 searches in `code-patterns.md`.

---

## Pass 2 - Run the checklist

The checklist in [../plugins/dpdpa-india/skills/dpdpa-india/references/audit-checklist.md](../plugins/dpdpa-india/skills/dpdpa-india/references/audit-checklist.md) is the core engine. It is organised into ten dimensions, A through J. Each item carries a check, a description of what compliant looks like, the DPDP section/rule it cites, and a default severity.

| Dim | Area | Anchored in |
|---|---|---|
| A | Lawful basis & purpose | 4, 7 |
| B | Notice & consent | 5, 6 + Rules |
| C | Data Fiduciary security & duties | 8 + Rule 6 |
| D | Breach handling | 8(6) + Rule 7 |
| E | Children's data | 9 |
| F | Data Principal rights | 11-14 |
| G | Significant Data Fiduciary extras | 10 + Rules |
| H | Cross-border transfer | 16 + Rules |
| I | Retention & erasure | 8(7)-(8) + Rule 8 / Third Schedule |
| J | Governance & documentation | mixed |

Every item maps to a section or rule, so a finding is never a vibe - it points at the specific obligation. Examples from the checklist:

- **B3** (free, specific, informed, unconditional, and unambiguous consent with an affirmative action) maps to 6(1) and is rated **High**.
- **C1** (reasonable security safeguards) -> 8(5), the **₹250 crore** band, **Critical**.
- **D3** (notify the Board - initial intimation without delay, detailed report within **72 hours**) -> Rule 7, **Critical**.
- **I3** (3-year inactivity erasure for specified classes - e-commerce ≥2 cr users, online gaming ≥50 lakh, social media ≥2 cr - with **48-hour pre-erasure notice**) -> Rule 8 / Third Schedule.

For each item, decide a status (next section), cite evidence, and carry the severity into the report.

---

## Pass 3 - Find the evidence

For a codebase, gather real `file:line` evidence using [../plugins/dpdpa-india/skills/dpdpa-india/references/code-patterns.md](../plugins/dpdpa-india/skills/dpdpa-india/references/code-patterns.md). It gives `ripgrep` patterns per dimension - PII fields, consent flows, retention jobs, breach handlers, third-party SDKs, cross-border endpoints, and PII in logs.

Two rules govern this pass:

1. **A match is a lead, not a verdict.** Read the surrounding code before scoring an item. A hit on `consent` proves the word exists, not that consent is captured correctly.
2. **Absence is evidence only after a scoped search.** If a required repository control is not found after checking the relevant paths, record `not found`. If the control can live in operations, contracts, or another system, use `Needs review` until a person confirms it.

Never assert a gap you have not looked for. Every code finding is paired with the checklist item it satisfies or violates and the section cite behind it. Evidence is recorded as `path/to/file:line` - or literally **"not found in repo"** when the control is absent.

---

## Pass 4 - Report

Lead with a one-line verdict and a risk summary table, then findings ordered by severity. The exact format:

```
DPDPA Audit - <system>
Audit date: <YYYY-MM-DD> | Legal-source baseline: <YYYY-MM-DD>
Mode: <Current compliance | Readiness>
Verdict: <Materially compliant | Gaps found | Readiness gaps found | Not assessed>

| ID | Requirement (DPDP cite) | Status | Severity | Evidence | Fix |
|---|------------------------|--------|----------|----------|-----|
```

**Verdict line** is one of: `Materially compliant`, `Gaps found`, or `Not assessed`.

**Risk table columns:**

| Column | Holds |
|---|---|
| `ID` | The checklist item id (e.g. C1, B3, I3). |
| Requirement (DPDP cite) | The check plus its section/rule. |
| Status | One of the four icons below. |
| Severity | C / H / M / L, mapped to penalty exposure. |
| Evidence | `path/to/file:line`, or `not found in repo`. |
| Fix | The concrete change + the template/reference that specifies it. |

**Status icons:**

| Icon | Meaning |
|---|---|
| ✅ | Compliant |
| ⚠️ | Gap |
| ~ | Readiness gap (not yet in force on the audit date) |
| ❓ | Needs review (can't tell from code alone) |
| ➖ | N/A |

**Severity scale** - `C`ritical, `H`igh, `M`edium, `L`ow - maps to penalty exposure via [../plugins/dpdpa-india/skills/dpdpa-india/references/penalties-schedule.md](../plugins/dpdpa-india/skills/dpdpa-india/references/penalties-schedule.md). Security-safeguard failures (8(5)) and children's-data breaches are always **Critical**.

### Severity -> penalty exposure

The severity is not arbitrary; it tracks the Schedule's caps (each figure is a "may extend to" maximum - the Board sets the actual amount using the 33(2) factors).

| Breach | Section | Cap | Default severity |
|---|---|---|---|
| Reasonable security safeguards (breach prevention) | 8(5) | **₹250 cr** | Critical |
| Failure to notify breach (Board / affected Principals) | 8(6) | **₹200 cr** | Critical |
| Children's-data obligations | 9 | **₹200 cr** | Critical |
| SDF obligations | 10 | **₹150 cr** | High |
| Residuary (any other provision/rule) | - | **₹50 cr** | High / Medium |
| Data Principal duties | 15 | **₹10,000** | Low |

Close the report with the **top 3 risks**, **what to verify with counsel/ops** (things not visible in code), and the one-line not-legal-advice disclaimer.

### Worked example (illustrative)

The fragment below is **illustrative only** - it shows the rendered table format, not a real audit.

```
DPDPA Audit - acme-shop
Audit date: 2026-08-15 | Legal-source baseline: 2026-08-15
Mode: Readiness
Verdict: Readiness gaps found
```

| ID | Requirement (DPDP cite) | Status | Severity | Evidence | Fix |
|---|---|---|---|---|---|
| C1 | Reasonable security safeguards (8(5)) | ~ | C | `src/auth/user.js:42` (MD5 password hashing) | Move to argon2/bcrypt; encrypt at rest + in transit per Rule 6 |
| B3 | Consent by affirmative action (6(1)) | ~ | H | `web/signup.tsx:88` (`defaultChecked` consent box) | Remove pre-tick; use an unticked consent action |
| D3 | Notify Board within 72h (Rule 7) | ❓ | C | not found in repo | Add breach handler + runbook; confirm process with ops |
| F2 | Right to correction/erasure (12) | ✅ | H | `api/account/delete.ts:15` | - |
| I3 | 3-year inactivity erasure (Rule 8 / Third Sch.) | ➖ | H | below scale thresholds | N/A unless user counts cross the Third-Schedule thresholds |

---

## Quick triage

When time-boxed, work the highest-exposure failures first, in this fixed order (from the checklist's "Quick triage" block):

1. **C1** - security safeguards (₹250 cr).
2. **E1-E4** - children's data.
3. **D2-D3** - breach notice (affected Principals + Board within 72h).
4. **B3 / B5** - consent quality & withdrawal.
5. **C4 / I2** - erasure on withdrawal / purpose-end.
6. **F1-F3** - Data Principal rights.

Clear these before the rest. They concentrate the Critical-band penalty exposure, so a partial audit that covers them still de-risks the system meaningfully.

---

## See also

- [Reference library](reference-library.md) - the full map of statutory text, checklists, and templates.
- [Usage](usage.md) - invoking the skill and reading its output.
