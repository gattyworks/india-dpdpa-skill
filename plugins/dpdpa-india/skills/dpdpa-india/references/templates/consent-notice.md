# Consent Notice / Consent Form

_Purpose: capture free, informed, specific, unambiguous, affirmative consent and deliver the itemized notice that must accompany it. DPDP mapping: S.5 (Notice), S.6 (Consent); Rule 3 (notice content). Source: https://www.dpdpa.com/templates/consentformfordataprocessingtemplate.html. Paraphrased structure. Third-party structure and statutory mapping reviewed 2026-08-15._

**When required**
Future-phase readiness artifact as of 2026-08-15. Use it whenever consent is the applicable basis
for processing rather than a legitimate use under S.7. Under S.6, consent must be free, specific,
informed, unconditional, unambiguous, given through a clear affirmative action, and limited to the
data necessary for the stated purpose. The notice must be itemized. The Data Principal must be
able to access it in English or any language specified in the Eighth Schedule to the Constitution.

**Required clauses checklist** (paraphrased)
- Itemized list of the personal data to be collected.
- Specific purpose for each item of data (no bundling of unrelated purposes).
- Statement that consent is the legal basis and is voluntary.
- Data Principal rights summary: withdraw consent (as easy as giving it), access, correction, erasure, grievance, nomination.
- How to withdraw consent and the consequence of withdrawal.
- Contact for the Data Protection Officer / grievance channel and the Data Protection Board complaint route.
- Affirmative opt-in mechanism (unticked box / explicit action) - no pre-checked boxes or implied consent.
- A way for the principal to access the notice in English or a chosen Eighth Schedule language.
- Consent declaration / signature or timestamped acceptance block.

**Audit signals**
- A consent capture UI with explicit affirmative action (unticked checkbox, not pre-consented).
- A consent log / audit table recording: principal ID, purpose, data items, timestamp, notice version, language, and withdrawal events.
- A working "withdraw consent" path that is no harder than granting it.
- Separate consent records per purpose (granularity), not one blanket flag.
- Notice text versioned and tied to each consent record.
