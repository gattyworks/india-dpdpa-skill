#!/usr/bin/env python3
"""Validate the public dpdpa-india release bundle."""

from __future__ import annotations

import json
import re
import sys
from pathlib import Path
from urllib.parse import unquote


ROOT = Path(__file__).resolve().parents[1]
SKILL = ROOT / "plugins" / "dpdpa-india" / "skills" / "dpdpa-india"
EXPECTED_VERSION = "2.0.0"
TEXT_SUFFIXES = {".md", ".json", ".py", ".ps1", ".sh", ".yaml", ".yml"}


def fail(message: str) -> None:
    raise AssertionError(message)


def check_required_files() -> None:
    required = [
        SKILL / "SKILL.md",
        SKILL / "agents" / "openai.yaml",
        SKILL / "assets" / "saakshi.svg",
        SKILL / "scripts" / "check-updates.py",
        SKILL / "scripts" / "check-updates.ps1",
        SKILL / "scripts" / "check-updates.sh",
        SKILL / "scripts" / "sources.lock.json",
        SKILL / "references" / "audit-checklist.md",
        SKILL / "references" / "report-format.md",
    ]
    missing = [str(path.relative_to(ROOT)) for path in required if not path.is_file()]
    if missing:
        fail(f"Missing release files: {', '.join(missing)}")


def check_versions() -> None:
    files = [
        ROOT / ".claude-plugin" / "marketplace.json",
        ROOT / "plugins" / "dpdpa-india" / ".claude-plugin" / "plugin.json",
    ]
    marketplace = json.loads(files[0].read_text(encoding="utf-8"))
    plugin = json.loads(files[1].read_text(encoding="utf-8"))
    versions = [marketplace["plugins"][0]["version"], plugin["version"]]
    if versions != [EXPECTED_VERSION, EXPECTED_VERSION]:
        fail(f"Manifest versions must both be {EXPECTED_VERSION}: {versions}")


def check_contract() -> None:
    checklist = (SKILL / "references" / "audit-checklist.md").read_text(encoding="utf-8")
    ids = re.findall(r"^\| ([A-J]\d+) \|", checklist, flags=re.MULTILINE)
    if len(ids) != 49 or len(set(ids)) != 49:
        fail(f"Expected 49 unique checklist IDs, found {len(ids)} rows and {len(set(ids))} unique IDs")

    expected = set().union(
        {f"A{i}" for i in range(1, 5)},
        {f"B{i}" for i in range(1, 9)},
        {f"C{i}" for i in range(1, 8)},
        {f"D{i}" for i in range(1, 6)},
        {f"E{i}" for i in range(1, 5)},
        {f"F{i}" for i in range(1, 6)},
        {f"G{i}" for i in range(1, 5)},
        {f"H{i}" for i in range(1, 4)},
        {f"I{i}" for i in range(1, 5)},
        {f"J{i}" for i in range(1, 6)},
    )
    if set(ids) != expected:
        fail("Checklist IDs do not match the fixed A1 to J5 catalog")

    report = (SKILL / "references" / "report-format.md").read_text(encoding="utf-8")
    for start, end in [("A1", "A4"), ("B1", "B8"), ("C1", "C7"), ("D1", "D5"),
                       ("E1", "E4"), ("F1", "F5"), ("G1", "G4"), ("H1", "H3"),
                       ("I1", "I4"), ("J1", "J5")]:
        if f"{start}-{end}" not in report:
            fail(f"Report contract does not declare {start}-{end}")


def check_harness_boundaries() -> None:
    canonical = (SKILL / "SKILL.md").read_text(encoding="utf-8")
    if "CLAUDE_PLUGIN_ROOT" in canonical:
        fail("Canonical SKILL.md contains a Claude-only path")

    wrapper = (ROOT / ".agents" / "skills" / "dpdpa-india" / "SKILL.md").read_text(encoding="utf-8")
    expected = "../../../plugins/dpdpa-india/skills/dpdpa-india/SKILL.md"
    if expected not in wrapper:
        fail("Codex repository entry point does not delegate to the canonical skill")

    readme = (ROOT / "README.md").read_text(encoding="utf-8")
    required = ["$skill-installer", "hermes skills install", "agents/openai.yaml"]
    for marker in required:
        if marker not in readme:
            fail(f"README is missing the multi-harness marker: {marker}")


def check_local_links() -> None:
    markdown_link = re.compile(r"!?\[[^\]]*\]\(([^)]+)\)")
    html_link = re.compile(r"(?:href|src)=[\"']([^\"']+)[\"']")
    missing: list[str] = []

    for path in ROOT.rglob("*.md"):
        relative = path.relative_to(ROOT)
        if ".git" in path.parts or relative.parts[0] == "sources":
            continue
        text = path.read_text(encoding="utf-8")
        targets = markdown_link.findall(text) + html_link.findall(text)
        for raw in targets:
            target = raw.strip().strip("<>").split("#", 1)[0]
            if not target or target.startswith(("http://", "https://", "mailto:", "/")):
                continue
            candidate = (path.parent / unquote(target)).resolve()
            if not candidate.exists():
                missing.append(f"{path.relative_to(ROOT)} -> {raw}")

    if missing:
        fail("Broken local links:\n" + "\n".join(missing))


def check_text_policy() -> None:
    violations: list[str] = []
    for path in ROOT.rglob("*"):
        if not path.is_file() or ".git" in path.parts or path.suffix.lower() not in TEXT_SUFFIXES:
            continue
        text = path.read_text(encoding="utf-8")
        if "\u2013" in text or "\u2014" in text:
            violations.append(str(path.relative_to(ROOT)))
    if violations:
        fail("En dash or em dash found in: " + ", ".join(violations))


def main() -> int:
    checks = [
        check_required_files,
        check_versions,
        check_contract,
        check_harness_boundaries,
        check_local_links,
        check_text_policy,
    ]
    for check in checks:
        check()
        print(f"PASS {check.__name__}")
    print("PASS release bundle")
    return 0


if __name__ == "__main__":
    try:
        raise SystemExit(main())
    except AssertionError as error:
        print(f"FAIL {error}", file=sys.stderr)
        raise SystemExit(1)
