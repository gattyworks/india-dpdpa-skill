# DPDP Rules, 2025 — Reference

**Sources:** MeitY Gazette Notification G.S.R. 846(E), Digital Personal Data Protection Rules, 2025 (notified 13 Nov 2025); PIB release (17 Nov 2025); cross-verified against dpdpa.com rule pages, Latham & Watkins "DPDPA vs. GDPR" (Apr 2026), EY India, S.S. Rana & Co., Bar & Bench.
**Last verified: 2026-06-15**

## Status: NOTIFIED / FINAL (not draft)

- **Draft Rules:** published 3 Jan 2025 (consultation).
- **Final Rules:** **notified 13 November 2025** via Gazette G.S.R. 846(E). This is the operative text. The 3 Jan 2025 draft is superseded.
- The DPDP **Act, 2023** + these Rules together form the regime. MeitY has indicated residual gaps will be addressed via FAQs rather than amendments.

### Phased commencement (verify exact rule-citation dates against gazette)
| Phase | Effective | What comes into force |
|---|---|---|
| Immediate | 13 Nov 2025 | Rules 1–2 and ~17–21 — establishment & operationalisation of the Data Protection Board of India |
| +12 months | ~13 Nov 2026 | Rule 4 — Consent Manager registration regime |
| +18 months | **~13 May 2027** (LW cites "12 May 2027") | Substantive Data Fiduciary obligations (notice, security, breach, retention, children, SDF duties): Rules 3, 5–16, 22–23 |

Enforcement risk is low in the interim; the window is a transition period.

---

## 1. Notice / consent format & content (Rule ~3 / Second Schedule)

Notice must be given at or before seeking consent, in **clear and plain language**, **standalone** (distinct from other info), and must include:
- Categories of personal data collected.
- The **specified purpose**, with a specific description of the goods/services/functions enabled.
- **Itemised** description sufficient for informed consent.
- Mechanisms to (i) **withdraw consent**, (ii) exercise DPDPA rights, and (iii) **complain to the Data Protection Board**.
- A link/means to access the Consent Manager / data fiduciary platform.

Consent standard (Act §6): **free, specific, informed, unconditional, unambiguous, with clear affirmative action**, limited to the specified purpose. Data principal may access the consent request in **English or any of the 22 languages in the Eighth Schedule** of the Constitution. Withdrawal must be as easy as giving consent.

## 2. Consent Manager — registration & obligations (Rule 4 / First Schedule)

- Must be a **company incorporated in India**, registered with the Data Protection Board.
- **Net worth ≥ ₹2 crore** (verify exact figure against First Schedule) plus: sufficient technical/operational/financial capacity; corporate good standing and sound financial condition; adequate capital structure; fit-and-proper directors/KMP; conflict-of-interest provisions in corporate documents.
- Must operate an **accessible, transparent, interoperable platform** letting data principals give, review, manage, and withdraw consent.
- Must act in data principals' interest, maintain records, avoid conflicts with fiduciaries, and meet technical/organisational standards to be published by the Board.

## 3. Reasonable security safeguards (Rule 6) — outcome-based, technology-neutral

Apply to fiduciary **and** any processor (via contract). Enumerated measures:
- **(a) Encryption / obfuscation / masking / virtual tokens** mapped to the personal data.
- **(b) Access control** to the computer resources used by fiduciary/processor.
- **(c) Logging, monitoring and review** to detect, investigate, and remediate unauthorised access and prevent recurrence.
- **(d) Business continuity** — measures (including **data backups**) to keep processing if confidentiality/integrity/availability is compromised.
- **(e) Log + personal-data retention for ≥ 1 year** for detection/investigation/remediation.
- **(f) Contractual measures** binding data processors to take reasonable security safeguards.
- Reasonable technical/organisational measures to ensure effective observance.

## 4. Personal data breach intimation (Rule 7)

**No risk/materiality threshold — every personal data breach is reportable** (note divergence from GDPR's risk-based approach).

- **To affected Data Principals — without delay**, in their own interest, describing: nature/extent/timing of breach; likely consequences; mitigation measures taken by the fiduciary; safety steps the principal should take; contact point for queries.
- **To the Data Protection Board — two steps:**
  1. **Without delay** — initial intimation (description, nature, extent, timing, location, likely impact).
  2. **Within 72 hours of becoming aware** (extendable on Board's allowance) — detailed report: updated/broader facts; events/circumstances/reasons; mitigation measures; **remedial measures** to prevent recurrence; findings on the person who caused it; report on intimations given to principals.

> **Breach timeline (verified):** affected Data Principals — *without delay*; Data Protection Board — *without delay* (initial) **+ detailed report within 72 hours** of awareness.

## 5. Data retention / erasure time-limits (Rule 8 + Third Schedule)

- **General rule (Rule 8(1)):** erase personal data once the specified purpose is no longer served (and consent isn't the basis / no legal retention duty), i.e. when the principal neither seeks the service nor exercises rights within the applicable period.
- **48-hour pre-erasure notice (Rule 8(2)):** at least **48 hours** before erasure, the fiduciary must inform the principal (who can prevent erasure by logging in / re-engaging).
- **Log/data retention floor (Rule 8(3)):** retain personal data, traffic data, and processing logs **≥ 1 year** (for Seventh Schedule classes / security purposes).
- **Third Schedule — specified-purpose-expires-after-3-years classes** (data treated as no longer serving its purpose **3 years** after the principal's last engagement, then erase):

| Class | User threshold (India) |
|---|---|
| E-commerce entity | ≥ **2 crore (20 million)** registered users |
| Online gaming intermediary | ≥ **50 lakh (5 million)** registered users |
| Social media intermediary | ≥ **2 crore (20 million)** registered users |

> **Retention (verified):** 3-year retention cap for the three Third-Schedule fiduciary classes above; 48-hour pre-erasure notice; ≥1-year log/data floor under Rule 8(3).

## 6. Children's data — verifiable consent & age verification (Rule ~10 / Fourth Schedule)

- Child = **under 18**. Processing a child's (or a person-with-disability's) data requires **verifiable consent of the parent/lawful guardian** (Act §9).
- Verifiable consent requires the fiduciary to: (i) obtain parent/guardian consent; (ii) **confirm the consenter is an identifiable adult** using reliable identity & age details — e.g. government-issued ID held by the fiduciary, voluntarily provided, or via a **virtual token issued by an authorised entity / DigiLocker-type provider**; (iii) verify the parent–child relationship.
- **Prohibitions:** no processing detrimental to a child's well-being; **no behavioural tracking / no targeted advertising directed at children.**
- **Exemptions:** situation-specific carve-outs predominantly for **healthcare and educational institutions** processing children's data in a verifiably safe manner; government may extend exemptions to further classes (yet to be notified).

## 7. Significant Data Fiduciary (SDF) extra duties (Rule ~12–13)

Government designates SDFs by volume/sensitivity of data, risk to principals, sovereignty/integrity of India, electoral democracy, State security, public order. **(Specific designation list/criteria yet to be notified — verify.)** Additional duties:
- Appoint a **DPO based in India**, reporting to the board of directors; acts as grievance-redress contact.
- Conduct **DPIA + independent audit every 12 months**; auditor furnishes a report with significant observations to the Board.
- **Observe due diligence to verify that algorithmic software** used for processing is not likely to pose a risk to data principals' rights.
- **Cross-border restriction:** may be barred from transferring **specified categories of personal data and related traffic data** outside India (de facto localisation; categories to be notified). Reporting indicates SDFs are prohibited from transferring **traffic data** out of India.
- Appoint an **India-based representative** (the India DPO may fill this role).

## 8. Cross-border transfer rules (Rule ~14 / Act §16)

- **Permissive default:** transfers allowed to **any country except those on a government restricted-list** (no negative-list orders passed as of last verification — verify).
- Transfers must meet conditions set by the government via **general or special order** (none yet issued).
- **No adequacy-decision and no SCC-type mechanism** exists (unlike GDPR).
- SDFs additionally subject to the **localisation** restriction above for notified categories.

## 9. Data Protection Board — procedure highlights (Rules ~17–21)

- Board is **digital-by-design**; functions as an adjudicatory body. Operational rules in force since 13 Nov 2025.
- Data principal must **first exhaust the fiduciary's grievance-redressal** mechanism (resolution within **≤ 90 days**) before approaching the Board.
- Board may direct **urgent remedial/mitigation measures** on a breach.
- **Inquiry timeline:** ~6 months, extendable by ~3 months with recorded reasons (verify exact wording).
- **Appeals** lie to the **Telecom Disputes Settlement and Appellate Tribunal (TDSAT)** (verify rule/section citation).

## Penalties (Act, Schedule)

Per-instance financial penalties ranging from **₹50 crore (₹500 million) up to ₹250 crore (₹2.5 billion)** depending on the breach (e.g. up to ₹250 crore for failure to take reasonable security safeguards). **Turnover-percentage model NOT used** (contrast GDPR's 4%).

---

### Provisions still uncertain / not yet notified (flagged)
- SDF designation **list and detailed criteria** — not yet notified.
- Cross-border **restricted-country list** and transfer-condition orders — not yet issued.
- Specific **categories** subject to SDF localisation — to be notified.
- Consent-Manager net-worth exact figure and Board technical standards — **verify** against First Schedule text.
- Exact rule numbers for notice/children/transfer/Board sourced partly from secondary analyses — **verify against the gazette** before relying for legal advice.
