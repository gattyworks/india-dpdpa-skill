# DPDP (India) Safeguard Templates - Index

These reference notes describe the **expected compliance artifacts** an organization processing personal data of Indians should maintain under the Digital Personal Data Protection Act, 2023 (DPDP Act) and the DPDP Rules. Each note captures a template's **purpose**, the **DPDP section/rule it satisfies**, and a **paraphrased clause checklist** - no verbatim template text.

**How the audit skill uses these:** treat each file as the "expected artifact" spec for a compliant build. During an audit, confirm the artifact exists (a policy doc, a route, a DB table, a cron job) and contains the required clauses; flag any missing or stub artifact as a gap mapped to its DPDP section.

_Structure informed by dpdpa.com; paraphrased. Third-party structure and statutory mapping reviewed 2026-08-15._

The duties mapped to Rules 3 to 16 and 22 to 23 are future-phase requirements as of the review
date. Use these artifacts for readiness work, but do not label a missing future-phase artifact as
a current legal breach. See [../rules-2025.md](../rules-2025.md) for the phase table.

| Template | What it safeguards | DPDP section(s) / rule(s) | When required | Source URL |
|---|---|---|---|---|
| [Website Privacy Policy](privacy-policy.md) | Transparency on collection/use/sharing of personal data | S.5 (Notice); S.11-14 (rights) | Any Data Fiduciary with a public site/app collecting personal data | https://www.dpdpa.com/templates/websiteprivacypolicytemplate.html |
| [Consent Notice / Form](consent-notice.md) | Free, informed, specific, unambiguous consent + itemized notice | S.5 (Notice), S.6 (Consent); Rule 3 | When consent is the lawful basis for processing | https://www.dpdpa.com/templates/consentformfordataprocessingtemplate.html |
| [Data Retention Policy](data-retention-policy.md) | Storage limitation; erasure when purpose served | S.8(7)-(8) (erasure); Rule 8 | All Data Fiduciaries holding personal data | https://www.dpdpa.com/templates/dataretentionpolicytemplate.html |
| [Data Protection Policy](data-protection-policy.md) | Org-wide governance, principles, accountability | S.8 (Fiduciary obligations); S.10 | Recommended operating artifact; stronger governance for SDF readiness | https://www.dpdpa.com/templates/dataprotectionpolicytemplate.html |
| [Data Processing Agreement](data-processing-agreement.md) | Controls a Processor's handling of data on Fiduciary's behalf | S.8(2) (processing via processor only by contract) | Whenever a Data Processor is engaged | https://www.dpdpa.com/templates/dataprocessingtemplate.html |
| [Third-Party Vendor Agreement](third-party-vendor-agreement.md) | Vendor data-handling, security, breach reporting duties | S.8(2), S.8(5) (security safeguards) | When sharing personal data with any vendor | https://www.dpdpa.com/templates/thirdpartyvendoragreementtemplate.html |
| [Cross-Border Transfer Agreement](cross-border-transfer-agreement.md) | Lawful transfer of personal data outside India | S.16 (restriction on transfer); Rule 15 | When personal data leaves Indian territory | https://www.dpdpa.com/templates/crossborderdatatransferagreementtemplate.html |
| [Data Breach Response / Notice](data-breach-response.md) | Breach intimation to Board and affected principals | S.8(6) (report breach); Rule 7 | On any personal data breach | https://www.dpdpa.com/templates/noticeofdatabreachtemplate.html |
| [DSAR / Rights Request Form](dsar-request.md) | Mechanism for principals to exercise statutory rights | S.11-14 (access/correction/erasure/grievance/nomination); Rule 14 | All Data Fiduciaries | https://www.dpdpa.com/templates/datasubjectrightsrequestformtemplate.html |
| [Grievance Redressal](grievance-redressal.md) | Channel + timeline for principal complaints | S.13 (grievance redressal); S.8(10) | All Data Fiduciaries | https://www.dpdpa.com/templates/datasubjectrightsrequestformtemplate.html |
| [Cookie Policy](cookie-policy.md) | Disclosure of cookies/trackers + consent to set them | S.5 (Notice), S.6 (Consent) | Any site/app using cookies or similar trackers | https://www.dpdpa.com/templates/cookiepolicytemplate.html |
| [Employee Privacy Policy](employee-privacy-policy.md) | Lawful handling of employee personal data | S.8 (obligations); employment-purpose processing | Any organization with employees in India | https://www.dpdpa.com/templates/employeedataprotectionpolicytemplate.html |
| [DPIA / Privacy Impact Assessment](dpia.md) | Risk assessment for high-risk / SDF processing | S.10 (SDF obligations: DPIA + audit); Rule 13 | Significant Data Fiduciaries; high-risk processing | https://www.dpdpa.com/templates/privacyimpactassessmenttemplate.html |

**Statutory mapping summary** (Act -> Rules): Notice S.5->Rule 3, Consent S.6 / Consent Managers->Rule 4, Breach intimation S.8(6)->Rule 7, Retention/erasure S.8(7-8)->Rule 8, SDF/DPIA/audit S.10->Rule 13, Rights & grievance S.11-13->Rule 14, Cross-border S.16->Rule 15.

> Note: Section numbers for breach (S.8(6)) and rights/grievance follow the Act's Chapter II-III structure; some dpdpa.com pages cite a "72-hour" reporting figure - DPDP Rule 7 actually requires intimation **without delay** plus a detailed report to the Board within **72 hours** (or longer if the Board permits). Verify against the Rule text during audit.
