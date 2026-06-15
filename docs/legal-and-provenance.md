# Legal and provenance

This page documents where the skill's reference material comes from, how copyright is handled, how freshness is verified, and why the disclaimer is worded the way it is. It is itself an engineering aid, not legal advice.

The skill audits a build against the **DPDP Act 2023** (Act 22 of 2023) and the **DPDP Rules 2025** (notified 13 Nov 2025, G.S.R. 846(E)). All sources here were verified on **2026-06-15**.

## Provenance

Every reference file is built from a named upstream source. The two PDFs are the authoritative, stable anchors; the HTML hubs feed the template notes and the Rules digest, and are cross-checked against each other. Source-to-file mapping comes from [`sources.lock.json`](../plugins/dpdp-india/scripts/sources.lock.json) (the `feeds` field on each pinned source) and the attribution lines inside the reference files themselves.

| Reference file | Built from | Source kind |
|---|---|---|
| [`act-2023.md`](../plugins/dpdp-india/skills/dpdp-india/references/act-2023.md) | MeitY DPDP Act 2023 gazette PDF | Government PDF (authoritative) |
| [`consent-notice.md`](../plugins/dpdp-india/skills/dpdp-india/references/consent-notice.md) | MeitY DPDP Act 2023 gazette PDF | Government PDF |
| [`fiduciary-obligations.md`](../plugins/dpdp-india/skills/dpdp-india/references/fiduciary-obligations.md) | MeitY DPDP Act 2023 gazette PDF | Government PDF |
| [`data-principal-rights.md`](../plugins/dpdp-india/skills/dpdp-india/references/data-principal-rights.md) | MeitY DPDP Act 2023 gazette PDF | Government PDF |
| [`penalties-schedule.md`](../plugins/dpdp-india/skills/dpdp-india/references/penalties-schedule.md) | MeitY DPDP Act 2023 gazette PDF | Government PDF |
| [`rules-2025.md`](../plugins/dpdp-india/skills/dpdp-india/references/rules-2025.md) | dpdpa.com Rules landing + Section→Rule mapping; cross-verified against dpdpa.in | Third-party HTML hubs |
| [`audit-checklist.md`](../plugins/dpdp-india/skills/dpdp-india/references/audit-checklist.md) | dpdpa.com Section→Rule mapping | Third-party HTML hub |
| [`gdpr-comparison.md`](../plugins/dpdp-india/skills/dpdp-india/references/gdpr-comparison.md) | Latham & Watkins DPDP-vs-GDPR comparison PDF | Third-party PDF |
| [`templates/_site-map.md`](../plugins/dpdp-india/skills/dpdp-india/references/templates/_site-map.md) | dpdpa.com home / Act section index | Third-party HTML hub |
| [`templates/*.md`](../plugins/dpdp-india/skills/dpdp-india/references/templates/) | dpdpa.com templates & policies index (12 templates) | Third-party HTML hub (paraphrased) |
| [`legal-context.md`](../plugins/dpdp-india/skills/dpdp-india/references/legal-context.md) | Supreme Court judgments, IT Act 2000 + SPDI Rules 2011, CERT-In Directions, RBI directive, DPDP Act + Rules; cross-checked against the Latham & Watkins endnotes | Mixed primary sources |

The exact pinned URLs and SHA-256 hashes for the five upstream sources (MeitY Act PDF, Latham & Watkins comparison PDF, dpdpa.com home / templates / Rules / mapping pages, and dpdpa.in) live in [`sources.lock.json`](../plugins/dpdp-india/scripts/sources.lock.json). See [Reference library](reference-library.md) for what each file contains.

## Copyright posture

The reference set draws a hard line between government statutory text and third-party commercial material.

- **Government statutory text** - the Act, the Rules, and the Schedule are government work and may be **quoted directly**. The Act and Schedule references are built from the MeitY gazette PDF; the Rules digest from the dpdpa.com Rules pages, cross-verified against dpdpa.in.
- **Third-party commercial templates** - dpdpa.com is a commercial site. Its templates are **paraphrased and attributed, never mirrored**. Each template note in [`templates/README.md`](../plugins/dpdp-india/skills/dpdp-india/references/templates/README.md) captures only a template's purpose, the DPDP section/rule it satisfies, and a paraphrased clause checklist - explicitly "no verbatim template text." The site map repeats the rule: capture structure and purpose only, do not mirror template text.
- **Third-party analysis** - the Latham & Watkins comparison is used as a cross-check for the GDPR map and the legal-context endnotes, not reproduced.

The root [README](../README.md) states the same split in its Sources section: statutory text is government work; third-party template structures are paraphrased and attributed, not mirrored.

## Verification model

Because the DPDP regime commences in phases, sources move. The skill defends freshness three ways.

| Mechanism | What it does | Where |
|---|---|---|
| **Dated headers** | Each reference file carries a "Last verified" date stamping when its source was checked. | e.g. `legal-context.md` ("Last verified: 2026-06-15"), `templates/README.md`, `_site-map.md` |
| **Update-checker** | `check-updates.py` (also `.ps1` / `.sh`) re-fetches every pinned source, diffs live content against the stored SHA-256 hashes, and reports which reference files to re-verify. Run `--update` to re-pin after refreshing. | [`scripts/`](../plugins/dpdp-india/scripts/) + [`sources.lock.json`](../plugins/dpdp-india/scripts/sources.lock.json); `/dpdp-update-check` from Claude Code |
| **"(verify)" markers** | Inline flags on figures the author is not fully certain of, telling the auditor to confirm against the source text. | e.g. the `templates/README.md` note that some dpdpa.com pages cite a "72-hour" breach figure, while Rule 7 requires intimation without delay plus a detailed Board report within 72 hours |

HTML pages can show benign drift (ads, markup); the two PDFs are the stable anchors, so a hash change on a PDF matters more than one on an HTML hub. See [Staying current](staying-current.md) for the full re-verification workflow.

## Disclaimer and liability rationale

The skill is framed as an **engineering aid to surface *likely* gaps**, not legal advice. Per [`disclaimer.md`](../plugins/dpdp-india/skills/dpdp-india/references/disclaimer.md), it is not a substitute for professional counsel, using it creates **no lawyer-client relationship**, GattyWorks and contributors make **no warranty** and **accept no liability** for loss arising from reliance, and it is provided **"as is" under the MIT License**. The standing instruction is to **always run your own audit** and have a qualified Indian data-protection practitioner review your specific situation before relying on any result.

**Why it is framed this way.** The disclaimer's own reasoning: the law is new, commences in phases, and its statutory text, notified rules, country lists, and designations change over time - so references reflect only the sources verified on each file's stamped date and may be out of date. A tool that flags *likely* gaps from pattern-matching against a moving target cannot responsibly present itself as authoritative counsel; tying liability to professional review keeps the human lawyer in the loop where the legal judgment belongs.

**Where it appears.** The disclaimer is repeated at every entry point so no user meets the tool without it:

- **`disclaimer.md`** - the canonical, full-length statement.
- **README footer** - the [root README](../README.md) closes with the engineering-aid / no-lawyer-relationship / run-your-own-audit / "as is" language and links to `disclaimer.md`.
- **SKILL.md footer** - the [skill playbook](../plugins/dpdp-india/skills/dpdp-india/SKILL.md) carries the same disclaimer so any harness that loads only the skill bundle still gets it.

## See also

- [Reference library](reference-library.md) - what each reference file contains.
- [Staying current](staying-current.md) - the update-checker and re-verification workflow.
