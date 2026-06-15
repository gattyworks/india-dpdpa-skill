# Contributing to dpdp-india

Thanks for your interest in contributing. This repo is part of the [GattyWorks](https://github.com/gattyworks)
`gattyworks-compliance` skill family. By participating, you agree to our [Code of Conduct](CODE_OF_CONDUCT.md).

## Ways to help

- **Correct the law.** The most valuable contribution. If a reference is wrong, stale, or imprecise,
  open a PR or issue that **cites the exact section/rule and a primary source** (gazette, MeitY, or the
  notified Rules). Accuracy beats everything here.
- **Sharpen the audit.** Better checklist items, detection patterns, or template mappings.
- **Report a bug or request a feature** in the skill, scripts, or plugin packaging.

## Ground rules for legal content

- Cite the **section/rule number** and the **source** for every legal claim. Never paraphrase the law
  from memory.
- Mark anything you can't fully verify as `(verify)` rather than asserting it.
- Keep third-party template content **paraphrased and attributed** - do not mirror commercial templates
  verbatim. Statutory text (Act/Rules/Schedule) is government work and may be quoted.
- When you change a reference, run `scripts/check-updates.py --update` only after you've re-verified
  against the upstream source, and note the source date in the file header.

## Development workflow

We work in short-lived branches and ship through pull requests. We never push directly to `main`.

1. Create a branch with a descriptive name, e.g. `fix/rule-7-breach-timeline`.
2. Make a focused change. Update the dated source header if you touched a reference.
3. Run the update checker and any relevant script (`python scripts/check-updates.py`).
4. Open a pull request against `main` with a clear description and the sources you used.
5. A maintainer reviews it. Address feedback, then we merge.

## Pull request checklist

- Legal claims cite a section/rule **and** a primary source.
- Reference file headers carry an accurate "Last verified" date.
- No secrets, keys, or credentials are committed.
- The change is scoped to a single concern.

## Commit messages

- Imperative mood: "Add", "Fix", "Refactor".
- Keep the summary under ~72 characters; add a body when context helps.

## Questions

Email [hello@gattyworks.com](mailto:hello@gattyworks.com).
