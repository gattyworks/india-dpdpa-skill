# The four-pass audit method

The skill runs every audit in four passes: **Scope → Run the checklist → Find the evidence → Report.** The order is deliberate - each pass depends on facts the previous one established. References load on demand, not all up front.

This is an engineering aid for finding likely compliance gaps. It is not legal advice. Have a qualified Indian data-protection practitioner review anything before you rely on it.

Sources verified 2026-06-15, against the **DPDP Act 2023** (Act 22 of 2023) and the **DPDP Rules 2025** (notified 13 Nov 2025, G.S.R. 846(E)).

---

## Pass 1 - Scope the system

Establish the facts the rest of the audit hangs on. Skipping this produces findings against the wrong obligations.

| Question | Why it matters | Where to confirm |
|---|---|---|
| What **personal data** is collected/processed, and for what **purpose(s)**? | Builds the data inventory that drives dimension A and the evidence pass. | [../plugins/dpdpa-india/skills/dpdpa-india/references/code-patterns.md](../plugins/dpdpa-india/skills/dpdpa-india/references/code-patterns.md) §1 |
| Is the org a **Data Fiduciary** (decides purpose & means) or a **Data Processor** (acts for a fiduciary)? | Determines which §8 duties land on you vs. your customer. | Act §2 |
| Are **children (under 18)** in scope? | §9 is strict - verifiable parental consent, no behavioural tracking, no targeted ads. | Act §9 |
| Could it be a **Significant Data Fiduciary** (high volume / sensitivity)? | Triggers the §10 extras (India-based DPO, independent audit, DPIA). | Act §10 + Rules |
| Any **cross-border** transfer or third-party / processor sharing? | Pulls in §16 and the notified restricted-country list. | Act §16 + Rules |

DPDP reaches a system if it processes digital personal data and either operates **in India** or offers goods/services to **Data Principals in India** from anywhere (extraterritorial, §3). If the app touches Indian users' personal data, it is in scope.

The output of this pass is a quick data inventory - **category → where stored → purpose → shared with** - assembled from the §1 grep patterns in code-patterns.md.

---

## Pass 2 - Run the checklist

The checklist in [../plugins/dpdpa-india/skills/dpdpa-india/references/audit-checklist.md](../plugins/dpdpa-india/skills/dpdpa-india/references/audit-checklist.md) is the core engine. It is organised into ten dimensions, A through J. Each item carries a check, a description of what compliant looks like, the DPDP section/rule it cites, and a default severity.

| Dim | Area | Anchored in |
|---|---|---|
| A | Lawful basis & purpose | §4, §7 |
| B | Notice & consent | §5, §6 + Rules |
| C | Data Fiduciary security & duties | §8 + Rule 6 |
| D | Breach handling | §8(6) + Rule 7 |
| E | Children's data | §9 |
| F | Data Principal rights | §11-14 |
| G | Significant Data Fiduciary extras | §10 + Rules |
| H | Cross-border transfer | §16 + Rules |
| I | Retention & erasure | §8(7)-(8) + Rule 8 / Third Schedule |
| J | Governance & documentation | mixed |

Every item maps to a section or rule, so a finding is never a vibe - it points at the specific obligation. Examples from the checklist:

- **B3** (free/specific/informed/unconditional/unambiguous consent - affirmative action, no pre-ticked or bundled boxes) → §6(1), rated **Critical**.
- **C1** (reasonable security safeguards) → §8(5), the **₹250 crore** band, **Critical**.
- **D3** (notify the Board - initial intimation without delay, detailed report within **72 hours**) → Rule 7, **Critical**.
- **I3** (3-year inactivity erasure for specified classes - e-commerce ≥2 cr users, online gaming ≥50 lakh, social media ≥2 cr - with **48-hour pre-erasure notice**) → Rule 8 / Third Schedule.

For each item, decide a status (next section), cite evidence, and carry the severity into the report.

---

## Pass 3 - Find the evidence

For a codebase, gather real `file:line` evidence using [../plugins/dpdpa-india/skills/dpdpa-india/references/code-patterns.md](../plugins/dpdpa-india/skills/dpdpa-india/references/code-patterns.md). It gives `ripgrep` patterns per dimension - PII fields, consent flows, retention jobs, breach handlers, third-party SDKs, cross-border endpoints, and PII in logs.

Two rules govern this pass:

1. **A match is a lead, not a verdict.** Read the surrounding code before scoring an item. A hit on `consent` proves the word exists, not that consent is captured correctly.
2. **Absence of an expected control is itself a finding.** If a system plausibly needs a control and the grep returns nothing, that silence is the evidence. No consent table and no withdrawal route ⇒ B3/B5/B6 gaps. Hardcoded secrets, MD5/SHA1 password hashing, no TLS enforcement, or no authz layer ⇒ C1 Critical. No data-export and no account-deletion path ⇒ F1/F2 High.

Never assert a gap you have not looked for. Every code finding is paired with the checklist item it satisfies or violates and the section cite behind it. Evidence is recorded as `path/to/file:line` - or literally **"not found in repo"** when the control is absent.

---

## Pass 4 - Report

Lead with a one-line verdict and a risk summary table, then findings ordered by severity. The exact format:

```
DPDP Audit - <system> (against DPDP Act 2023 + Rules 2025, verified 2026-06-15)
Verdict: <Materially compliant | Gaps found | Not assessed>

| # | Requirement (DPDP cite) | Status | Severity | Evidence | Fix |
|---|------------------------|--------|----------|----------|-----|
```

**Verdict line** is one of: `Materially compliant`, `Gaps found`, or `Not assessed`.

**Risk table columns:**

| Column | Holds |
|---|---|
| `#` | The checklist item id (e.g. C1, B3, I3). |
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
| ❓ | Needs review (can't tell from code alone) |
| ➖ | N/A |

**Severity scale** - `C`ritical, `H`igh, `M`edium, `L`ow - maps to penalty exposure via [../plugins/dpdpa-india/skills/dpdpa-india/references/penalties-schedule.md](../plugins/dpdpa-india/skills/dpdpa-india/references/penalties-schedule.md). Security-safeguard failures (§8(5)) and children's-data breaches are always **Critical**.

### Severity → penalty exposure

The severity is not arbitrary; it tracks the Schedule's caps (each figure is a "may extend to" maximum - the Board sets the actual amount using the §33(2) factors).

| Breach | Section | Cap | Default severity |
|---|---|---|---|
| Reasonable security safeguards (breach prevention) | §8(5) | **₹250 cr** | Critical |
| Failure to notify breach (Board / affected Principals) | §8(6) | **₹200 cr** | Critical |
| Children's-data obligations | §9 | **₹200 cr** | Critical |
| SDF obligations | §10 | **₹150 cr** | High |
| Residuary (any other provision/rule) | - | **₹50 cr** | High / Medium |
| Data Principal duties | §15 | **₹10,000** | Low |

Close the report with the **top 3 risks**, **what to verify with counsel/ops** (things not visible in code), and the one-line not-legal-advice disclaimer.

### Worked example (illustrative)

The fragment below is **illustrative only** - it shows the rendered table format, not a real audit.

```
DPDP Audit - acme-shop (against DPDP Act 2023 + Rules 2025, verified 2026-06-15)
Verdict: Gaps found
```

| # | Requirement (DPDP cite) | Status | Severity | Evidence | Fix |
|---|---|---|---|---|---|
| C1 | Reasonable security safeguards (§8(5)) | ⚠️ | C | `src/auth/user.js:42` (MD5 password hashing) | Move to argon2/bcrypt; encrypt at rest + in transit per Rule 6 |
| B3 | Consent by affirmative action (§6(1)) | ⚠️ | C | `web/signup.tsx:88` (`defaultChecked` consent box) | Remove pre-tick; unticked, per-purpose consent |
| D3 | Notify Board within 72h (Rule 7) | ❓ | C | not found in repo | Add breach handler + runbook; confirm process with ops |
| F2 | Right to correction/erasure (§12) | ✅ | H | `api/account/delete.ts:15` | - |
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
