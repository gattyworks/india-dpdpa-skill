# Indian Legal Context for a DPDP App Audit

**Sources:** Supreme Court of India judgments; Information Technology Act 2000 + SPDI Rules 2011; CERT-In Directions (28 Apr 2022, No. 20(3)/2022-CERT-In); RBI data-localisation directive (2018); DPDP Act 2023 + Rules 2025. Cross-checked against Latham & Watkins (Apr 2026) endnotes.
**Last verified: 2026-06-15**
**Status note:** DPDP Rules are FINAL/NOTIFIED (13 Nov 2025) but substantive obligations phase in by ~13 May 2027 - so the predecessor regime below remains partly operative in the interim.

## Constitutional foundation
- **Justice K.S. Puttaswamy (Retd.) v. Union of India (2017)** - 9-judge Supreme Court bench held the **right to privacy is a fundamental right** under Article 21. *Audit takeaway:* privacy is constitutionally protected, so data-handling failures carry weight beyond statutory penalties; the DPDP regime is the legislative response this judgment demanded.

## Predecessor / still-operative regime
- **IT Act 2000 43A + SPDI Rules 2011** - required "reasonable security practices" and consent for **Sensitive Personal Data or Information (SPDI)** (passwords, financial, health, biometric, sexual orientation, etc.). *Audit takeaway:* until DPDP substantive provisions fully commence (~May 2027), **SPDI Rules still apply** - an app handling SPDI should meet both; DPDP will eventually displace this (and notably **drops the special-category concept**).
- **IT Act 79 + Intermediary Rules 2021** - intermediary due-diligence/safe-harbour. *Takeaway:* relevant for platforms/social-media apps; overlaps with DPDP fiduciary duties.

## Incident-reporting overlay (applies ALONGSIDE DPDP)
- **CERT-In Directions, 28 Apr 2022** - mandatory reporting of specified **cyber incidents within 6 hours** of noticing; plus log retention (180 days, India) and KYC/time-sync (NTP) obligations. *Audit takeaway:* the **6-hour CERT-In clock is separate from and tighter than** DPDP's breach timeline (without delay / 72h to the Board) - a breach can trigger **both**; build a dual-track notification runbook.

## Sectoral overlays
- **RBI Storage of Payment System Data (Apr 2018)** - payment data must be **stored only in India** (localisation). *Takeaway:* fintech/payment apps face localisation independent of DPDP; reconcile with DPDP cross-border rules.
- **Other sectoral regulators** (SEBI, IRDAI, telecom/DoT, account-aggregator framework) impose their own data and security norms. *Takeaway:* identify the app's sector; DPDP is a floor, not a ceiling.

## Case-law maturity
- **Formal DPDP case law is minimal** - the Act is newly commencing (Rules notified Nov 2025; full enforcement ~May 2027) and the Data Protection Board's adjudication is only now operationalising. *Audit takeaway:* base assessments on the **statutory text + MeitY FAQs**, the Puttaswamy privacy principles, and analogous SPDI/CERT-In practice - not on DPDP precedent, which does not yet meaningfully exist.
