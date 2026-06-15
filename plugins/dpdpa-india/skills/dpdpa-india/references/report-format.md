_Source: DPDPA Audit output contract for the dpdpa-india skill. Last verified: 2026-06-15. Engineering aid, not legal advice._

# Audit report format (the output contract)

Every DPDPA audit MUST be reported in this exact structure, with these fields, severity levels,
statuses, and issue IDs. This is what makes runs consistent and comparable: the same checks, the
same labels, the same shape, whether the auditor is a person or an agent. Do not improvise the
format or invent issue codes.

The **canonical issue catalog** is the dimension/check IDs in
[audit-checklist.md](audit-checklist.md). A report references those IDs (A1 ... J5) and never
creates new ones.

## Report structure (fixed order)

1. **Header** - `DPDPA Audit - <system> (DPDP Act 2023 + Rules 2025, sources verified <date>)`.
2. **Verdict** - one of `Materially compliant` / `Gaps found` / `Not assessed`, plus a one-line
   scope (role: Fiduciary or Processor; children in scope?; SDF likely?; cross-border?).
3. **Risk summary** - counts by severity and by status.
4. **Findings** - the table: every applicable catalog ID, ordered by severity (Critical first),
   then by dimension.
5. **Gap details** - for each Gap or Needs-review row, a short block: what was found and the fix.
6. **Top risks** - the 3 highest-exposure items in plain language.
7. **Confirm with counsel / ops** - items not decidable from code (designations, contracts, process).
8. **Disclaimer** - the one-line "engineering aid, not legal advice" note.

## Severity levels

Severity reflects penalty exposure (see [penalties-schedule.md](penalties-schedule.md)) and harm.
Each catalog ID has a default severity; raise it when the data is sensitive or volumes are high,
and state why.

| Level | Meaning | Typical penalty band | Example IDs |
|---|---|---|---|
| **Critical** | Highest exposure or irreversible harm | up to ₹250 cr (security), ₹200 cr (children) | C1, E1, E2, E3, E4 |
| **High** | Major obligation, or a core right denied | up to ₹200 cr (breach), ₹150 cr (SDF) | D2, D3, B3, B5, C4, C6, F1, F2, F3, G1, J4 |
| **Medium** | Governance, documentation, or scoped duty | residuary, up to ₹50 cr | A2, A3, B1, C3, H1, H2, H3, I1, J1, J5 |
| **Low** | Minor or supporting control | low / procedural | F4, I4, J2 |

## Status values

| Status | Icon | Meaning |
|---|---|---|
| Compliant | ✅ | Control present and adequate; evidence cited. |
| Gap | ⚠️ | Control missing or inadequate. This is a finding. |
| Needs review | ❓ | Cannot be decided from code or artifacts alone; needs human, legal, or ops confirmation. |
| N/A | ➖ | Dimension does not apply (give a one-line reason). |

## Finding fields

Each row carries these fields, in this order. Every field is required; use `-` only where a field
is genuinely empty (for example, Fix on a Compliant row).

| Field | What it holds |
|---|---|
| **ID** | The catalog ID from audit-checklist.md (A1 ... J5). Fixed; never invented. |
| **Requirement** | Short label + the DPDP section/rule cite, e.g. "Security safeguards (§8(5), Rule 6)". |
| **Status** | One of the four statuses above. |
| **Severity** | One of the four levels above (default per ID; raised with a stated reason). |
| **Evidence** | `path/to/file:line`, or `not found` when an expected control is absent. |
| **Fix** | The concrete remediation + the template/reference that specifies it. |

Gap and Needs-review rows expand in **Gap details** with a one-line *Finding* (what was observed)
and the *Remediation*.

## Markdown template

```
## DPDPA Audit - <system>
DPDP Act 2023 + Rules 2025 - sources verified <date>

**Verdict:** <Materially compliant | Gaps found | Not assessed>
**Scope:** Role: <Fiduciary|Processor> | Children in scope: <yes|no|unknown> | SDF likely: <yes|no|unknown> | Cross-border: <yes|no>

### Risk summary
| Severity | Count | | Status | Count |
|---|---|---|---|---|
| Critical | n | | ✅ Compliant | n |
| High | n | | ⚠️ Gap | n |
| Medium | n | | ❓ Needs review | n |
| Low | n | | ➖ N/A | n |

### Findings
| ID | Requirement (cite) | Status | Severity | Evidence | Fix |
|----|--------------------|--------|----------|----------|-----|
| C1 | Security safeguards (§8(5), Rule 6) | ⚠️ Gap | Critical | path:line | ... |

### Gap details
- **C1 Security safeguards:** <finding>. Fix: <remediation> (see <reference>).

### Top risks
1. ...

### Confirm with counsel / ops
- ...

> Engineering aid, not legal advice. Run your own audit; have a qualified Indian data-protection practitioner review.
```

## Worked example (illustrative)

A fictional app, to show the shape. The system and findings are invented.

> ## DPDPA Audit - Acme Shop (Next.js storefront + Node API + Postgres)
> DPDP Act 2023 + Rules 2025 - sources verified 2026-06-15
>
> **Verdict:** Gaps found
> **Scope:** Role: Data Fiduciary | Children in scope: unknown | SDF likely: no (revisit at scale) | Cross-border: yes (us-east-1)
>
> ### Risk summary
> | Severity | Count | | Status | Count |
> |---|---|---|---|---|
> | Critical | 3 | | ✅ Compliant | 1 |
> | High | 8 | | ⚠️ Gap | 10 |
> | Medium | 2 | | ❓ Needs review | 2 |
> | Low | 0 | | ➖ N/A | 1 |
>
> ### Findings
> | ID | Requirement (cite) | Status | Severity | Evidence | Fix |
> |----|--------------------|--------|----------|----------|-----|
> | C1 | Security safeguards (§8(5), Rule 6) | ⚠️ Gap | Critical | `api/db.ts:14`, `.env.example:3` | Enforce TLS, move secrets to a vault, encrypt at rest (code-patterns 3) |
> | E1 | Age detection (§9) | ❓ Needs review | Critical | `not found` | Confirm if under-18 users are in the audience; add an age gate |
> | E3 | No behavioural tracking of children (§9(3)) | ⚠️ Gap | Critical | `app/layout.tsx:22` | Gate analytics/ad SDKs off for under-18; no targeted ads to children |
> | D3 | Notify Board within 72h (§8(6), Rule 7) | ⚠️ Gap | High | `not found` | Add breach detection + Board/principal notification ([data-breach-response](templates/data-breach-response.md)) |
> | B3 | Consent quality (§6(1)) | ⚠️ Gap | High | `components/Signup.tsx:40` | Remove pre-ticked box; explicit, itemised consent |
> | B5 | Withdrawal as easy as giving (§6(4)) | ⚠️ Gap | High | `not found` | Add a visible withdraw-consent control; stop processing on withdrawal |
> | C4 | Erasure on withdrawal/purpose-end (§8(7)) | ⚠️ Gap | High | `not found` | Delete on request; propagate to processors |
> | F1 | Right to access (§11) | ⚠️ Gap | High | `not found` | Add a data-export endpoint ([dsar-request](templates/dsar-request.md)) |
> | C6 | Grievance mechanism (§8(10), §13) | ⚠️ Gap | High | `not found` | Add a grievance route + response SLA ([grievance-redressal](templates/grievance-redressal.md)) |
> | J4 | Vendor / DPA coverage (§8(2)) | ⚠️ Gap | High | `not found` | Sign DPAs with the email + analytics vendors ([data-processing-agreement](templates/data-processing-agreement.md)) |
> | H1 | Restricted-country transfer (§16) | ❓ Needs review | High | `infra/deploy.yml:8` | Map data egress (us-east-1) against the notified restriction list |
> | J1 | Privacy notice published (§5) | ⚠️ Gap | Medium | `not found` (no `/privacy` route) | Publish a DPDP notice ([privacy-policy](templates/privacy-policy.md)) |
> | I2 | Automated erasure (§8(7)) | ⚠️ Gap | Medium | `not found` | Add a retention TTL / purge job ([data-retention-policy](templates/data-retention-policy.md)) |
> | A1 | Lawful basis (§4) | ✅ Compliant | High | `server/auth.ts:30` | - |
> | G1 | India-based DPO (§10(2)) | ➖ N/A | - | - | Below plausible SDF threshold; revisit if the user base grows |
>
> ### Gap details
> - **C1 Security safeguards:** API connects to Postgres without TLS and an API key is committed in `.env.example`. Fix: enforce TLS in transit, rotate and vault the key, enable at-rest encryption.
> - **E3 No behavioural tracking of children:** Google Analytics and the ad pixel load for every visitor in `app/layout.tsx`. Fix: suppress trackers for users who are or may be under 18; never serve targeted ads to children.
> - **J4 Vendor / DPA coverage:** the email and analytics vendors process personal data with no Data Processing Agreement on file. Fix: execute DPAs before continuing to share data.
>
> ### Top risks
> 1. **Security safeguards (C1)** - the ₹250 crore band; plaintext DB link and a committed secret.
> 2. **Children's data (E1, E3)** - trackers fire for everyone and there is no age gate.
> 3. **No data-subject rights or breach plan (F1, C4, B5, D3)** - core obligations unmet.
>
> ### Confirm with counsel / ops
> - Whether under-18 users are in the audience (drives all of dimension E).
> - SDF designation status and the current notified restricted-country list (§16).
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
