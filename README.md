<p align="center">
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="assets/banner-dark.png">
    <source media="(prefers-color-scheme: light)" srcset="assets/banner-light.png">
    <img src="assets/banner-dark.png" alt="DPDPA India - Digital Personal Data Protection Act 2023 + Rules 2025 - compliance audit skill" width="100%">
  </picture>
</p>

<p align="center">
  <a href="LICENSE"><img src="https://img.shields.io/badge/License-MIT-00ADB5?style=for-the-badge" alt="MIT License"></a>
  <img src="https://img.shields.io/badge/India-DPDP_Act_2023_%2B_Rules_2025-FF9933?style=for-the-badge" alt="India DPDP">
  <img src="https://img.shields.io/badge/Claude_Code-plugin-CC785C?style=for-the-badge&logo=claude&logoColor=white" alt="Claude Code plugin">
  <img src="https://img.shields.io/badge/Sources_verified-2026--06--15-0A0A0A?style=for-the-badge" alt="Sources verified">
</p>

<h3 align="center">Point an AI agent at your build and ask: <i>"are we breaking any Indian data-protection rules?"</i></h3>

A self-contained **skill** that audits an application, codebase, product, or data flow against
**India's Digital Personal Data Protection Act, 2023** and the **DPDP Rules, 2025** (notified
13 Nov 2025). It ships the statutory text, the penalty schedule, a section-by-section audit
checklist, codebase detection patterns, a GDPR↔DPDP map, and ready-reference policy templates -
so the agent cites real sections and points every gap at the fix.

**DPDP Act or "DPDPA"?** Same law. Its short title is the **Digital Personal Data Protection Act,
2023** (the "DPDP Act"); appending the "A" for "Act" gives the widely used acronym **DPDPA**, which
is why this project is named `india-dpdpa-skill`. The legal references keep the precise statutory
forms ("DPDP Act", "DPDP Rules"). Background: [Digital Personal Data Protection Act, 2023 (Wikipedia)](https://en.wikipedia.org/wiki/Digital_Personal_Data_Protection_Act,_2023).

> 🇮🇳 The first in a planned family of country-by-country compliance skills. **This repo is India.**

## What it checks

Lawful basis & consent (§4-7) · notice quality · **reasonable security safeguards** (§8(5) - the
₹250 crore band) · breach notification (Board within 72h, principals without delay) · **children's
data** (§9, under-18) · Data Principal rights (§11-14) · retention & erasure (3-year inactivity
class) · cross-border transfer (§16) · Significant Data Fiduciary duties (§10) · processor/DPA
coverage · published privacy artifacts.

Each finding comes back with a **status**, **severity mapped to penalty exposure**, real
`file:line` **evidence**, a **remediation**, and the **template** that closes it.

## Example audit report

Every audit returns the **same structure, fields, severity levels, and issue IDs**, so results are
consistent and comparable from one run to the next. The full output contract and a complete worked
example live in [`report-format.md`](plugins/dpdpa-india/skills/dpdpa-india/references/report-format.md).

- **Severity levels:** `Critical` (the ₹250 crore security band, or children), `High`, `Medium`, `Low`.
- **Statuses:** ✅ Compliant, ⚠️ Gap, ❓ Needs review, ➖ N/A.
- **Finding fields:** ID, Requirement (section/rule cite), Status, Severity, Evidence (`file:line`), Fix.
- **Issue IDs:** every finding maps to a fixed catalog ID (`A1` ... `J5`) from the checklist, so two audits of the same system line up exactly.

A trimmed sample:

```
DPDPA Audit - Acme Shop (Next.js + Postgres)     Verdict: Gaps found
Scope: Fiduciary | Children: unknown | SDF: no | Cross-border: yes

| ID | Requirement (cite)                  | Status       | Severity | Evidence          | Fix |
|----|-------------------------------------|--------------|----------|-------------------|-----|
| C1 | Security safeguards (§8(5), Rule 6) | ⚠️ Gap       | Critical | api/db.ts:14      | Enforce TLS, vault secrets, encrypt at rest |
| E3 | No tracking of children (§9(3))     | ⚠️ Gap       | Critical | app/layout.tsx:22 | Gate analytics/ads off for under-18 |
| F1 | Right to access (§11)               | ⚠️ Gap       | High     | not found         | Add a data-export endpoint |
| A1 | Lawful basis (§4)                   | ✅ Compliant | High     | server/auth.ts:30 | - |
| G1 | India-based DPO (§10(2))            | ➖ N/A       | -        | -                 | Below SDF threshold; revisit at scale |
```

The report then lists a risk summary, per-gap details, the top 3 risks, what to confirm with
counsel or ops, and the disclaimer.

## Install (Claude Code)

```bash
/plugin marketplace add gattyworks/india-dpdpa-skill
/plugin install dpdpa-india@gattyworks-compliance
```

Then run a scan:

```bash
/dpdpa-audit .            # audit the current repo
/dpdpa-audit ./api        # audit a subtree
```

…or just say *"audit this app for DPDP / Indian data-protection compliance."*

### Example prompts (after install)

Once installed, point the agent at your code with prompts like:

- *"Use the dpdpa-india skill to audit this repo for DPDP compliance and list the top risks."*
- *"Run /dpdpa-audit on ./api and return findings as a table with section, status, and severity."*
- *"Check our signup and analytics flow against India's DPDP Act. Are we handling children's data correctly?"*
- *"Are we a Significant Data Fiduciary, and what would that require of us?"*
- *"Which privacy policies and templates do we need for Indian users, and which are missing here?"*

### Use it in any AI harness

The skill is a plain, portable **`SKILL.md` + references** bundle - no runtime, no secrets. Drop
[`plugins/dpdpa-india/skills/dpdpa-india/`](plugins/dpdpa-india/skills/dpdpa-india/) into any
agent that reads skills/markdown context (Cursor, Windsurf, the Claude Agent SDK, your own RAG),
or simply tell the model: *"read SKILL.md and audit this codebase against it."* Everything it needs
is in the folder.

## Keeping current

The law commences in phases, so sources move. A zero-dependency checker re-fetches every pinned
source and flags drift:

```bash
python plugins/dpdpa-india/scripts/check-updates.py      # also: check-updates.ps1 / .sh
/dpdpa-update-check                                       # the same, from Claude Code
```

It hashes the [pinned sources](plugins/dpdpa-india/scripts/sources.lock.json) (MeitY Act PDF,
DPDP Rules, dpdpa.com, dpdpa.in, the GDPR-comparison PDF) and tells you which reference files to
re-verify. Run with `--update` to re-pin after you've refreshed the references.

## What's inside

```
.
├── .claude-plugin/marketplace.json        # marketplace (gattyworks-compliance)
├── assets/                                 # banner + logo (Ashoka Chakra · GattyWorks teal · tricolor)
└── plugins/dpdpa-india/
    ├── .claude-plugin/plugin.json
    ├── commands/                           # /dpdpa-audit, /dpdpa-update-check
    ├── scripts/                            # check-updates.{py,ps1,sh} + sources.lock.json
    └── skills/dpdpa-india/
        ├── SKILL.md                        # the audit playbook (start here)
        └── references/
            ├── audit-checklist.md          # the section-by-section engine
            ├── code-patterns.md            # what to grep for in a codebase
            ├── act-2023.md · rules-2025.md · penalties-schedule.md
            ├── consent-notice.md · fiduciary-obligations.md · data-principal-rights.md
            ├── gdpr-comparison.md · legal-context.md · disclaimer.md
            └── templates/                  # 13 policy artifacts a compliant build needs
```

## A family, not a one-off

The vision is one focused skill per jurisdiction - `dpdpa-india` here, with room for GDPR, CCPA,
and others as sibling repos under the same `gattyworks-compliance` marketplace. India first
because the DPDP regime is new, fast-moving, and under-tooled.

## Sources

Built from primary text: the [DPDP Act 2023 (MeitY gazette)](https://www.meity.gov.in/static/uploads/2024/06/2bf1f0e9f04e6fb4f8fef35e82c42aa5.pdf),
the DPDP Rules 2025, the knowledge hub at [dpdpa.com](https://www.dpdpa.com/) /
[dpdpa.in](https://www.dpdpa.in/), and Latham & Watkins' DPDP-vs-GDPR comparison. Statutory text
is government work; third-party template structures are paraphrased and attributed, not mirrored.

## Contributing & community

<p align="center">
  <a href="CONTRIBUTING.md"><img src="https://img.shields.io/badge/Contributing-guide-00ADB5?style=for-the-badge" alt="Contributing"></a>
  <a href="CODE_OF_CONDUCT.md"><img src="https://img.shields.io/badge/Code_of_Conduct-Contributor_Covenant-0A0A0A?style=for-the-badge" alt="Code of Conduct"></a>
  <a href="SECURITY.md"><img src="https://img.shields.io/badge/Security-policy-0A0A0A?style=for-the-badge" alt="Security"></a>
</p>

Corrections to the legal references are especially welcome - cite the section/rule and the source.
We work in short-lived branches and ship through review; never push straight to `main`.

## License

[MIT](LICENSE) © 2026 GattyWorks.

---

<p align="center">
  <sub>Built by <b>GattyWorks</b> · <a href="https://gattyworks.com">gattyworks.com</a> · hello@gattyworks.com · Mangaluru &amp; Bengaluru, India 🇮🇳</sub>
</p>

<p align="center">
  <sub>This skill is an engineering aid for spotting likely gaps - <b>not legal advice</b>, and no
  lawyer-client relationship is created. The law changes; references reflect the verified date above.
  Always run your own audit and have a qualified Indian data-protection practitioner review before you
  rely on any result. Provided "as is"; see <a href="plugins/dpdpa-india/skills/dpdpa-india/references/disclaimer.md">disclaimer</a>.</sub>
</p>
