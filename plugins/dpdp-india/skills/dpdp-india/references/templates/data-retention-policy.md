# Data Retention Policy

_Purpose: define how long each category of personal data is kept and ensure erasure once the purpose is served or consent is withdrawn. DPDP mapping: S.8(7)-(8) (erasure on purpose completion / withdrawal); Rule 8 (when purpose is "no longer served"). Source: https://www.dpdpa.com/templates/dataretentionpolicytemplate.html. Paraphrased structure. Last verified: 2026-06-15._

**When required**
All Data Fiduciaries. S.8(7) requires erasing personal data once the principal withdraws consent or the purpose is no longer served, unless retention is required by law. Rule 8 sets out time-based triggers for when a purpose is deemed no longer served (e.g., periods of principal inactivity for certain classes of Fiduciary).

**Required clauses checklist** (paraphrased)
- Objectives and scope (which data, systems, and departments are covered).
- Retention principles: storage limitation, purpose linkage, legal-hold exceptions.
- Roles and responsibilities (DPO, department heads, data owners).
- Retention schedule: each data category with its retention period and the trigger for deletion.
- Erasure/destruction procedure for both live data and backups, including secure-disposal methods.
- Handling of statutory/legal-hold retention that overrides default deletion.
- Audit and monitoring of retention compliance.
- Exceptions and how they are approved/logged.
- Review cycle and contact information.

**Audit signals**
- A documented retention schedule mapping data categories to TTLs.
- An automated deletion/anonymization job (cron, scheduled task, TTL on DB rows, lifecycle rule on object storage).
- Erasure on consent withdrawal wired into the consent system (withdrawal triggers deletion workflow).
- Backups/exports covered by the deletion process, not just primary tables.
- Logs showing deletions actually run (not just a policy doc with no enforcement).
