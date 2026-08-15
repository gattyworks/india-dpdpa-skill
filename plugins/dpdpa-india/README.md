# dpdpa-india (plugin)

Open-source GattyWorks audit for an app, codebase, or data flow under **India's Digital Personal Data
Protection Act 2023 + DPDP Rules 2025**. It has 49 checks across 10 dimensions and 13
policy-artifact specifications.

## Install in Claude Code

```bash
/plugin marketplace add gattyworks/india-dpdpa-skill
/plugin install dpdpa-india@gattyworks-compliance
```

## Use

- `/dpdpa-audit [path]` - run a compliance audit (defaults to the current repo).
- `/dpdpa-update-check` - check whether the upstream legal sources changed.
- Or just ask: *"audit this app for DPDP / Indian data-protection compliance."*

## Layout

```
.claude-plugin/plugin.json     # plugin manifest
commands/                      # /dpdpa-audit, /dpdpa-update-check
skills/dpdpa-india/
  SKILL.md                     # the audit playbook (entry point)
  agents/openai.yaml           # Codex and ChatGPT presentation metadata
  assets/saakshi.svg           # skill icon
  references/                  # Act, Rules, checklist, code patterns, templates, GDPR map
  scripts/                     # check-updates.{py,ps1,sh} + sources.lock.json
```

The `skills/dpdpa-india/` folder is a self-contained Agent Skills bundle. Claude Code, Codex,
ChatGPT, Hermes Agent, and compatible harnesses can use the same playbook and references.

See the [repository README](../../README.md) for the full picture, sources, and disclaimer.
