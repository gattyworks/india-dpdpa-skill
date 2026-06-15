# Cookie Policy

_Purpose: disclose cookies and similar trackers used on a site/app, their purposes, and how users can control or withdraw consent. DPDP mapping: S.5 (Notice), S.6 (Consent) — where cookies process personal data. Source: https://www.dpdpa.com/templates/cookiepolicytemplate.html. Paraphrased structure. Last verified: 2026-06-15._

**When required**
Any website or app using cookies, pixels, SDKs, or similar trackers that collect or process personal data. The DPDP Act does not have a standalone "cookie law," but where trackers process personal data, the Notice (S.5) and Consent (S.6) obligations apply — so non-essential trackers need informed, affirmative consent.

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
- Banner offers genuine granular choice (accept/reject/manage), not a consent-or-leave wall for non-essential cookies.
- Non-essential trackers do NOT fire before affirmative consent (check network tab / tag manager gating).
- A preference center where consent can be changed/withdrawn later.
- Consent state is logged and respected server-side and by the tag manager.
