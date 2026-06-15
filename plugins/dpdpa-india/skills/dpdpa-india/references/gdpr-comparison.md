# GDPR vs DPDP (India) - Side-by-Side

**Sources:** Latham & Watkins, *India's Digital Personal Data Protection Act 2023 vs. the GDPR: A Comparison* (April 2026) - local copy at `sources/lw-dpdp-vs-gdpr.pdf`; DPDP Act 2023; DPDP Rules 2025 (notified 13 Nov 2025); EU/UK GDPR.
**Last verified: 2026-06-15**
**Status:** DPDP Rules are FINAL/NOTIFIED (13 Nov 2025); substantive obligations phase in by ~13 May 2027.

| Dimension | GDPR | DPDP (India) |
|---|---|---|
| **Territorial scope** | Establishment in EU/UK; or offering goods/services to, or monitoring, data subjects in EU/UK. Applies to digital **and** non-digital personal data. | Processing of **digital** personal data in India; extraterritorial where processing relates to **offering goods/services to data principals in India**. Excludes purely offline data and **publicly available** data. |
| **Lawful bases** | **Six**: consent, contract, legal obligation, vital interests, public task, **legitimate interests**. | **Consent** **or** enumerated **"legitimate uses"** (voluntary sharing, legal compliance/court orders, **employment**, medical emergency, epidemic/disaster, State functions). **No contractual-necessity and no legitimate-interests basis.** |
| **Consent standard** | Freely given, specific, informed, unambiguous; explicit for special categories. | Free, specific, informed, **unconditional**, unambiguous, clear affirmative action; granular per purpose; withdrawal as easy as giving. Multi-language (22 scheduled languages). |
| **Data subject / principal rights** | Access, rectification, erasure, restriction, **objection**, **portability**, **not to be subject to automated decisions**. | Access (summary), correction/completion/update, erasure, **grievance redressal**, **nomination** (rights on death/incapacity). **No** portability, **no** right to object/restrict, **no** automated-decision right. |
| **DPO requirement** | Mandatory if public authority, large-scale systematic monitoring, or large-scale special-category processing. | **All fiduciaries** must publish a contact (DPO or responsible person). **SDFs** must appoint an **India-based DPO** reporting to the board. |
| **Breach-notification timeline** | To supervisory authority **within 72 hours** (unless unlikely to risk rights); to data subjects **without undue delay** if **high risk**. | **No risk threshold - all breaches reportable.** To **Data Principals: without delay**. To **Board: without delay (initial) + detailed report within 72 hours**. |
| **DSAR / response timeline** | Generally **1 month** (extendable +2). | No fixed statutory access SLA; **grievance redressal ≤ 90 days**; rights actioned on request. |
| **Cross-border transfer model** | Adequacy decisions, SCCs/BCRs + transfer impact assessment + supplementary measures. | **Permissive blacklist**: allowed to all countries **except** a government restricted-list (none yet); conditions via government order (none yet). **No adequacy, no SCCs.** SDFs may face **localisation** for notified categories (incl. traffic data). |
| **Penalties** | Up to **€20m or 4% of global annual turnover**, whichever higher. | Fixed-rupee schedule: **₹50 crore-₹250 crore** per breach type (up to **₹250 crore / ₹2.5bn** for security-safeguard failure). **No turnover %.** |
| **Regulator** | Independent **Supervisory Authority** (DPA) per member state; EDPB at EU level. | **Data Protection Board of India** (adjudicatory, digital-by-design); appeals to **TDSAT** (verify). Must exhaust fiduciary grievance redressal first. |
| **Special categories** | Distinct **special-category** regime (health, biometric, race, religion, sex life, etc.) with heightened conditions. | **NO special-category concept** - all personal data treated uniformly. **⚠ Flag:** DPDP does not recognise sensitive/special data; children's data is the main heightened-protection carve-out. |
| **Records of processing (ROPA)** | Article 30 ROPA required. | Not required under DPDP (SDFs do DPIAs/audits instead). |
| **Children** | Varies by member state (commonly 13-16); ISS consent rules. | **Under 18**; **verifiable parental consent**; **no behavioural tracking / targeted ads** at children. Stricter and higher age than most GDPR regimes. |

## If you're already GDPR-compliant - what's still missing for DPDP

1. **Re-paper your lawful bases.** Anything you run on **legitimate interests** or **contractual necessity** has no DPDP equivalent - re-map to **consent** or an enumerated **legitimate use**, or stop. Highest-impact gap.
2. **Report every breach (no threshold).** Adjust runbooks: Data Principals *without delay*, Board *without delay + detailed report within 72h* - regardless of harm/magnitude. Your GDPR risk-gating won't satisfy DPDP.
3. **Stand up an India-based DPO + local representative** if you're (or may be) a Significant Data Fiduciary; ensure board-level reporting.
4. **Children at <18 with verifiable parental consent** and **age verification** (gov ID / virtual token / DigiLocker-type) - far stricter than GDPR; ban targeted ads and behavioural tracking of children.
5. **Consent Manager interoperability** - a uniquely Indian construct; build for principals electing a registered Consent Manager.
6. **Localisation readiness** - SDFs may not transfer notified categories / **traffic data** out of India; watch the (still-unissued) restricted-country list rather than relying on adequacy/SCCs.
7. **Multi-language consent/notice** across the 22 scheduled languages.
8. **Third-Schedule retention caps** (3-year auto-erasure + 48-hour pre-erasure notice) for large e-commerce/gaming/social-media - automate deletion; GDPR has no analogous fixed cap.
9. **Grievance redressal ≤ 90 days** with published mechanism; principal must exhaust it before the Board.
10. **Nomination right** - let principals nominate someone to exercise rights on death/incapacity (no GDPR equivalent).
