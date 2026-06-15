# dpdp-india (plugin)

Audit an app, codebase, or data flow against **India's Digital Personal Data Protection Act 2023
+ DPDP Rules 2025**. Part of the `gattyworks-compliance` marketplace.

## Install

```bash
/plugin marketplace add gattyworks/dpdp-india
/plugin install dpdp-india@gattyworks-compliance
```

## Use

- `/dpdp-audit [path]` — run a compliance audit (defaults to the current repo).
- `/dpdp-update-check` — check whether the upstream legal sources changed.
- Or just ask: *"audit this app for DPDP / Indian data-protection compliance."*

## Layout

```
.claude-plugin/plugin.json     # plugin manifest
commands/                      # /dpdp-audit, /dpdp-update-check
scripts/                       # check-updates.{py,ps1,sh} + sources.lock.json
skills/dpdp-india/
  SKILL.md                     # the audit playbook (entry point)
  references/                  # Act, Rules, checklist, code patterns, templates, GDPR map
```

The skill is portable — the `skills/dpdp-india/` folder works in any agent that reads
`SKILL.md` + markdown references, not just Claude Code.

See the [repository README](../../README.md) for the full picture, sources, and disclaimer.
