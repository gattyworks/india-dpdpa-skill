# FAQ and troubleshooting

## Is this legal advice?

No. The skill finds likely engineering gaps. It does not replace qualified Indian legal counsel.

## Is the repository public?

Yes. The source, install steps, legal references, and audit method are public under the MIT license.
Customer code, audit evidence, and client reports are never part of this repository.

## Does the audit send code anywhere?

The skill itself has no upload service. The source checker sends GET requests only to the URLs in
`sources.lock.json`.

The host agent controls how code and prompts are processed. Do not say that code stays on-device
unless the selected host and configuration guarantee it.

## Does the skill edit code?

The audit workflow reports findings and fixes. It does not request edits. A coding agent may still
have write access, and a separate user request can authorise implementation. Check the host and the
task scope before an audit.

## How current is the legal baseline?

| Item | Status |
|---|---|
| Known source hashes checked | 2026-08-15 |
| Final Rules | G.S.R. 846(E), 13 November 2025 |
| Corrigendum | G.S.R. 892(E), December 2025 |
| Board establishment | G.S.R. 844(E), November 2025 |
| Most product-facing duties | Eighteen-month phase; not yet in force on 2026-08-15 |

The checker detects changes to known URLs. It cannot discover a new notification at a new URL.
Review the official MeitY DPDP Rules page each month and before a release.

## What is a readiness gap?

A readiness gap is an unmet, notified requirement whose commencement phase has not started on the
audit date. A current `Gap` means an applicable requirement is already in force. The report must not
mix the two.

## Am I a Significant Data Fiduciary?

The Central Government designates an SDF or class under 10(1). A company does not self-declare.
The audit can show that a product has characteristics relevant to designation, but it cannot make
the designation.

No SDF designation was located in the official sources reviewed on 2026-08-15. Check current
notifications before relying on that statement.

## Does DPDPA include data portability?

No general data-portability right appears in 11 to 14. Section 11 provides an access right. Do not
turn that into a GDPR-style portability claim.

## How does the checker fail?

The checker exits with code 1 when a known source changes. It exits with code 2 when one or more
sources cannot be checked. A fetch error means currentness is unknown, not current.

On Windows:

```powershell
python plugins/dpdpa-india/scripts/check-updates.py
```

If Python is unavailable:

```powershell
powershell -ExecutionPolicy Bypass -File plugins/dpdpa-india/scripts/check-updates.ps1
```

## Are penalty values predictions?

No. The skill maps a finding to a statutory maximum category and uses that as one severity input.
The Board applies the factors in 33(2). A maximum is not a prediction of an actual penalty.

See the full [disclaimer](../plugins/dpdpa-india/skills/dpdpa-india/references/disclaimer.md).
