# Data Retention Policy

_Purpose: define how long each category of personal data is kept and ensure erasure once the purpose is served or consent is withdrawn. DPDP mapping: S.8(7)-(8) (erasure on purpose completion / withdrawal); Rule 8 (when purpose is "no longer served"). Source: https://www.dpdpa.com/templates/dataretentionpolicytemplate.html. Paraphrased structure. Third-party structure and statutory mapping reviewed 2026-08-15._

**When required**
Future-phase readiness artifact as of 2026-08-15. Once the relevant provisions commence, S.8(7)
requires erasing personal data when consent is withdrawn or the purpose is no longer served,
unless retention is required by law. Rule 8 sets an inactivity trigger only for the classes and
purposes listed in the Third Schedule. It is not a general three-year retention cap.

**Required clauses checklist** (paraphrased)
- Objectives and scope (which data, systems, and departments are covered).
- Retention principles: storage limitation, purpose linkage, legal-hold exceptions.
- Roles and responsibilities (DPO, department heads, data owners).
- Retention schedule: each data category with its retention period and the trigger for deletion.
- Erasure/destruction procedure for live data and a documented expiry or isolation process for backups, including secure-disposal methods.
- Handling of statutory/legal-hold retention that overrides default deletion.
- Audit and monitoring of retention compliance.
- Exceptions and how they are approved/logged.
- Review cycle and contact information.

**Audit signals**
- A documented retention schedule mapping data categories to TTLs.
- An automated deletion/anonymization job (cron, scheduled task, TTL on DB rows, lifecycle rule on object storage).
- Erasure on consent withdrawal wired into the consent system (withdrawal triggers deletion workflow).
- Backups/exports covered by a deletion, expiry, or suppression process, not ignored after primary-table deletion.
- Logs showing deletions actually run (not just a policy doc with no enforcement).
