# Security Policy

We take the security of our software and our users' data seriously. Thanks for helping keep GattyWorks and our users safe.

## Reporting a vulnerability

Do not put a vulnerability, customer audit, secret, or proof of concept in a repository issue or pull request.

Email [hello@gattyworks.com](mailto:hello@gattyworks.com) with a subject that starts with `Security`.

Please include as much of the following as you can:

- The type of issue, for example injection, path traversal, or unsafe deserialization.
- The affected file paths (e.g. in `scripts/`) or the affected skill behavior.
- The branch, tag, or commit where you observed it.
- Step by step instructions to reproduce.
- Proof of concept or exploit code, if you have it.
- The impact, and how an attacker might use it.

## Scope note

This repository ships no hosted runtime service. It contains agent instructions, legal reference files,
and update-check scripts that fetch and hash public URLs.

Relevant issues include:

- command or path injection in the update scripts;
- a compromised or replaced pinned source;
- prompt injection hidden in an external source or repository under audit;
- an instruction that causes audit data to be sent outside the approved host; and
- accidental inclusion of customer data, credentials, or private reports in this repository.

The checker does not send repository content. The host agent controls how source code and prompts are
processed, so do not claim that an audit stays on-device unless the selected host guarantees it.

## What to expect

- We acknowledge the report as soon as practical.
- We confirm the issue and share material fix updates.
- We agree on a disclosure timeline and credit you if you wish.

Please act in good faith, avoid privacy violations and service disruption, and give us reasonable time to respond before any public disclosure.
