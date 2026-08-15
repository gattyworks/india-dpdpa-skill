#!/usr/bin/env python3
"""Verify the source checker's documented exit codes with local fixtures."""

from __future__ import annotations

import hashlib
import json
import shutil
import subprocess
import sys
import tempfile
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
CHECKER = ROOT / "plugins" / "dpdpa-india" / "skills" / "dpdpa-india" / "scripts" / "check-updates.py"


def run_case(directory: Path, name: str, url: str, digest: str, expected: int) -> None:
    case = directory / name
    case.mkdir()
    shutil.copy2(CHECKER, case / "check-updates.py")
    lock = {
        "verified": "2026-08-15",
        "sources": [
            {
                "id": name,
                "label": name,
                "url": url,
                "type": "text",
                "sha256": digest,
                "feeds": "test fixture",
            }
        ],
    }
    (case / "sources.lock.json").write_text(json.dumps(lock), encoding="utf-8")
    result = subprocess.run(
        [sys.executable, str(case / "check-updates.py"), "--json"],
        capture_output=True,
        text=True,
        encoding="utf-8",
        check=False,
    )
    if result.returncode != expected:
        raise AssertionError(
            f"{name}: expected exit {expected}, got {result.returncode}\n{result.stdout}\n{result.stderr}"
        )
    print(f"PASS {name} exit {expected}")


def main() -> int:
    with tempfile.TemporaryDirectory(prefix="dpdpa-checker-") as temp:
        directory = Path(temp)
        body = directory / "source.txt"
        body.write_bytes(b"known source\n")
        digest = hashlib.sha256(body.read_bytes()).hexdigest()
        run_case(directory, "current", body.as_uri(), digest, 0)
        run_case(directory, "changed", body.as_uri(), "0" * 64, 1)
        run_case(directory, "incomplete", (directory / "missing.txt").as_uri(), digest, 2)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
