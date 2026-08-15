# dpdpa-india docs

`dpdpa-india` is an open-source GattyWorks skill for Claude Code, Codex, ChatGPT, Hermes Agent,
and compatible Agent Skills hosts. It audits an app, codebase, or data flow against India's
**DPDP Act 2023** and **DPDP Rules 2025**. It separates current gaps from readiness gaps, cites
exact source locations, and uses fixed issue IDs. It is an engineering aid, not legal advice.

These pages are the developer documentation. For installing and invoking the skill, start with [Usage](usage.md).

## Start here

Read in this order:

1. [Architecture](architecture.md) - what the repo is and how the plugin, skill, commands, and scripts fit together.
2. [Usage](usage.md) - access it, run `/dpdpa-audit`, trigger it from natural language, or use the Codex entry point.
3. [Audit method](audit-method.md) - how the audit actually works: the four passes from scope to report.

## All pages

| Page | What's in it |
|---|---|
| [Architecture](architecture.md) | Directory tree, Claude and Codex entry points, progressive disclosure, and the canonical playbook. |
| [Audit method](audit-method.md) | The four-pass method - scope, run the checklist, find the evidence, report - plus the output format and severity-to-penalty mapping. |
| [Reference library](reference-library.md) | A guided tour of every reference file: what's inside, when the skill reads it, and where the content comes from. |
| [Usage](usage.md) | Install commands, natural-language triggers, Codex use, and a worked session. |
| [Staying current](staying-current.md) | The `check-updates` drift checker, `sources.lock.json`, the three script variants, and the re-pinning runbook. |
| [v2.0.0 release plan](release-plan-v2.md) | Versioned release gates, migration, public-content boundaries, and target sequence. |
| [Extending the skill](extending.md) | Correcting a legal reference, changing a template, packaging, and release rules. |
| [Legal and provenance](legal-and-provenance.md) | Source-to-file provenance, copyright posture, the verification model, and the disclaimer rationale. |
| [FAQ & troubleshooting](faq.md) | Quick answers - is it legal advice, does it send data anywhere, SDF designation, Windows/PowerShell troubleshooting, how penalties are mapped. |

## How it fits together

The plugin is three nested layers - marketplace, plugin, then the skill/commands/scripts that carry the behavior; [Architecture](architecture.md) maps them end to end. Every audit follows a fixed [report contract](../plugins/dpdpa-india/skills/dpdpa-india/references/report-format.md) so results return the same fields and issue IDs run to run. For the repo as a whole, see the [project README](../README.md).

---

Engineering aid, not legal advice - have a qualified Indian data-protection practitioner review your situation before relying on any result.
