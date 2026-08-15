# Extending the skill

This public repository has one canonical playbook. Extend it without creating a second legal
corpus or a host-specific fork.

## Change a legal reference

1. Start with the primary source.
2. Cite the exact section, rule, schedule, or notification.
3. Check the commencement phase.
4. Update every dependent file listed in `sources.lock.json`.
5. Update `Last reviewed` only on files you checked.
6. Run the source checker and link checks.
7. Use a pull request against `main`.

Do not re-pin a changed source before reviewing it. Do not use a secondary article to override the
gazette.

## Change a checklist item

The canonical catalog has 49 IDs, A1 to J5. Preserve IDs when refining wording. An ID change is a
breaking report-contract change and requires a major version.

For each check, confirm:

- the legal cite;
- the commencement phase;
- whether it is a statutory duty or an engineering control;
- the default severity;
- the evidence pattern; and
- the remediation artifact.

Update `audit-checklist.md`, `report-format.md`, examples, and affected docs together.

## Change a template specification

Template files are expected-artifact specifications. They are not legal documents ready for
production use.

Keep third-party structure paraphrased and attributed. Add a primary cite for every legal claim.
Register a new artifact in `templates/README.md` and the canonical `SKILL.md` reference map.

## Add a host entry point

Host entry points must delegate to
[`plugins/dpdpa-india/skills/dpdpa-india/SKILL.md`](../plugins/dpdpa-india/skills/dpdpa-india/SKILL.md).
Do not copy the reference tree into a Claude, Codex, or another host directory.

The current host paths are:

- Claude Code: `plugins/dpdpa-india/`
- Codex: `.agents/skills/dpdpa-india/SKILL.md`

## Versioning

| Change | Version effect |
|---|---|
| Typo or source-date correction with no audit result change | patch |
| New check, evidence pattern, or artifact with compatible output | minor |
| Renamed path, changed ID, changed status contract, or incompatible output | major |

The rename from `dpdp-india` to `dpdpa-india` and the readiness-status contract make the next
release a major version.

Before a release:

1. Complete the legal-source runbook.
2. Keep plugin and marketplace versions identical.
3. Update `CHANGELOG.md` from actual commits.
4. Test Claude and Codex entry points.
5. Confirm the repository and install links are public and accurate.
6. Confirm no customer data, credentials, or private audit reports are included.
7. Create the tag and release only after approval.

Do not change the MIT license as part of a normal release. That needs a separate legal and product
decision.
