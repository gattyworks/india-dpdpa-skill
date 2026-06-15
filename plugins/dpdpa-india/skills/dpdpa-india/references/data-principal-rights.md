_Source: DPDP Act 2023 (Act 22 of 2023), MeitY. Last verified: 2026-06-15._

# Data Principal Rights & Duties (11-15)

These rights apply against a fiduciary to whom the Data Principal **previously gave consent** (incl. 7(a) voluntary-provision processing). The exact request "manner" is **to be prescribed** by rules in several places (verify final Rules).

## 11 - Right to access information about personal data
On request, the Data Principal can obtain:
- **(a)** a **summary of the personal data** being processed and the **processing activities** undertaken on it;
- **(b)** the **identities of all other Data Fiduciaries and Data Processors** the data was shared with, plus a **description** of the data shared;
- **(c)** any other prescribed information about the data and its processing.
- **11(2) - exception:** (b) and (c) do **not** apply to sharing with a legally authorised fiduciary made in writing for **prevention/detection/investigation of offences or cyber incidents**, or prosecution/punishment.

**System must support:**
- A **data-access / "download my data" endpoint** producing a human-readable summary of stored personal data and processing purposes.
- A **data-sharing register / lineage** recording every downstream fiduciary/processor and what was shared (to answer 11(1)(b)).
- An **identity-verified request intake** workflow.

## 12 - Right to correction and erasure of personal data
- **12(1):** right to **correction, completion, updating and erasure** of personal data she previously consented to processing of.
- **12(2):** on a correction/completion/updating request, the fiduciary must **(a) correct** inaccurate/misleading data, **(b) complete** incomplete data, and **(c) update** the data.
- **12(3):** on an erasure request, the fiduciary **shall erase** the data **unless retention is necessary** for the specified purpose or for compliance with any in-force law.

**System must support:**
- **Edit/correct/complete** flows for personal data fields.
- A **deletion pipeline** that erases across primary stores, backups, and processors, with a **lawful-retention override** check.
- Audit logging of correction/erasure actions.

## 13 - Right of grievance redressal
- **13(1):** right to **readily available means of grievance redressal** from the **Data Fiduciary or Consent Manager** for any act/omission regarding their obligations or the exercise of her rights.
- **13(2):** the fiduciary/Consent Manager must **respond within the prescribed period** from receipt. *(No fixed number in the Act - "such period as may be prescribed"; verify the Rules' response window.)*
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
| Access summary + sharing list | 11 | Data-export endpoint; data-sharing/lineage register; verified request intake |
| Correction / completion / updating | 12(2) | Editable-field workflows |
| Erasure | 12(3) | Deletion pipeline incl. processors/backups; retention-exception check |
| Grievance redressal | 13 | Grievance channel + SLA-tracked ticketing within prescribed period (verify) |
| Nomination | 14 | Nominee capture + death/incapacity-triggered rights transfer |
