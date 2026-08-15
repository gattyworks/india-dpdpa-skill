# Reference library

The canonical references live under
[`plugins/dpdpa-india/skills/dpdpa-india/references/`](../plugins/dpdpa-india/skills/dpdpa-india/references/).
The skill reads them on demand.

Source dates belong to each file. Do not assume one review date applies to the full library.

## Audit core

| File | Purpose |
|---|---|
| [`audit-checklist.md`](../plugins/dpdpa-india/skills/dpdpa-india/references/audit-checklist.md) | 49 canonical checks, IDs A1 to J5, with default severity |
| [`report-format.md`](../plugins/dpdpa-india/skills/dpdpa-india/references/report-format.md) | Fixed report fields, statuses, verdicts, and worked example |
| [`code-patterns.md`](../plugins/dpdpa-india/skills/dpdpa-india/references/code-patterns.md) | Repository searches for evidence leads |

The checklist distinguishes a current gap from a readiness gap. A search match is a lead, not a
verdict. A missing repository control can support `not found` evidence only after a scoped search.
Use `Needs review` when the control may exist in operations, contracts, or another system.

## Primary-law references

| File | Coverage |
|---|---|
| [`act-2023.md`](../plugins/dpdpa-india/skills/dpdpa-india/references/act-2023.md) | Act structure, scope, definitions, and commencement note |
| [`rules-2025.md`](../plugins/dpdpa-india/skills/dpdpa-india/references/rules-2025.md) | Final Rules, corrigendum, phases, Board status, and current unknowns |
| [`consent-notice.md`](../plugins/dpdpa-india/skills/dpdpa-india/references/consent-notice.md) | Sections 4 to 7 and notice or consent flow |
| [`fiduciary-obligations.md`](../plugins/dpdpa-india/skills/dpdpa-india/references/fiduciary-obligations.md) | Sections 8 to 10 and 16 |
| [`data-principal-rights.md`](../plugins/dpdpa-india/skills/dpdpa-india/references/data-principal-rights.md) | Sections 11 to 15 |
| [`penalties-schedule.md`](../plugins/dpdpa-india/skills/dpdpa-india/references/penalties-schedule.md) | Schedule caps and section 33 factors |

The final Rules, corrigendum, commencement notification, and Board notices are pinned as official
MeitY PDFs. See [Legal sources and provenance](legal-and-provenance.md).

## Context references

| File | Coverage |
|---|---|
| [`gdpr-comparison.md`](../plugins/dpdpa-india/skills/dpdpa-india/references/gdpr-comparison.md) | GDPR and DPDPA differences; secondary comparison plus primary law |
| [`legal-context.md`](../plugins/dpdpa-india/skills/dpdpa-india/references/legal-context.md) | Indian constitutional, IT, CERT-In, and sector context |
| [`disclaimer.md`](../plugins/dpdpa-india/skills/dpdpa-india/references/disclaimer.md) | Use limits, no legal advice, and license notice |

These files help with context. They do not replace a current primary source.

## Policy-artifact specifications

[`references/templates/`](../plugins/dpdpa-india/skills/dpdpa-india/references/templates/) contains
13 paraphrased specifications:

- privacy policy;
- consent notice;
- cookie policy;
- data retention policy;
- data protection policy;
- data processing agreement;
- third-party vendor agreement;
- cross-border transfer agreement;
- data breach response;
- rights-request form;
- grievance redressal;
- employee privacy policy; and
- DPIA.

These are expected-artifact specifications, not production-ready legal documents. Their legal claims
need primary citations. Their commercial source structure remains paraphrased and attributed.

The index is
[`templates/README.md`](../plugins/dpdpa-india/skills/dpdpa-india/references/templates/README.md).
The source site lists 12 pages because the rights-request and grievance specifications share one
underlying page.

## Maintenance rule

Run the source checker before use. Then inspect the official MeitY DPDP Rules page for new URLs.
A successful hash check does not discover newly published notifications.

This library is an engineering aid, not legal advice.
