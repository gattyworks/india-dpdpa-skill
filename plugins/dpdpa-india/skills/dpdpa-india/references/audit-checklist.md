_Primary sources: DPDP Act 2023, DPDP Rules 2025, the December 2025 corrigendum, and the Act commencement notification pinned in [sources.lock.json](../scripts/sources.lock.json). Last reviewed: 2026-08-15. Engineering aid, not legal advice._

# DPDP Audit Checklist - the engine

Run each dimension. For every item: decide **✅ Compliant / ⚠️ Gap / ~ Readiness gap / ❓ Needs review / ➖ N/A**, cite
`file:line` evidence, and map severity via [penalties-schedule.md](penalties-schedule.md). Severity
shorthand below: **C**ritical (up to ₹200 crore or more, or comparable harm), **H**igh, **M**edium, **L**ow.

## Effective-date rule

Check [rules-2025.md](rules-2025.md) before scoring. As of 2026-08-15, most checks below are notified readiness requirements in the eighteen-month phase. Use **Readiness gap** when the requirement is not yet in force on the audit date. Use **Gap** only when an applicable requirement is in force. The Consent Manager regime in B7 follows the one-year phase.

## A. Lawful basis & purpose (4, 7)

| # | Check | Compliant looks like | Sev |
|---|-------|----------------------|-----|
| A1 | Every processing activity has a lawful basis | Each data use maps to **consent (6)** or a **listed legitimate use (7)** - nothing else is permitted | H |
| A2 | Purpose is specific & lawful | No "general/blanket" purposes; purpose recorded per data category | M |
| A3 | Consent-basis data minimisation | For consent processing, only data necessary for the specified purpose is requested (6(1)); do not present this as a general Act-wide principle | M |
| A4 | No purpose change under consent | Consent-basis data is not reused for a new specified purpose without valid consent for that purpose (6(1)) | H |

## B. Notice & consent (5, 6 + Rules)

| # | Check | Compliant looks like | Sev |
|---|-------|----------------------|-----|
| B1 | Notice present before/at consent | Itemised notice lists data collected, purpose, how to exercise rights, how to complain to the **Board** (5) | H |
| B2 | Notice is standalone & plain-language | Available in English + the 8th-Schedule languages on request; not buried in T&Cs | M |
| B3 | Consent is free/specific/informed/unconditional/unambiguous | Clear **affirmative action** (unticked box, explicit tap); no pre-ticked consent (6(1)) | H |
| B4 | Consent is limited to specified purpose and necessary data | The request does not make unnecessary data processing a condition of the service (6(1)); each purpose is clear | H |
| B5 | Withdrawal as easy as giving | A visible, equally simple "withdraw consent" path; consequences stated; processing stops on withdrawal (6(4)-(6)) | H |
| B6 | Evidence of consent | Records can prove notice version, affirmative action, purpose, data, and withdrawal; the Fiduciary bears the burden of proving notice and consent (6(10)) | H |
| B7 | Consent Manager integration | If the product uses a Consent Manager, it uses a Board-registered service and supports the required consent flow (2(g), 6(9), Rule 4) | M |
| B8 | Pre-Act data | Consent obtained before the Act still requires a fresh notice "as soon as reasonably practicable" (5(2)) | M |

## C. Data Fiduciary security & duties (8 + Rules 6)

| # | Check | Compliant looks like | Sev |
|---|-------|----------------------|-----|
| C1 | **Reasonable security safeguards** | Encryption (at rest + in transit), access control, logging & monitoring, backups, secure config - the Rule-6 measures. Failure here is the **₹250 cr** band (8(5)) | **C** |
| C2 | Processor contracts | Every Data Processor is engaged under a **valid contract** (8(2)); DPA in place | H |
| C3 | Data accuracy & completeness | Mechanisms to keep data accurate/complete/up-to-date, esp. where used for decisions/sharing (8(3)) | M |
| C4 | Erasure on withdrawal/purpose-end | Data (and processor copies) erased when consent withdrawn or purpose served, unless law requires retention (8(7)) | H |
| C5 | Published contact | DPO / contact person for answering rights questions is published (8(9)) | M |
| C6 | Grievance mechanism | Working grievance channel with a response within the prescribed period (8(10), 13) | H |
| C7 | Accountability | Fiduciary remains responsible even when a processor does the work (8(1)) | M |

## D. Breach handling (8(6) + Rule 7)

| # | Check | Compliant looks like | Sev |
|---|-------|----------------------|-----|
| D1 | Breach detection | Monitoring/alerting can detect a "personal data breach" as defined in 2(u) | H |
| D2 | Notify affected Data Principals | **Without delay**, in plain language: nature, likely consequences, mitigation, and safety steps for the principal (Rule 7) | C |
| D3 | Notify the Data Protection Board | **Initial intimation without delay**, **detailed report within 72 hours** of becoming aware (Rule 7) | C |
| D4 | No risk threshold | **Every** breach is reportable - there is no "low risk -> no report" exception under DPDP | H |
| D5 | Breach runbook | Documented response plan exists ([templates/data-breach-response.md](templates/data-breach-response.md)) | M |

## E. Children's data (9)

| # | Check | Compliant looks like | Sev |
|---|-------|----------------------|-----|
| E1 | Child-scope control | Where children are plausibly in scope, the system can prevent child-data processing until the Rule 10 consent checks are complete | C |
| E2 | Verifiable parental consent | Children's data processed only with verifiable consent of parent/guardian (9(1), Rules) | C |
| E3 | No behavioural tracking of children | **No** tracking, behavioural monitoring, or **targeted advertising** directed at children (9(3)) | C |
| E4 | No detrimental processing | Nothing likely to cause detrimental effect on a child's wellbeing (9(2)) | C |

## F. Data Principal rights (11-14)

| # | Check | Compliant looks like | Sev |
|---|-------|----------------------|-----|
| F1 | Right to access (11) | User can get a summary of their data, processing activities, and who it was shared with | H |
| F2 | Right to correction/erasure (12) | User can correct, complete, update, and erase their data; propagates to processors | H |
| F3 | Right to grievance redressal (13) | In-product grievance route; responses within prescribed time | H |
| F4 | Right to nominate (14) | User can nominate someone to act on death/incapacity | L |
| F5 | Rights mechanism is published and usable | Website/app publishes the request method and required identifier; verification is proportionate (Rule 14) | M |

## G. Significant Data Fiduciary extras (10 + Rules)

Applies only if notified/designated as an **SDF** (high volume or sensitivity). If plausibly in scope, flag for legal confirmation.

| # | Check | Compliant looks like | Sev |
|---|-------|----------------------|-----|
| G1 | India-based DPO | A **Data Protection Officer based in India**, reporting to the board/governance, is appointed and published (10(2)) | H |
| G2 | Independent data audit | Periodic **independent data audit** conducted (10(2)(c)) | M |
| G3 | DPIA | Periodic **Data Protection Impact Assessment** ([templates/dpia.md](templates/dpia.md)) | M |
| G4 | Rule 13 technical and localisation measures | Annual DPIA/audit reporting, algorithmic-risk checks, and any notified in-India processing category are handled (Rule 13) | H |

## H. Cross-border transfer (16 + Rules)

| # | Check | Compliant looks like | Sev |
|---|-------|----------------------|-----|
| H1 | Transfer restrictions and orders | Transfers honour any country/territory restriction under 16 and any foreign-State access requirement under Rule 15 | H |
| H2 | Sub-processor geography known | Data locations and foreign-government access paths are documented (cloud regions, CDNs, analytics) | M |
| H3 | Sectoral localisation | Sector rules still apply (e.g. RBI payment-data localisation) - see [legal-context.md](legal-context.md) | M |

## I. Retention & erasure (8(7)-(8) + Rule 8 / Third Schedule)

| # | Check | Compliant looks like | Sev |
|---|-------|----------------------|-----|
| I1 | Defined retention periods | Each data category has a documented retention period tied to purpose ([templates/data-retention-policy.md](templates/data-retention-policy.md)) | M |
| I2 | Automated erasure | A job/process erases data when purpose ends or consent is withdrawn - not "keep forever" | H |
| I3 | 3-year inactivity erasure (specified classes) | **E-commerce ≥2 cr users, online gaming ≥50 lakh, social media ≥2 cr**: erase if the principal hasn't engaged for **3 years** (purpose deemed served), with **48-hour pre-erasure notice** (Rule 8 / Third Schedule) | H |
| I4 | Log retention floor | Required logs/data kept for **≥1 year** where the Rules mandate (Rule 8(3)) | L |

## J. Governance & documentation

| # | Check | Compliant looks like | Sev |
|---|-------|----------------------|-----|
| J1 | Privacy policy / notice published | Live, current, DPDP-aligned ([templates/privacy-policy.md](templates/privacy-policy.md)) | M |
| J2 | Internal data-protection policy | ([templates/data-protection-policy.md](templates/data-protection-policy.md)) | L |
| J3 | Processing inventory | An inventory of data, purposes, recipients, and retention supports the statutory controls; this is an engineering control, not a named DPDPA ROPA duty | M |
| J4 | Vendor/DPA coverage | Third-party vendors covered by a DPA / vendor agreement ([templates/data-processing-agreement.md](templates/data-processing-agreement.md)) | H |
| J5 | Cookie/tracker lawful basis | Personal-data cookies, trackers, and analytics map to consent or a listed legitimate use; there is no standalone DPDPA cookie rule ([templates/cookie-policy.md](templates/cookie-policy.md)) | M |

## Quick triage (start here if time-boxed)

The highest-exposure failures, in order: **C1** (security safeguards, ₹250 cr) -> **E1-E4**
(children) -> **D2-D3** (breach notice) -> **B3/B5** (consent quality & withdrawal) -> **C4/I2**
(erasure) -> **F1-F3** (rights). Clear these before the rest.
