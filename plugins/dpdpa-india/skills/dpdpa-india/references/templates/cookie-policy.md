# Cookie Policy

_Purpose: disclose cookies and similar trackers used on a site/app, their purposes, and how users can control or withdraw consent. DPDP mapping: S.5 (Notice), S.6 (Consent), where trackers process personal data. Source: https://www.dpdpa.com/templates/cookiepolicytemplate.html. Paraphrased structure. Third-party structure and statutory mapping reviewed 2026-08-15._

**When required**
Future-phase readiness artifact as of 2026-08-15. The DPDP Act does not contain a standalone
cookie rule. Where a tracker processes personal data and no S.7 legitimate use applies, the S.5
notice and S.6 consent requirements are relevant. Other Indian or foreign rules may impose
additional requirements depending on the service and audience.

**Required clauses checklist** (paraphrased)
- Introduction and reference to the broader privacy notice.
- Definition of cookies and their classifications (essential, functional, analytics, advertising).
- Purposes for which each cookie category is used.
- Third-party cookies/technologies and the services behind them.
- How users manage preferences (consent banner controls, browser settings).
- Rights and consent: ability to withdraw consent at any time.
- Contact information for queries.

**Audit signals**
- A reachable `/cookie-policy` route, plus a cookie consent banner on first visit.
- Banner offers a usable choice (accept/reject/manage) when consent is the applicable basis.
- Non-essential trackers do NOT fire before affirmative consent (check network tab / tag manager gating).
- A preference center where consent can be changed/withdrawn later.
- Consent state is logged and respected server-side and by the tag manager.
