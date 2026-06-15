# dpdp-india docs

`dpdp-india` is a Claude Code plugin and portable AI skill that audits an app, codebase, or data flow against India's **DPDP Act 2023** (Act 22 of 2023) and the **DPDP Rules 2025** (G.S.R. 846(E)). It surfaces *likely* compliance gaps with `file:line` evidence, a section/rule cite, and the fix that closes each one. It is an engineering aid, not legal advice.

These pages are the developer documentation. For installing and invoking the skill, start with [Usage](usage.md).

## Start here

Read in this order:

1. [Architecture](architecture.md) - what the repo is and how the plugin, skill, commands, and scripts fit together.
2. [Usage](usage.md) - install it, run `/dpdp-audit`, trigger it from natural language, or run it in another harness.
3. [Audit method](audit-method.md) - how the audit actually works: the four passes from scope to report.

## All pages

| Page | What's in it |
|---|---|
| [Architecture](architecture.md) | Directory tree, the three nested layers, how Claude Code discovers and loads it, progressive disclosure, and why the skill folder is portable on its own. |
| [Audit method](audit-method.md) | The four-pass method - scope, run the checklist, find the evidence, report - plus the output format and severity-to-penalty mapping. |
| [Reference library](reference-library.md) | A guided tour of every reference file: what's inside, when the skill reads it, and where the content comes from. |
| [Usage](usage.md) | Install, the `/dpdp-audit` and `/dpdp-update-check` commands, natural-language triggers, running it outside Claude Code, and a worked session. |
| [Staying current](staying-current.md) | The `check-updates` drift checker, `sources.lock.json`, the three script variants, and the re-pinning runbook. |
| [Extending the skill](extending.md) | Adding a jurisdiction, correcting a legal reference, template rules, versioning/release, and the `gattyworks-compliance` family vision. |
| [Legal and provenance](legal-and-provenance.md) | Source-to-file provenance, copyright posture, the verification model, and the disclaimer rationale. |
| [FAQ & troubleshooting](faq.md) | Quick answers - is it legal advice, does it send data anywhere, SDF designation, Windows/PowerShell troubleshooting, how penalties are mapped. |

## How it fits together

The plugin is three nested layers - marketplace, plugin, then the skill/commands/scripts that carry the behavior; [Architecture](architecture.md) maps them end to end. For the repo as a whole, see the [project README](../README.md).

---

Engineering aid, not legal advice - have a qualified Indian data-protection practitioner review your situation before relying on any result.
