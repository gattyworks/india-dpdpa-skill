# Consent Notice / Consent Form

_Purpose: capture free, informed, specific, unambiguous, affirmative consent and deliver the itemized notice that must accompany it. DPDP mapping: S.5 (Notice), S.6 (Consent); Rule 3 (notice content). Source: https://www.dpdpa.com/templates/consentformfordataprocessingtemplate.html. Paraphrased structure. Last verified: 2026-06-15._

**When required**
Whenever consent is the lawful basis for processing (i.e., not a "legitimate use" under S.7). Under S.6 consent must be free, specific, informed, unconditional, unambiguous, with a clear affirmative action, and limited to the data necessary for the stated purpose. The accompanying notice (S.5 / Rule 3) must be itemized and available in English plus the Eighth Schedule languages.

**Required clauses checklist** (paraphrased)
- Itemized list of the personal data to be collected.
- Specific purpose for each item of data (no bundling of unrelated purposes).
- Statement that consent is the legal basis and is voluntary.
- Data Principal rights summary: withdraw consent (as easy as giving it), access, correction, erasure, grievance, nomination.
- How to withdraw consent and the consequence of withdrawal.
- Contact for the Data Protection Officer / grievance channel and the Data Protection Board complaint route.
- Affirmative opt-in mechanism (unticked box / explicit action) - no pre-checked boxes or implied consent.
- Reference to availability of the notice in the principal's chosen language (English + Eighth Schedule languages).
- Consent declaration / signature or timestamped acceptance block.

**Audit signals**
- A consent capture UI with explicit affirmative action (unticked checkbox, not pre-consented).
- A consent log / audit table recording: principal ID, purpose, data items, timestamp, notice version, language, and withdrawal events.
- A working "withdraw consent" path that is no harder than granting it.
- Separate consent records per purpose (granularity), not one blanket flag.
- Notice text versioned and tied to each consent record.
