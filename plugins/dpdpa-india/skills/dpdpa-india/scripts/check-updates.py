#!/usr/bin/env python3
"""Check whether the dpdpa-india skill's upstream legal sources have changed.

Re-fetches every source pinned in sources.lock.json. Stable files are compared by
SHA-256. Pages behind a nondeterministic JavaScript challenge are checked for
reachability and require manual rendered-page review. India's DPDP regime commences in phases, so sources do move; this
flags when a reference file may need re-verification.

Usage:
    python check-updates.py            # check and report (exit 1 if any changed)
    python check-updates.py --update   # re-pin hashes after you re-verified the refs
    python check-updates.py --json      # machine-readable output

No third-party dependencies (stdlib only).
"""
from __future__ import annotations
import argparse, hashlib, json, sys, datetime
from pathlib import Path
from urllib.request import Request, urlopen
from urllib.error import URLError, HTTPError
import ssl

LOCK = Path(__file__).with_name("sources.lock.json")
# A real browser UA: some government/WAF-fronted hosts (e.g. meity.gov.in) 403 obvious bots.
UA = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36"
HEADERS = {"User-Agent": UA, "Accept": "*/*", "Accept-Language": "en-US,en;q=0.9"}
TIMEOUT = 45

GREEN, YELLOW, RED, DIM, RESET = "\033[32m", "\033[33m", "\033[31m", "\033[2m", "\033[0m"


def fetch(url: str) -> bytes:
    ctx = ssl.create_default_context()
    req = Request(url, headers=HEADERS)
    with urlopen(req, timeout=TIMEOUT, context=ctx) as resp:
        return resp.read()


def main() -> int:
    ap = argparse.ArgumentParser(description="Check dpdpa-india legal sources for changes.")
    ap.add_argument("--update", action="store_true", help="re-pin current hashes into the lock file")
    ap.add_argument("--json", action="store_true", help="emit JSON instead of a table")
    args = ap.parse_args()

    data = json.loads(LOCK.read_text(encoding="utf-8"))
    sources = data["sources"]
    results = []

    for s in sources:
        row = {"id": s["id"], "label": s["label"], "url": s["url"], "type": s.get("type", "html")}
        try:
            body = fetch(s["url"])
            if s.get("check") == "reachable":
                row["check"] = "reachable"
                row["status"] = "OK"
            else:
                live = hashlib.sha256(body).hexdigest()
                row["check"] = "sha256"
                row["old"], row["new"] = s.get("sha256"), live
                if s.get("sha256") is None:
                    row["status"] = "BASELINE"
                elif live == s["sha256"]:
                    row["status"] = "OK"
                else:
                    row["status"] = "CHANGED"
                if args.update:
                    s["sha256"] = live
        except (URLError, HTTPError, ssl.SSLError, TimeoutError, OSError) as e:
            row["status"], row["error"] = "ERROR", str(e)
        results.append(row)

    changed = [r for r in results if r["status"] == "CHANGED"]
    errored = [r for r in results if r["status"] == "ERROR"]

    if args.update and not errored:
        data["verified"] = datetime.date.today().isoformat()
        LOCK.write_text(json.dumps(data, indent=2, ensure_ascii=False) + "\n", encoding="utf-8")

    if args.json:
        print(json.dumps({"verified": data["verified"], "results": results,
                          "changed": len(changed), "errors": len(errored)}, indent=2))
    else:
        use_color = sys.stdout.isatty()
        def c(col, t): return f"{col}{t}{RESET}" if use_color else t
        mark = {"OK": c(GREEN, "OK      "), "CHANGED": c(RED, "CHANGED "),
                "ERROR": c(YELLOW, "ERROR   "), "BASELINE": c(DIM, "BASELINE")}
        print(f"DPDP source check - baseline verified {data['verified']}\n")
        for r in results:
            print(f"  {mark[r['status']]}  {r['id']:<24}  {r['url']}")
            if r["status"] == "ERROR":
                print(f"            {c(DIM, r['error'])}")
        print()
        if args.update and errored:
            print(c(RED, "Lock file not changed because one or more sources could not be fetched."))
        elif args.update:
            print(c(GREEN, "Lock file re-pinned to current hashes. Reachability checks were left unchanged."))
        elif changed:
            print(c(RED, f"{len(changed)} source(s) CHANGED - re-verify the affected reference files:"))
            for r in changed:
                feeds = next((s.get("feeds", "") for s in sources if s["id"] == r["id"]), "")
                print(f"    - {r['id']}  ->  {feeds}")
            print("  Re-verify against the source, update the .md files, then run with --update.")
        elif errored and not changed:
            print(c(YELLOW, f"{len(errored)} source(s) could not be checked. Currentness is unknown."))
        else:
            print(c(GREEN, "All sources current."))

    # exit code: 0 current or successfully updated, 1 changed, 2 incomplete because of errors
    if errored:
        return 2
    if changed and not args.update:
        return 1
    return 0


if __name__ == "__main__":
    sys.exit(main())
