# Legal sources and provenance

The skill uses primary government text for legal claims. Secondary material can help find a topic
or compare regimes, but it cannot override the Act, final Rules, corrigendum, or commencement
notifications.

Last legal-source baseline check: 2026-08-15. Engineering aid, not legal advice.

## Primary baseline

| Source | Use |
|---|---|
| [DPDP Act 2023](https://www.meity.gov.in/static/uploads/2024/06/2bf1f0e9f04e6fb4f8fef35e82c42aa5.pdf) | Sections, definitions, rights, duties, penalties |
| [DPDP Rules 2025](https://www.meity.gov.in/static/uploads/2025/11/53450e6e5dc0bfa85ebd78686cadad39.pdf) | Operational rules and schedules |
| [Rules corrigendum](https://www.meity.gov.in/static/uploads/2025/12/3c7ebbae0e5456f493f486e6845df86b.pdf) | Corrected gazette wording and references |
| [Act commencement notification](https://www.meity.gov.in/static/uploads/2025/11/c56ceae6c383460ca69577428d36828b.pdf) | Provision-by-provision phases |
| [Board establishment](https://www.meity.gov.in/static/uploads/2025/11/cc217843dc3bcb37b2b05bcc3b4e031f.pdf) | Board establishment and location |
| [Board member-count notice](https://www.meity.gov.in/static/uploads/2025/11/f6c0837972422cf79d890bfe84cc04d6.pdf) | Notified member count |
| [May 2026 recruitment notice](https://www.meity.gov.in/static/uploads/2026/05/53b1bcf01cab9a0adde463e73fbc3417.pdf) | Current Board staffing evidence |

The exact URLs, hashes, and secondary-page reachability checks are in
[`sources.lock.json`](../plugins/dpdpa-india/skills/dpdpa-india/scripts/sources.lock.json).

## Reference ownership

Act references derive from the Act PDF. Rules, checklist, and phase claims derive from the final
Rules, corrigendum, and commencement notification. Board status claims derive from the Board
notices.

The GDPR comparison uses the Act and Rules plus a pinned Latham & Watkins comparison. Template
specifications use paraphrased structure from the cited third-party pages. They are not copies of
commercial template text.

## Currentness model

The checker answers one question: did a stable source's bytes change, or did a secondary page
become unreachable?

It does not answer these questions:

- Did MeitY publish a new notification at a new URL?
- Did a Board page publish a new standard or operating channel?
- Did another regulator add a sector rule?
- Is the interpretation in a reference still correct?

The maintenance runbook therefore has two parts:

1. Run the source checker.
2. Review the official MeitY DPDP Rules page and relevant regulator pages for new documents.

A successful source check is an integrity signal. It is not a complete legal update search.

## Copyright posture

Government statutory text can be quoted with attribution. Third-party analysis and commercial
templates are paraphrased and attributed. Do not mirror commercial source text.

## Disclaimer and license

The skill reports likely engineering gaps. It does not provide legal advice or create a
lawyer-client relationship. A qualified Indian data-protection practitioner must review a real
system before anyone relies on the result.

The repository is public under the MIT license. Any future license change needs a separate legal
and product decision and does not cancel rights already granted under an earlier version.

See [Staying current](staying-current.md) and the canonical
[disclaimer](../plugins/dpdpa-india/skills/dpdpa-india/references/disclaimer.md).
