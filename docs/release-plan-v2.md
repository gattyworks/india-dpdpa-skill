# DPDPA Skill v2.0.0 Release Plan

**Public launch target:** 2026-08-15
**Public repository:** Approved 2026-08-15
**v2 tag:** Approved for publication on 2026-08-15
**Distribution:** Public GitHub repository under the MIT license
**Public launch:** GattyWorks tool page, engineering story, Instagram carousel, LinkedIn post

**Status:** Release gates passed on 2026-08-15. The owner approved the public MIT release, the legal
source and claim review passed, and both audit modes completed their smoke tests. Publish v2.0.0
through the reviewed branch, tag, GitHub release, and clean-install sequence below.

## Release evidence

- All 13 pinned sources matched in the Python, PowerShell, and shell checker variants.
- The official MeitY Rules hub and the current Board record were reviewed manually.
- The bundle validator passed: versions, 49 fixed IDs, report coverage, host boundaries, local
  links, and text policy.
- Controlled checker fixtures returned the documented exit codes 0, 1, and 2.
- A Readiness-mode smoke audit used `Needs review` for host controls and did not invent current
  violations.
- A Current-compliance smoke audit reported no current product-duty gaps and did not score
  future-phase duties as present violations.
- The MIT license remains unchanged with the owner's approval.

## Why this is v2

Version 1.0.0 used the `dpdp-india` package, skill, and command names. The current repository uses
`dpdpa-india`, adds a fixed report contract, and separates current legal gaps from future-phase
readiness gaps. Those changes can break an existing installation or report consumer, so the next
release is 2.0.0.

## Product boundary

- The source repository and install steps are public.
- The public site explains the problem, method, and outcomes and links to the repository.
- Project audits remain separate GattyWorks work. The repository does not contain customer code or reports.
- Every public surface says that the skill is an engineering aid, not legal advice.
- The existing MIT license stays unchanged for this release unless the owner makes a separate
  license decision. Public visibility does not change rights already granted under MIT.

## Release gates

### 1. Legal-source gate

- Run all three source-checker variants or their supported platform equivalents.
- Require exit code 0. An incomplete fetch is a failed gate.
- Review the official MeitY Rules hub for new URLs and notifications.
- Confirm the phase table against G.S.R. 843(E).
- Confirm the current Board status and avoid claims about appointments that the official record
  does not support.
- Record the source baseline in the README, skill, and release notes.

### 2. Product and package gate

- Confirm every package path and command uses `dpdpa-india`.
- Validate both plugin manifests.
- Confirm the Codex wrapper delegates to the canonical skill.
- Count the canonical checklist IDs and verify the report-format coverage.
- Run a sample readiness audit and a sample current-obligation audit.
- Verify source-checker exit codes 0, 1, and 2 with controlled tests.

### 3. Documentation gate

- Validate all local Markdown links.
- Check README, FAQ, usage, architecture, maintenance, provenance, security, contributing, and
  legacy guide pages against the canonical skill.
- Keep repository, website, and install wording consistent.
- Add a migration note for users of v1.0.0.

### 4. Public-content gate

Publish these GattyWorks assets from one approved claim sheet:

1. Tool page: `DPDPA Engineering Audit`
2. Blog: `How we turned DPDPA into a repeatable engineering audit`
3. Instagram carousel: five slides in the current GattyWorks carousel system
4. LinkedIn post: one concise founder and engineering post

Approved public facts:

- 49 checks across 10 audit dimensions
- 13 policy and operational artifact specifications
- findings tied to code or artifact evidence
- fixed finding IDs and report fields
- separate current-gap and readiness-gap statuses
- source baseline reviewed 2026-08-15

Do not publish:

- claims that an AI audit certifies compliance
- claims that all DPDPA product duties are already in force
- a promise that the source checker discovers every new notification
- customer code, audit evidence, or client findings

### 5. Approval and publication gate

- Owner approves the tool page and blog.
- Legal reviewer approves phase and penalty claims.
- Owner approves each social caption and carousel render.
- Human confirms Instagram publication after preview.
- Human publishes or schedules the LinkedIn post from the approved copy.
- Verify public links, images, mobile layout, metadata, and analytics after deployment.

### 6. Versioned release gate

- Choose and record the license position.
- Update both manifests from 1.0.0 to 2.0.0 only after every prior gate passes.
- Move the changelog's Unreleased section to 2.0.0 with the release date.
- Create a reviewed branch and pull request.
- Merge, tag `v2.0.0`, and create a public GitHub release.
- Run a fresh install from the public repository and complete one smoke audit.

## Migration from v1

| v1.0.0 | v2.0.0 |
|---|---|
| `dpdp-india` | `dpdpa-india` |
| `/dpdp-audit` | `/dpdpa-audit` |
| `/dpdp-update-check` | `/dpdpa-update-check` |
| gap or compliant | gap, readiness gap, compliant, needs review, or N/A |
| loosely described report | fixed report contract with canonical IDs |

Existing installations should remove the old package before installing v2. Any system that parses
the report must accept the readiness status and the audit-mode fields.

## Release sequence

| Date | Work |
|---|---|
| 2026-08-15 | Finish the public landing, tool card, blog, carousel, LinkedIn copy, and release checks |
| After owner approval | Publish the landing and GattyWorks site through their guarded deployment paths |
| After legal review | Run both sample audit modes, complete package validation, and approve release notes |
| After every versioned-release gate passes | Tag v2.0.0 and complete a clean install and smoke audit |
| After the public URLs are verified | Use the human approval flow for Instagram and publish LinkedIn manually |

Making the repository public does not approve the v2 tag. Do not compress the legal, license, sample
audit, or clean-install gates to preserve the calendar.

## Definition of done

- The public repository has an approved v2.0.0 tag and release.
- A clean public installation works in Claude Code and Codex.
- The two audit modes produce the documented status contract.
- Source checking succeeds and manual notification discovery is recorded.
- The GattyWorks tool page and blog are live with an accurate repository link.
- The carousel and LinkedIn post are approved and published by a human.
- Public analytics and error monitoring show the pages are healthy.
