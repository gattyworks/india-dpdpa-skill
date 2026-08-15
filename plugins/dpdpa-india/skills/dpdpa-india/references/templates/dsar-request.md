# DSAR / Data Principal Rights Request Form

_Purpose: a structured intake form letting a Data Principal exercise statutory rights, with identity verification and tracking. DPDP mapping: S.11 (right to access info), S.12 (right to correction/completion/erasure), S.13 (right to grievance redressal), S.14 (right to nominate); Rule 14 (rights mechanism). Source: https://www.dpdpa.com/templates/datasubjectrightsrequestformtemplate.html. Paraphrased structure. Third-party structure and statutory mapping reviewed 2026-08-15._

**When required**
This is a future-phase readiness artifact as of 2026-08-15. Once the relevant provisions commence,
Data Fiduciaries must publish a readily available means for principals to make rights requests.
The same form may also serve the consent-withdrawal and grievance routes.

**Required clauses / fields checklist** (paraphrased)
- Requester contact information.
- Relationship with the organization (customer, employee, etc.).
- Right(s) being exercised: access (summary of data + identities of third parties it's shared with), correction/completion, erasure, consent withdrawal, nomination, grievance.
- Request details / specifics of the data concerned.
- Identity verification step (to prevent fraudulent requests) without collecting excess data.
- Authorized representative / nominee section (for death or incapacity).
- Declaration of accuracy.
- Submission details and acknowledgement.
- Internal "company use" block: tracking reference, received date, due date, status.

**Audit signals**
- A discoverable rights-request route/form (`/data-request`, `/privacy/requests`, or clearly stated email).
- Covers the full S.11-14 set including nomination - not just GDPR access/erasure.
- A request-tracking system (ticket queue or DB table) with reference IDs, timestamps, and SLA/due dates.
- Identity-verification step that is proportionate.
- Evidence requests are fulfilled within the published period, which Rule 14 caps at 90 days (logs of completed requests).
- Access response includes the identities of third parties data was shared with (S.11 specific).
