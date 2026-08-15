# AI guide for the DPDPA audit skill

This folder is a short entry point. The canonical instructions are in
[`plugins/dpdpa-india/skills/dpdpa-india/SKILL.md`](../plugins/dpdpa-india/skills/dpdpa-india/SKILL.md).
Read that file and its references before you audit or change a system.

## Use this repository when

- a product processes digital personal data for people in India;
- a team wants a DPDPA readiness or current-compliance audit;
- a team needs evidence for consent, security, breach, rights, retention, child-data, SDF, or transfer controls; or
- a team needs a DPDPA-aligned policy artifact.

## Engineering rules

1. Check the commencement phase before you call a control a current legal duty.
2. Map each processing purpose to consent or a listed legitimate use.
3. Ask only for personal data necessary for a consent-based specified purpose.
4. Restrict and log access to personal data.
5. Build erasure with legal holds, processor propagation, and backup-expiry handling. Do not promise immediate deletion of every copy.
6. Do not claim a DPDPA data-portability right. Section 11 gives an access right, not a general portability right.
7. Cite a primary source and a section or rule for every legal claim.

## Examples

For a signup flow, inspect the notice, consent action, purpose and data list, withdrawal path, child scope, and evidence record.

For a deletion flow, inspect identity checks, primary stores, processors, legal retention, backups, completion evidence, and user communication.

For a breach flow, inspect detection, containment, evidence preservation, affected-person notices, Board reporting, and overlapping CERT-In duties.

This repository is an engineering aid. It is not legal advice. A qualified Indian data-protection practitioner must review production decisions.
