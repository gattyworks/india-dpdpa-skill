# Extending the skill

`dpdp-india` is the first jurisdiction in the `gattyworks-compliance` family. The whole design is meant to be cloned: a country's law lives in versioned reference files, an audit playbook turns them into findings, and an update checker tells you when the law has drifted. This page covers the five ways the skill grows - a new jurisdiction, a corrected legal reference, a template note, a release, and the direction of the family.

This is an engineering aid, not legal advice. Everything here is about packaging and provenance; the legal substance still gets re-verified by a human (see [Legal and provenance](legal-and-provenance.md)).

Before contributing, read [`CONTRIBUTING.md`](../CONTRIBUTING.md) - it carries the binding ground rules. Legal claims cite a section/rule **and** a primary source; never paraphrase the law from memory; mark anything you can't fully verify as `(verify)`; and work in short-lived branches through pull requests against `main`.

## 1. Add a new jurisdiction

A sibling jurisdiction (say `gdpr-eu` or `ccpa-us`) is a new plugin in the same marketplace that mirrors `dpdp-india`'s structure one-for-one. Clone the shape, then refill the law.

### The structure to clone

```
.claude-plugin/marketplace.json        # add a plugins[] entry
plugins/<name>/
  .claude-plugin/plugin.json           # plugin manifest
  commands/                            # /<name>-audit, /<name>-update-check
  scripts/                             # check-updates.{py,ps1,sh} + sources.lock.json
  skills/<name>/
    SKILL.md                           # the audit playbook
    references/                        # the law, distilled
      templates/                       # paraphrased policy artifacts
```

The live example, top to bottom:

| Layer | File in `dpdp-india` |
|---|---|
| Marketplace entry | [`.claude-plugin/marketplace.json`](../.claude-plugin/marketplace.json) |
| Plugin manifest | [`plugins/dpdp-india/.claude-plugin/plugin.json`](../plugins/dpdp-india/.claude-plugin/plugin.json) |
| Audit playbook | [`plugins/dpdp-india/skills/dpdp-india/SKILL.md`](../plugins/dpdp-india/skills/dpdp-india/SKILL.md) |
| References | [`plugins/dpdp-india/skills/dpdp-india/references/`](../plugins/dpdp-india/skills/dpdp-india/references/) |
| Templates | [`plugins/dpdp-india/skills/dpdp-india/references/templates/`](../plugins/dpdp-india/skills/dpdp-india/references/templates/) |
| Update checker | [`plugins/dpdp-india/scripts/`](../plugins/dpdp-india/scripts/) |

### Steps

1. **Register the plugin.** Add an entry to the `plugins` array in `marketplace.json` - `name`, `source` (`./plugins/<name>`), `description`, `version` (`1.0.0` for a first release), and `keywords`. The marketplace `name` stays `gattyworks-compliance`; its `metadata.description` already promises "India (DPDP) first; more jurisdictions to follow."
2. **Write the plugin manifest.** `plugins/<name>/.claude-plugin/plugin.json` carries `name`, `description`, `version`, `author` (gattyworks), `homepage`/`repository`, `license` (MIT), and `keywords`. End the description with the same framing line: **Engineering aid, not legal advice.**
3. **Write `SKILL.md`.** Keep `dpdp-india`'s shape: YAML front matter (`name`, trigger-rich `description`), a four-pass audit method (scope → checklist → evidence → report), a fixed output format (verdict + risk table + findings by severity), a reference map table, a "Staying current" section that invokes the checker, and the disclaimer footer.
4. **Fill the references.** One file per topic, each with a dated source header and a primary-source citation. Carry the same backbone: a checklist engine, codebase detection patterns, the statutory index, the penalty schedule, rights, and a jurisdiction-to-jurisdiction comparison.
5. **Add the templates.** Paraphrased, attributed policy artifacts under `references/templates/`, with a `README.md` index - see rule 3 below.
6. **Add the commands.** Mirror [`dpdp-audit.md`](../plugins/dpdp-india/commands/dpdp-audit.md) and [`dpdp-update-check.md`](../plugins/dpdp-india/commands/dpdp-update-check.md), renamed to `/<name>-audit` and `/<name>-update-check`.
7. **Reuse the update checker.** Copy `scripts/check-updates.{py,ps1,sh}` verbatim - the logic is jurisdiction-agnostic. Only `sources.lock.json` changes: re-pin it to the new country's gazette, regulator, and secondary sources. See [Staying current](staying-current.md).

### Reuse branding and the update-checker

The update-checker scripts and the community-health/branding assets are family property, not India-specific. Copy the scripts unchanged. Reuse the branding system - banner, logo, social preview, and the standard health files (README, CONTRIBUTING, SECURITY, CODE_OF_CONDUCT, LICENSE) - adapting only the jurisdiction name and law. Keep the gattyworks owner block and the `github.com/gattyworks` URLs consistent across manifests so the family reads as one product.

## 2. Correct or add a legal reference

This is the highest-value contribution - accuracy beats everything. The law is a moving target: the DPDP Act 2023 (Act 22 of 2023) commences in phases and the DPDP Rules 2025 were notified only on 13 Nov 2025 (G.S.R. 846(E)).

| Do | Why |
|---|---|
| Cite the exact **section/rule number** and a **primary source** | Gazette, MeitY, or the notified Rules - never the law from memory |
| Keep the **dated source header** ("Last verified") accurate | The whole provenance chain hangs off it |
| Mark uncertainty as `(verify)` | Better an honest flag than a confident error |
| Run `check-updates.py --update` **after** re-verifying | Re-pins the hash so the checker stops flagging the source |
| Scope the change to one concern | Easier review; the PR checklist requires it |

Workflow: branch (e.g. `fix/rule-7-breach-timeline`), make the focused edit, update the dated header if you touched a reference, then re-verify against the upstream source **before** re-pinning. Only then run:

```
python scripts/check-updates.py --update
```

Open the PR against `main` with the sources you used. A maintainer re-verifies before merge. Re-pinning records *that* a source moved - a human still confirms *what* changed and whether the reference text is right. Details in [Staying current](staying-current.md) and [Legal and provenance](legal-and-provenance.md).

## 3. Add or change a template note

Templates are paraphrased reference artifacts, not legal documents. There are 13 today under `references/templates/`, indexed by [`templates/README.md`](../plugins/dpdp-india/skills/dpdp-india/references/templates/README.md).

The line that governs them:

- **Paraphrase and attribute.** Capture the substance in your own words and name the source. Never mirror commercial template text verbatim - that content is licensed, and copying it is both a legal and a provenance hazard.
- **Statutory text is quotable.** The Act, the Rules, and the Schedule are government work and may be quoted directly with a citation.
- **Cite like any reference.** A template that asserts a legal requirement carries the same section/rule + primary-source citation as a reference file, and the same `(verify)` flag when unsure.

When adding a template, register it in the templates `README.md` index and point at it from `SKILL.md`'s reference map and report step, so a gap the audit finds resolves to a concrete artifact (a missing privacy notice points at [`privacy-policy.md`](../plugins/dpdp-india/skills/dpdp-india/references/templates/privacy-policy.md)).

## 4. Versioning and release

The project uses semantic versioning and a Keep a Changelog-style [`CHANGELOG.md`](../CHANGELOG.md). The first release is `1.0.0` (2026-06-15).

Pick the bump:

| Change | Bump |
|---|---|
| Corrected/added law, a new template, a refined checklist item | patch / minor |
| New jurisdiction plugin, new commands, a breaking change to output or layout | minor / major |

Release steps:

1. Bump `version` in `plugins/<name>/.claude-plugin/plugin.json` and the matching `marketplace.json` entry (keep them in lockstep).
2. Add a dated `CHANGELOG.md` section under the new version - `Added` / `Changed` / `Fixed`, plus a `Notes` line for anything legal readers must know (e.g. a re-verification date or a phased-commencement caveat).
3. Merge to `main` through a PR.
4. Tag the release and publish it:

```
gh release create vX.Y.Z --title "vX.Y.Z" --notes-from-tag
```

Match the changelog and the release notes so the published artifact reads the same as the repo history.

## 5. The family vision

`gattyworks-compliance` is a country-by-country family: one marketplace, one branding system, one update-checker design, and one audit shape - refilled per jurisdiction. India (DPDP) ships first. The EU (GDPR) and US (CCPA and friends) are the natural siblings, each a peer plugin under the same marketplace rather than a fork.

The contract that makes them a family: every plugin distills primary law into dated, hash-pinned reference files; turns them into an evidence-backed audit; and stays honest about drift through the shared checker. Same engineering discipline, different statute. And always the same footer - engineering aid, not legal advice.

## See also

- [Staying current](staying-current.md) - the update checker and the re-pinning runbook.
- [Legal and provenance](legal-and-provenance.md) - sourcing rules, citation discipline, and the disclaimer.
