# Maintaining dpdpa-india

This is a public GattyWorks repository. Contributors use this process for legal, audit, packaging,
and documentation changes. The [Code of Conduct](CODE_OF_CONDUCT.md) applies.

## Legal changes

- Cite the exact section or rule and a primary source.
- Read the final notified text. Do not rely on a draft or memory.
- Check the commencement phase before calling a requirement in force.
- Mark unresolved points as `(verify)`.
- Keep third-party template content paraphrased and attributed.
- Update a `Last reviewed` header only for files you actually checked.

The official MeitY Act, Rules, corrigendum, commencement, and Board sources are pinned in
[`plugins/dpdpa-india/skills/dpdpa-india/scripts/sources.lock.json`](plugins/dpdpa-india/skills/dpdpa-india/scripts/sources.lock.json).
The checker detects changes at known URLs. It does not discover new notifications at new URLs.

## Workflow

1. Create a short-lived branch.
2. Make one focused change.
3. Run the source checker without `--update`.
4. Review the official MeitY DPDP Rules page for new documents.
5. Update dependent references.
6. Re-pin only after review if a known source changed.
7. Run the repository checks.
8. Open a pull request against `main`.

Run the canonical checker from the repository root:

```bash
python plugins/dpdpa-india/skills/dpdpa-india/scripts/check-updates.py
```

Use `--update` only after you review every changed source. The checker refuses a partial update if
any source cannot be fetched.

## Pull request checklist

- Legal claims have a section or rule and a primary source.
- The report contract and checklist use the same IDs, statuses, and severity defaults.
- Claude and Codex entry points still delegate to the same canonical playbook.
- Manifest versions match when a release version changes.
- Markdown links resolve.
- Public repository and install links are accurate.
- No secrets or customer audit data are committed.

## Commit messages

Use an imperative summary under 72 characters when possible. Examples:

- `Fix Rule 8 retention wording`
- `Pin the Rules corrigendum`
- `Add readiness status to reports`
