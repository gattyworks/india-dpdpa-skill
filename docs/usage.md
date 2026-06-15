# Usage 🇮🇳

How to install the `dpdpa-india` skill, invoke it, and run it outside Claude Code. The skill audits an app, codebase, or data flow against India's **DPDP Act 2023** (Act 22 of 2023) and the **DPDP Rules 2025** (notified 13 Nov 2025, G.S.R. 846(E)). It is an engineering aid for spotting likely gaps - not legal advice.

Sources verified 2026-06-15.

## Install in Claude Code

Add the marketplace, then install the plugin:

```bash
/plugin marketplace add gattyworks/india-dpdpa-skill
/plugin install dpdpa-india@gattyworks-compliance
```

This registers two slash commands (`/dpdpa-audit`, `/dpdpa-update-check`) and the `dpdpa-india` skill, which also activates from natural language.

## Commands

| Command | Argument | Default | Does |
|---|---|---|---|
| `/dpdpa-audit` | path or scope | current repo / working directory | Runs a full compliance audit and returns the report |
| `/dpdpa-update-check` | none | - | Re-fetches the pinned legal sources and flags any that changed |

### `/dpdpa-audit [path or scope]`

The argument is a path or a free-text scope. If empty, the skill audits the current repository.

```bash
/dpdpa-audit .                       # audit the whole repo
/dpdpa-audit ./api                   # audit a subtree
/dpdpa-audit "the signup + analytics flow"   # scope by description
```

The command drives the skill's four-pass method - scope the system and inventory personal data, work the section-by-section checklist, gather real `file:line` evidence, then emit the report (verdict, risk table, findings by severity, top 3 risks, what to confirm with counsel, disclaimer). It cites a DPDP section or rule for every finding and names the template that closes each gap. See [Audit method](audit-method.md) for the pass-by-pass detail.

### `/dpdpa-update-check`

Takes no arguments. It runs the bundled checker:

```bash
python "${CLAUDE_PLUGIN_ROOT}/scripts/check-updates.py"
```

If `python` is unavailable, the command falls back to the platform variant in `scripts/` (`check-updates.ps1` on Windows, `check-updates.sh` on macOS/Linux). The checker hashes the pinned sources, reports any marked **CHANGED**, and advises which reference files to re-verify. See [Staying current](staying-current.md).

## Natural-language triggers

The skill activates without a slash command when the request reads like an Indian data-protection question. Phrasings that trigger it include:

- "audit this app for DPDP / Indian data-protection compliance"
- "is this DPDPA compliant"
- "Indian data protection / privacy audit"
- "do we handle Indian user data correctly"
- "consent / data retention / breach-notification compliance for India"
- "are we a Significant Data Fiduciary"
- "what privacy policies / templates do we need for India"

It triggers even on a bare "privacy audit" when the build targets an Indian audience. DPDP applies if you process digital personal data and either operate in India or offer goods/services to Data Principals in India from anywhere (extraterritorial, §3).

## Run it in other harnesses

The skill is a plain, portable `SKILL.md` + references bundle - no runtime, no secrets. Two ways to use it outside Claude Code:

1. **Copy the folder.** Drop [`plugins/dpdpa-india/skills/dpdpa-india/`](../plugins/dpdpa-india/skills/dpdpa-india/) into any agent that reads `SKILL.md` plus markdown references - Cursor, Windsurf, the Claude Agent SDK, or your own RAG pipeline. The folder is self-contained: the Act and Rules text, penalty schedule, audit checklist, code-detection patterns, GDPR↔DPDP map, and 13 policy templates all travel with it.
2. **Point the tool at the file.** Tell the model: *"read [SKILL.md](../plugins/dpdpa-india/skills/dpdpa-india/SKILL.md) and audit this codebase against it."* Everything it needs to follow the four-pass method is in the file and the `references/` it links.

| Harness | How |
|---|---|
| Cursor / Windsurf | Add the `skills/dpdpa-india/` folder to the workspace or rules context; reference `SKILL.md` in the prompt |
| Claude Agent SDK | Load the folder as a skill, or include `SKILL.md` as a system/context document |
| Custom RAG | Index the folder; retrieve `SKILL.md` and the relevant `references/*.md` per query |

The `${CLAUDE_PLUGIN_ROOT}` paths in `/dpdpa-update-check` are Claude Code conventions; in other harnesses, run the script in `scripts/` directly.

## End-to-end session

An illustrative run showing the natural-language trigger, scoping, and the report format.

```
User: Audit this app for DPDP compliance - it's a signup + analytics flow for Indian users.

Skill (dpdpa-india activated):
  Scoping the system before I check anything.
  - Personal data: name, email, phone at signup; device/usage events to analytics.
  - Role: Data Fiduciary (you decide purpose & means).
  - Children (under 18): no age gate found - flagging.
  - Cross-border: analytics SDK ships events to a US endpoint.

  DPDP Audit - signup + analytics flow (against DPDP Act 2023 + Rules 2025, verified 2026-06-15)
  Verdict: Gaps found

  | # | Requirement (DPDP cite) | Status | Severity | Evidence | Fix |
  |---|------------------------|--------|----------|----------|-----|
  | 1 | Reasonable security safeguards (§8(5)) | ⚠️ Gap | Critical | auth/store.js:42 - phone stored in plaintext | Encrypt at rest; see data-protection-policy.md |
  | 2 | Children's data / age gate (§9, under 18) | ⚠️ Gap | Critical | signup/form.tsx:1 - no age check | Add age gate + verifiable parental consent |
  | 3 | Consent notice at collection (§5-6) | ⚠️ Gap | High | signup/form.tsx:88 - submit, no notice | Add itemised notice; see consent-notice.md |

  Top 3 risks: (1) plaintext PII under the §8(5) ₹250 crore band; (2) no under-18 handling;
  (3) collection without a compliant notice.
  Confirm with counsel/ops: whether the US analytics transfer hits a §16 restriction;
  whether volume/sensitivity makes you a Significant Data Fiduciary (§10).
  Engineering aid, not legal advice - have a qualified Indian practitioner review.
```

Findings shown are illustrative. Severity maps to penalty exposure; security-safeguard failures (§8(5), up to Rs 250 crore) and children's-data breaches are Critical.

## See also

- [Audit method](audit-method.md) - the four-pass method in detail.
- [Staying current](staying-current.md) - how the update checker keeps the references honest.
