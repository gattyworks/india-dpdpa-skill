# Security Policy

We take the security of our software and our users' data seriously. Thanks for helping keep GattyWorks and our users safe.

## Reporting a vulnerability

**Please do not report security vulnerabilities through public GitHub issues, discussions, or pull requests.**

Instead, email us at [hello@gattyworks.com](mailto:hello@gattyworks.com) with a subject line that starts with "Security". If this repository has [GitHub private vulnerability reporting](https://docs.github.com/code-security/security-advisories/guidance-on-reporting-and-writing/privately-reporting-a-security-vulnerability) enabled, you may use that instead.

Please include as much of the following as you can:

- The type of issue, for example injection, path traversal, or unsafe deserialization.
- The affected file paths (e.g. in `scripts/`) or the affected skill behavior.
- The branch, tag, or commit where you observed it.
- Step by step instructions to reproduce.
- Proof of concept or exploit code, if you have it.
- The impact, and how an attacker might use it.

## Scope note

This repository ships **no runtime service and no secrets** - it is a documentation/skill bundle plus a
read-only update-check script that fetches public URLs and hashes them. The most relevant concerns are
therefore the scripts in `plugins/dpdpa-india/scripts/` and the integrity of the pinned sources.

## What to expect

- We acknowledge your report within 24 hours.
- We confirm the issue and keep you updated on the fix.
- We agree a disclosure timeline with you, and credit you if you wish.

Please act in good faith, avoid privacy violations and service disruption, and give us reasonable time to respond before any public disclosure.
