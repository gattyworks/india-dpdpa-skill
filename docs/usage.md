# Usage

`dpdpa-india` is an open-source GattyWorks skill. The legal-source
baseline was checked on 2026-08-15.

## Before each audit

1. Run the source checker.
2. Review the official MeitY DPDP Rules page for new notifications.
3. Read the phase table in `rules-2025.md`.
4. Choose `Current compliance` or `Readiness` mode.

Most product-facing duties are in the eighteen-month phase as of 2026-08-15. Do not call a
readiness gap a current violation.

## Claude Code

Add the public marketplace and plugin:

```bash
/plugin marketplace add gattyworks/india-dpdpa-skill
/plugin install dpdpa-india@gattyworks-compliance
```

Commands:

| Command | Argument | Default | Result |
|---|---|---|---|
| `/dpdpa-audit` | path or scope | current working directory | Runs the fixed audit workflow |
| `/dpdpa-update-check` | none | - | Checks pinned source hashes and reachability |

Examples:

```bash
/dpdpa-audit .
/dpdpa-audit ./api
/dpdpa-audit "the signup and analytics flow"
```

The update command uses `${CLAUDE_PLUGIN_ROOT}` to locate the bundled script.

## Codex

Codex discovers [`.agents/skills/dpdpa-india/SKILL.md`](../.agents/skills/dpdpa-india/SKILL.md)
from this repository. The entry point delegates to the same canonical playbook as the Claude
plugin.

Ask:

```text
Use the dpdpa-india skill to run a readiness audit of this repository.
```

For another harness, load
[`plugins/dpdpa-india/skills/dpdpa-india/SKILL.md`](../plugins/dpdpa-india/skills/dpdpa-india/SKILL.md)
and follow its relative reference links. Keep the canonical playbook and source citations together.

## Source checker

From the repository root:

```bash
python plugins/dpdpa-india/scripts/check-updates.py
```

Exit codes:

| Code | Meaning |
|---|---|
| 0 | Current, or update completed |
| 1 | A known source changed |
| 2 | Check incomplete because a source failed |

Use `--update` only after you review the changed source and every dependent reference. The checker
will not write a partial baseline when any fetch fails.

## Report shape

Every report uses the canonical IDs A1 to J5 and these statuses:

- `✅ Compliant`
- `⚠️ Gap` for an applicable in-force requirement
- `~ Readiness gap` for a notified requirement whose phase has not started
- `❓ Needs review`
- `➖ N/A`

Example:

```text
DPDPA Audit - signup and analytics flow
Audit date: 2026-08-15 | Legal-source baseline: 2026-08-15
Mode: Readiness
Verdict: Readiness gaps found

| ID | Requirement | Status | Severity | Evidence | Fix |
|---|---|---|---|---|---|
| C1 | Security safeguards (8(5), Rule 6) | ~ Readiness gap | Critical | api/db.ts:14 | Enforce TLS and move the secret to approved secret storage |
| E1 | Child-scope control (9, Rule 10) | Needs review | Critical | not found | Confirm audience and add the required control if children are in scope |
| A1 | Lawful basis (4) | Compliant | High | server/auth.ts:30 | - |
```

See [Audit method](audit-method.md) for the four passes and
[`report-format.md`](../plugins/dpdpa-india/skills/dpdpa-india/references/report-format.md) for the
full output contract.

The skill is an engineering aid, not legal advice. A qualified Indian data-protection practitioner
must review production decisions.
