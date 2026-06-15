# FAQ & troubleshooting

Short answers to the questions that come up when running the **dpdpa-india** skill. For how to run an audit see [Usage](usage.md); for keeping the legal references current see [Staying current](staying-current.md).

## Is this legal advice?

No. The skill is an **engineering aid** that helps you find *likely* gaps against India's Digital Personal Data Protection Act, 2023 (Act 22 of 2023) and the DPDP Rules, 2025. It is not legal advice, not a substitute for counsel, and using it creates no lawyer-client relationship. Always have a qualified Indian data-protection practitioner review your situation before you rely on any result. See the full [disclaimer](../plugins/dpdpa-india/skills/dpdpa-india/references/disclaimer.md).

## Does it send my code or data anywhere?

No. The audit runs **locally in your agent** - it reads your files and reasons over the bundled references; nothing about your codebase leaves the machine.

The only component that touches the network is the update checker, [`check-updates.py`](../plugins/dpdpa-india/scripts/check-updates.py). It issues **GET requests to public legal-source URLs**, hashes each response, and diffs the hash against `sources.lock.json`. It transmits no part of your code, data, or audit - it sends a request and reads back the public page.

## "DPDP" vs "DPDPA" - which is right?

Both refer to the same law. The statute is the **Digital Personal Data Protection Act, 2023**; "DPDP Act" / "DPDP" is the form used through this skill, and "DPDPA" is a common shorthand (and the name of the `dpdpa.com` / `dpdpa.in` knowledge hubs). The skill triggers on either spelling - "audit my app for DPDP", "is this DPDPA compliant", and similar phrasings all work.

## How current is it?

| Fact | Value |
|------|-------|
| Sources verified | 2026-06-15 |
| DPDP Rules 2025 notified | 13 Nov 2025 (G.S.R. 846(E)) |
| Substantive obligations | phase in by ~2027 |

The regime commences in phases, so sources move. Before relying on an audit, run the update checker (see [Staying current](staying-current.md)):

```
python "${CLAUDE_PLUGIN_ROOT}/scripts/check-updates.py"
```

It re-fetches each pinned source and flags any that changed, telling you which reference files to re-verify.

## Am I a Significant Data Fiduciary (SDF)?

You don't self-declare. Under §10(1), the Central Government **designates** a fiduciary or class as an SDF, weighing factors such as volume and sensitivity of data processed, risk to Data Principals' rights, and impact on India's sovereignty/integrity, electoral democracy, State security, and public order.

If designated, §10(2) adds obligations: appoint a **Data Protection Officer based in India** (reporting to the board, named grievance contact), engage an **independent data auditor** for periodic data audits, and run **periodic DPIAs** for high-risk processing. See [fiduciary-obligations.md](../plugins/dpdpa-india/skills/dpdpa-india/references/fiduciary-obligations.md). The skill flags when you *could* fall in scope; designation itself is a government act.

## Does the skill modify my code?

No. It **audits and reports** - it produces a verdict, a risk table, and per-gap findings with `file:line` evidence and a recommended fix (and the template that closes the gap). It does not edit your files. Applying the fixes is your call.

## Windows troubleshooting

**Which variant do I run?** The checker ships as `check-updates.py`, `.ps1`, and `.sh`. On Windows, run the Python script (`python check-updates.py`) if you have Python, or the PowerShell variant (`check-updates.ps1`) otherwise. All three do the same job.

**PowerShell execution policy.** If `.ps1` is blocked, run it for the current session only:

```powershell
powershell -ExecutionPolicy Bypass -File check-updates.ps1
```

**`meity.gov.in` returns 403 in the checker.** Expected and handled: some government/WAF-fronted hosts reject obvious bots, so the checker sends a real browser `User-Agent`. If a fetch still fails, it's reported as a non-fatal `ERROR` (errors alone don't fail the run). Re-run to retry transient network issues - reachable sources still report current.

## Does it work outside Claude Code?

Yes. The skill is a portable **`SKILL.md` + references** bundle with no runtime and no secrets. Drop [`plugins/dpdpa-india/skills/dpdpa-india/`](../plugins/dpdpa-india/skills/dpdpa-india/) into any agent that reads markdown context (Cursor, Windsurf, the Claude Agent SDK, your own RAG), or just tell the model to read `SKILL.md` and audit against it. The update checker is plain stdlib Python and runs anywhere.

## How are penalties "estimated"?

They aren't predicted. The skill **maps each finding to the maximum penalty band** in the Act's Schedule - for example, a reasonable-security-safeguards failure (§8(5)) maps to the highest band, up to **Rs 250 crore**. That is a severity signal tied to statutory maximums, not a forecast of what any Board would actually impose. Treat it as a way to rank gaps by exposure, not as a number you will be fined.
