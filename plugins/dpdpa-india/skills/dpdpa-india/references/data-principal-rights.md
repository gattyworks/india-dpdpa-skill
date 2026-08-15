_Primary sources: DPDP Act 2023 and final DPDP Rules 2025 pinned in `scripts/sources.lock.json`. Last reviewed: 2026-08-15._

# Data Principal Rights & Duties (11-15)

These rights apply against a fiduciary to whom the Data Principal previously gave consent, including 7(a) voluntary-provision processing. Rule 14 requires publication of the request method and any identifier needed under the terms of service.

## 11 - Right to access information about personal data
On request, the Data Principal can obtain:
- **(a)** a **summary of the personal data** being processed and the **processing activities** undertaken on it;
- **(b)** the **identities of all other Data Fiduciaries and Data Processors** the data was shared with, plus a **description** of the data shared;
- **(c)** any other prescribed information about the data and its processing.
- **11(2) - exception:** (b) and (c) do **not** apply to sharing with a legally authorised fiduciary made in writing for **prevention/detection/investigation of offences or cyber incidents**, or prosecution/punishment.

**System must support:**
- A **data-access response flow** producing the summary required by 11. Section 11 is not a general data-portability right.
- A **data-sharing register / lineage** recording every downstream fiduciary/processor and what was shared (to answer 11(1)(b)).
- An **identity-verified request intake** workflow.

## 12 - Right to correction and erasure of personal data
- **12(1):** right to **correction, completion, updating and erasure** of personal data she previously consented to processing of.
- **12(2):** on a correction/completion/updating request, the fiduciary must **(a) correct** inaccurate/misleading data, **(b) complete** incomplete data, and **(c) update** the data.
- **12(3):** on an erasure request, the fiduciary **shall erase** the data **unless retention is necessary** for the specified purpose or for compliance with any in-force law.

**System must support:**
- **Edit/correct/complete** flows for personal data fields.
- A **deletion pipeline** for active stores and processors, with legal-retention holds and a documented backup-expiry or restoration-deletion process.
- Audit logging of correction/erasure actions.

## 13 - Right of grievance redressal
- **13(1):** right to **readily available means of grievance redressal** from the **Data Fiduciary or Consent Manager** for any act/omission regarding their obligations or the exercise of her rights.
- **13(2):** the fiduciary or Consent Manager must respond within the prescribed period. Rule 14 requires it to publish a reasonable period that does not exceed 90 days.
- **13(3):** the Data Principal must **exhaust this grievance route before approaching the Board**.

**System must support:**
- An in-product / documented **grievance channel** (linked from the 5 notice).
- **Ticketing with timestamps and SLA tracking** against the prescribed response period.
- Escalation path; record-keeping to evidence timely response.

## 14 - Right to nominate
- **14(1):** right to **nominate another individual** to exercise her rights **on death or incapacity**, in the prescribed manner.
- **14(2):** "incapacity" means inability to exercise rights due to **unsoundness of mind or infirmity of body**.

**System must support:**
- A **nominee-designation** feature capturing/storing nominee details.
- A process to **transfer rights-exercise to the nominee** upon verified death/incapacity.

## 15 - Duties of Data Principal
A Data Principal shall:
- **(a)** comply with all applicable laws while exercising her rights;
- **(b)** **not impersonate** another person when providing personal data;
- **(c)** **not suppress material information** when providing data for any State-issued document, unique identifier, or proof of identity/address;
- **(d)** **not register false or frivolous** grievances/complaints with a fiduciary or the Board;
- **(e)** furnish only **verifiably authentic information** when exercising correction/erasure rights.

*(Note: breach of 15 duties carries a penalty up to ₹10,000 - see penalties-schedule.md.)*

---

## Quick mapping: right -> technical capability

| Right |  | Must build |
|---|---|---|
| Access summary + sharing list | 11 | Access-response flow; data-sharing/lineage register; verified request intake |
| Correction / completion / updating | 12(2) | Editable-field workflows |
| Erasure | 12(3) | Deletion pipeline incl. processors/backups; retention-exception check |
| Grievance redressal | 13 | Grievance channel + SLA-tracked ticketing within a published period of no more than 90 days |
| Nomination | 14 | Nominee capture + death/incapacity-triggered rights transfer |
