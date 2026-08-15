_Source: DPDPA Audit output contract for the dpdpa-india skill. Legal-source baseline checked 2026-08-15. Engineering aid, not legal advice._

# Audit report format (the output contract)

Every DPDPA audit MUST be reported in this exact structure, with these fields, severity levels,
statuses, and issue IDs. This is what makes runs consistent and comparable: the same checks, the
same labels, the same shape, whether the auditor is a person or an agent. Do not improvise the
format or invent issue codes.

The **canonical issue catalog** is the dimension/check IDs in
[audit-checklist.md](audit-checklist.md). A report references those IDs (A1 ... J5) and never
creates new ones.

## Write so a non-lawyer can act

Legal and technical terms are allowed, but every gap must make four things obvious to someone who
is not a lawyer:

- **How serious it is** - the severity word (Critical / High / Medium / Low).
- **What is wrong** - one plain sentence, not jargon alone.
- **How to fix it** - a concrete step.
- **What happens if it is not fixed** - the real consequence: the penalty exposure, plus the harm
  to people or the enforcement risk. This line is mandatory for every gap.

## Report structure (fixed order)

1. **Header** - system name, audit date, legal-source baseline date, and audit mode (`Current compliance` or `Readiness`).
2. **Verdict** - one of `Materially compliant` / `Gaps found` / `Readiness gaps found` / `Not assessed`, plus a one-line
   scope (role: Fiduciary or Processor; children in scope?; SDF likely?; cross-border?).
3. **Risk summary** - counts by severity and by status.
4. **Findings** - the table: every applicable catalog ID, ordered by severity (Critical first),
   then by dimension.
5. **Gap details** - for each Gap, Readiness-gap, or Needs-review row, a plain-language block: what it is, the fix, and what happens if it is not fixed.
6. **Top risks** - the 3 highest-exposure items in plain language.
7. **Confirm with counsel / ops** - items not decidable from code (designations, contracts, process).
8. **Disclaimer** - the one-line "engineering aid, not legal advice" note.

## Severity levels

Severity reflects penalty exposure (see [penalties-schedule.md](penalties-schedule.md)) and harm.
Each catalog ID has a default severity; raise it when the data is sensitive or volumes are high,
and state why.

| Level | What it means in plain terms | Penalty exposure | Example IDs |
|---|---|---|---|
| **Critical** | Fix first. Largest fines, or direct harm to people. | up to ₹250 cr (security), ₹200 cr (breach and children) | C1, D2, D3, E1, E2, E3, E4 |
| **High** | A major legal duty is unmet, or a person's right is blocked. | up to ₹150 cr (SDF) or the residuary band | B3, B5, C4, C6, F1, F2, F3, G1, J4 |
| **Medium** | Required but lower-stakes: governance or documentation. | residuary, up to ₹50 cr | A2, A3, B1, C3, H1, H2, H3, I1, J1, J5 |
| **Low** | Minor or supporting item; tidy up. | low / procedural | F4, I4, J2 |

## Status values

| Status | Icon | Meaning |
|---|---|---|
| Compliant | ✅ | Control present and adequate; evidence cited. |
| Gap | ⚠️ | An applicable, in-force control is missing or inadequate. |
| Readiness gap | ~ | A notified control is missing, but its phase has not started on the audit date. |
| Needs review | ❓ | Cannot be decided from code or artifacts alone; needs human, legal, or ops confirmation. |
| N/A | ➖ | Dimension does not apply (give a one-line reason). |

## Finding fields

Each row carries these fields, in this order. Every field is required; use `-` only where a field
is genuinely empty (for example, Fix on a Compliant row).

| Field | What it holds |
|---|---|
| **ID** | The catalog ID from audit-checklist.md (A1 ... J5). Fixed; never invented. |
| **Requirement** | Short label + the DPDP section/rule cite, e.g. "Security safeguards (8(5), Rule 6)". |
| **Status** | One of the five statuses above. |
| **Severity** | One of the four levels above (default per ID; raised with a stated reason). |
| **Evidence** | `path/to/file:line`, or `not found` when an expected control is absent. |
| **Fix** | The concrete remediation + the template/reference that specifies it. |

Gap, Readiness-gap, and Needs-review rows expand in **Gap details** with three plain-language lines: **What it is**,
**Fix**, and **If unfixed** (the consequence).

## Markdown template

```
## DPDPA Audit - <system>
Audit date: <YYYY-MM-DD> | Legal-source baseline: <YYYY-MM-DD>
Mode: <Current compliance | Readiness> | Phase basis: <in-force / one-year / eighteen-month provisions checked>

**Verdict:** <Materially compliant | Gaps found | Readiness gaps found | Not assessed>
**Scope:** Role: <Fiduciary|Processor> | Children in scope: <yes|no|unknown> | SDF likely: <yes|no|unknown> | Cross-border: <yes|no>

### Risk summary
| Severity | Count |
|---|---|
| Critical | n |
| High | n |
| Medium | n |
| Low | n |

| Status | Count |
|---|---|
| ✅ Compliant | n |
| ⚠️ Gap | n |
| ~ Readiness gap | n |
| ❓ Needs review | n |
| ➖ N/A | n |

### Findings
| ID | Requirement (cite) | Status | Severity | Evidence | Fix |
|----|--------------------|--------|----------|----------|-----|
| C1 | Security safeguards (8(5), Rule 6) | <Gap or Readiness gap> | Critical | path:line | ... |

### Gap details
- **C1 - Security safeguards (Critical):**
  - What it is: <plain English; what is wrong and why it matters>
  - Fix: <concrete step> (see <reference>)
  - If unfixed: <plain-English consequence, e.g. a breach here can mean a penalty of up to ₹250 crore plus harm to users>

### Top risks
1. ...

### Confirm with counsel / ops
- ...

> Engineering aid, not legal advice. Run your own audit; have a qualified Indian data-protection practitioner review.
```

## Worked example (illustrative)

A fictional app, to show the shape. The system and findings are invented.

> ## DPDPA Audit - Acme Shop (Next.js storefront + Node API + Postgres)
> Audit date: 2026-08-15 | Legal-source baseline: 2026-08-15
> Mode: Readiness | Phase basis: eighteen-month duties are not yet in force
>
> **Verdict:** Readiness gaps found
> **Scope:** Role: Data Fiduciary | Children in scope: unknown | SDF likely: no (revisit at scale) | Cross-border: yes (us-east-1)
>
> ### Risk summary
> | Severity | Count |
> |---|---|
> | Critical | 4 |
> | High | 8 |
> | Medium | 2 |
> | Low | 0 |
>
> | Status | Count |
> |---|---|
> | ✅ Compliant | 1 |
> | ⚠️ Gap | 0 |
> | ~ Readiness gap | 11 |
> | ❓ Needs review | 2 |
> | ➖ N/A | 1 |
>
> ### Findings
> | ID | Requirement (cite) | Status | Severity | Evidence | Fix |
> |----|--------------------|--------|----------|----------|-----|
> | C1 | Security safeguards (8(5), Rule 6) | ~ Readiness gap | Critical | `api/db.ts:14`, `.env.example:3` | Enforce TLS, move secrets to a vault, encrypt at rest (code-patterns 3) |
> | E1 | Child-scope control (9, Rule 10) | ❓ Needs review | Critical | `not found` | Confirm if under-18 users are in the audience; add the required control if they are |
> | E3 | No behavioural tracking of children (9(3)) | ~ Readiness gap | Critical | `app/layout.tsx:22` | Gate analytics/ad SDKs off for under-18; no targeted ads to children |
> | D3 | Notify Board within 72h (8(6), Rule 7) | ~ Readiness gap | Critical | `not found` | Add breach detection + Board/principal notification ([data-breach-response](templates/data-breach-response.md)) |
> | B3 | Consent quality (6(1)) | ~ Readiness gap | High | `components/Signup.tsx:40` | Remove pre-ticked consent; use an explicit action |
> | B5 | Withdrawal as easy as giving (6(4)) | ~ Readiness gap | High | `not found` | Add a visible withdraw-consent control; stop consent-basis processing on withdrawal |
> | C4 | Erasure on withdrawal/purpose-end (8(7)) | ~ Readiness gap | High | `not found` | Erase when required; propagate to processors and preserve data required by law |
> | F1 | Right to access (11) | ~ Readiness gap | High | `not found` | Add an access-request flow ([dsar-request](templates/dsar-request.md)) |
> | C6 | Grievance mechanism (8(10), 13) | ~ Readiness gap | High | `not found` | Add a grievance route + response SLA ([grievance-redressal](templates/grievance-redressal.md)) |
> | J4 | Vendor / DPA coverage (8(2)) | ~ Readiness gap | High | `not found` | Sign DPAs with the email + analytics vendors ([data-processing-agreement](templates/data-processing-agreement.md)) |
> | H1 | Transfer restrictions and orders (16, Rule 15) | ❓ Needs review | High | `infra/deploy.yml:8` | Map data egress and check current official notifications |
> | J1 | Privacy notice published (5) | ~ Readiness gap | Medium | `not found` (no `/privacy` route) | Publish a DPDP notice ([privacy-policy](templates/privacy-policy.md)) |
> | I2 | Automated erasure (8(7)) | ~ Readiness gap | Medium | `not found` | Add a retention TTL / purge job with legal holds ([data-retention-policy](templates/data-retention-policy.md)) |
> | A1 | Lawful basis (4) | ✅ Compliant | High | `server/auth.ts:30` | - |
> | G1 | India-based DPO (10(2)) | ➖ N/A | - | - | Below plausible SDF threshold; revisit if the user base grows |
>
> ### Gap details
> - **C1 - Security safeguards (Critical):**
>   - What it is: the app talks to its database without encryption and an API key is committed in `.env.example`, so personal data is exposed if anyone gets in.
>   - Fix: enforce TLS in transit, move the key to a secrets vault, and turn on encryption at rest.
>   - If unfixed after commencement: a breach traced to weak safeguards can draw a penalty up to ₹250 crore, plus leaked customer data and reputational damage.
> - **E3 - No tracking of children (Critical):**
>   - What it is: analytics and the ad pixel load for every visitor in `app/layout.tsx`, including anyone under 18. Section 9(3) will prohibit this when the eighteen-month phase starts, unless a Rule 12 exemption applies.
>   - Fix: turn trackers and targeted ads off for users who are or may be under 18.
>   - If unfixed after commencement: a breach of children's-data duties can carry a penalty up to ₹200 crore and can harm minors.
> - **F1 - Right to access (High):**
>   - What it is: users have no way to see or download the personal data you hold about them.
>   - Fix: add a "download my data" endpoint (see [dsar-request](templates/dsar-request.md)).
>   - If unfixed after commencement: the product will not support the statutory access right and can face a Board complaint.
> - **J4 - Vendor / DPA coverage (High):**
>   - What it is: you share personal data with email and analytics vendors with no Data Processing Agreement in place.
>   - Fix: sign a DPA with each vendor before sharing more data.
>   - If unfixed after commencement: the Fiduciary remains responsible, and section 8(2) requires processor engagement under a valid contract.
>
> ### Top risks
> 1. **Security safeguards (C1)** - the ₹250 crore band; plaintext DB link and a committed secret.
> 2. **Children's data (E1, E3)** - trackers fire for everyone and there is no age gate.
> 3. **No data-subject rights or breach plan (F1, C4, B5, D3)** - core obligations unmet.
>
> ### Confirm with counsel / ops
> - Whether under-18 users are in the audience (drives all of dimension E).
> - SDF designation status and the current notified restricted-country list (16).
> - Whether signed DPAs exist outside the repo.
>
> > Engineering aid, not legal advice. Run your own audit; have a qualified Indian data-protection practitioner review.

## Canonical issue catalog

Always report against these IDs (full detail in [audit-checklist.md](audit-checklist.md)):

- **A** Lawful basis & purpose: A1-A4
- **B** Notice & consent: B1-B8
- **C** Fiduciary security & duties: C1-C7
- **D** Breach handling: D1-D5
- **E** Children's data: E1-E4
- **F** Data Principal rights: F1-F5
- **G** Significant Data Fiduciary extras: G1-G4
- **H** Cross-border transfer: H1-H3
- **I** Retention & erasure: I1-I4
- **J** Governance & documentation: J1-J5

If a dimension is out of scope, still list it as `➖ N/A` with a one-line reason rather than dropping it, so two audits of the same system are directly comparable.
