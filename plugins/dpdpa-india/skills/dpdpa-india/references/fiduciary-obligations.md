_Source: DPDP Act 2023 (Act 22 of 2023), MeitY. Last verified: 2026-06-15._

# Data Fiduciary Obligations (8, 9, 10, 16)

## 8 - General obligations of Data Fiduciary
- **8(1) - Accountability:** the fiduciary is responsible for compliance for any processing it does **or that a processor does on its behalf** - irrespective of any contrary agreement or the Data Principal's failure to perform her duties.
- **8(2) - Processor contracts:** a Data Processor may be engaged **only under a valid contract**.
- **8(3) - Accuracy/completeness:** where data will be used to **make a decision affecting** the Principal, or **disclosed to another fiduciary**, ensure its **completeness, accuracy and consistency**.
- **8(4) - Organisational measures:** implement appropriate **technical and organisational measures** for effective compliance.
- **8(5) - Security safeguards:** protect personal data in its possession/control by taking **reasonable security safeguards to prevent a personal data breach** (applies to processors acting on its behalf too). *(Breach of 8(5) carries the highest penalty - up to ₹250 crore.)*
- **8(6) - Breach intimation:** on a personal data breach, give the **Board and each affected Data Principal** intimation in the prescribed form and manner. *(No fixed timeline in the Act - "as may be prescribed"; verify the Rules' breach-notification window.)*
- **8(7) - Erasure:** unless retention is required by law, **erase** personal data when the Principal **withdraws consent** or when the **specified purpose is no longer served** (whichever is earlier), and **cause processors to erase** it too.
- **8(8) - Purpose-no-longer-served test:** purpose is deemed no longer served if the Principal neither approaches the fiduciary for the specified purpose **nor** exercises any right within a **prescribed time period** (different periods may be prescribed per class/purpose - verify).
- **8(9) - DPO/contact publication:** publish business contact info of the DPO (if applicable) or a person who can answer the Principal's questions about processing.
- **8(10) - Grievance redressal:** establish an **effective grievance redressal mechanism**.

## 9 - Processing of personal data of children
- **9(1) - Verifiable consent:** before processing a **child's** data (or that of a person with disability who has a lawful guardian), obtain **verifiable consent of the parent / lawful guardian** in the prescribed manner.
- **Age threshold:** a "child" is **an individual who has not completed the age of eighteen years** (2(f)) - i.e. **under 18**.
- **9(2) - No detrimental processing:** must not undertake processing **likely to cause any detrimental effect on the well-being of a child**.
- **9(3) - Prohibited practices:** must **not** undertake **tracking or behavioural monitoring of children or targeted advertising directed at children**.
- **9(4) - Carve-outs:** 9(1) and 9(3) may be relaxed for notified classes of fiduciaries / purposes / conditions (to be prescribed - verify).
- **9(5) - Age-down exemption:** the Central Government may notify a **lower age** above which a specific fiduciary is exempt from 9(1)/(3) if it processes children's data in a **verifiably safe** manner.

## 10 - Additional obligations of Significant Data Fiduciary (SDF)
- **10(1) - Designation:** Central Government notifies a fiduciary/class as an **SDF** based on factors incl. volume & sensitivity of data, risk to Principals' rights, impact on **sovereignty/integrity**, **risk to electoral democracy**, security of the State, public order.
- **10(2) - SDF must:**
  - **(a) appoint a Data Protection Officer (DPO)** who: represents the SDF under the Act; **is based in India**; is responsible to the Board of Directors / governing body; and is the **point of contact for grievance redressal**.
  - **(b) appoint an independent data auditor** to carry out a **data audit** evaluating Act compliance.
  - **(c) undertake:** **(i) periodic Data Protection Impact Assessment (DPIA)** - describing Principals' rights, the purpose, and risk assessment/management; **(ii) periodic audit;** and **(iii)** other prescribed measures.

## 16 - Processing of personal data outside India (cross-border transfer)
- **16(1) - Blacklist model:** the Central Government may, **by notification, restrict transfer** of personal data by a fiduciary for processing **to such country or territory outside India as may be so notified**. Transfer is otherwise permitted unless a country is notified/restricted. *(This is a negative-list / blacklist approach - not a GDPR-style adequacy whitelist.)*
- **16(2) - Higher-protection laws preserved:** nothing in 16 relaxes any other in-force Indian law that imposes a **higher degree of protection or stricter transfer restriction** (e.g. sectoral RBI/SEBI data-localisation rules still apply).

---

## Actionable checklist - per section

**8 - General obligations**
- [ ] Written **DPA / processor contract** in place for every processor; flow-down of erasure & security duties.
- [ ] Data feeding decisions about, or shared with, other fiduciaries is **accurate, complete, consistent**.
- [ ] **Security safeguards** implemented (encryption, access control, logging, etc.) - documented as "reasonable".
- [ ] **Breach response runbook**: notify Board + each affected Principal in prescribed form (confirm Rules' timeline - verify).
- [ ] **Automated erasure** on consent withdrawal / purpose completion, propagated to processors.
- [ ] **Retention policy** keyed to prescribed inactivity period (verify) and lawful-retention exceptions.
- [ ] **DPO / contact** published; **grievance mechanism** live (ties to 13).

**9 - Children**
- [ ] **Age-gating** to detect under-18 users.
- [ ] **Verifiable parental/guardian consent** flow before processing children's data.
- [ ] **No tracking, behavioural monitoring, or targeted advertising** to children - verify ad SDKs/analytics disabled for minors.
- [ ] No processing likely to harm a child's well-being.

**10 - SDF (if designated)**
- [ ] **DPO appointed and based in India**, reporting to the board, named as grievance contact.
- [ ] **Independent data auditor** engaged; periodic data audits scheduled.
- [ ] **Periodic DPIA** documented for high-risk processing.

**16 - Cross-border transfer**
- [ ] Maintain a map of **where personal data is transferred/stored** (cloud regions, sub-processors).
- [ ] Check transfers against any **government-notified restricted countries** (verify current notified list).
- [ ] Comply with stricter **sectoral localisation** rules where applicable (16(2)).
