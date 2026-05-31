#!/usr/bin/env python3
"""Update the Baseline cask for a published GitHub release."""

from __future__ import annotations

import argparse
import hashlib
import os
import pathlib
import re
import sys
import urllib.request


USER_AGENT = "arshiaghaf-homebrew-tap-updater"


def sha256(url: str) -> str:
    headers = {"User-Agent": USER_AGENT}
    token = os.environ.get("GITHUB_TOKEN")
    if token and url.startswith("https://github.com/"):
        headers["Authorization"] = f"Bearer {token}"

    request = urllib.request.Request(url, headers=headers)
    digest = hashlib.sha256()
    with urllib.request.urlopen(request) as response:
        while chunk := response.read(1024 * 1024):
            digest.update(chunk)
    return digest.hexdigest()


def replace_once(text: str, pattern: str, replacement: str, description: str) -> str:
    matches = re.findall(pattern, text, flags=re.MULTILINE)
    if len(matches) != 1:
        raise SystemExit(f"expected exactly one {description}, found {len(matches)}")
    return re.sub(pattern, replacement, text, count=1, flags=re.MULTILINE)


def update_cask(path: pathlib.Path, version: str, digest: str) -> None:
    text = path.read_text()
    text = replace_once(
        text,
        r'^(\s*version\s+")[^"]+(")',
        rf"\g<1>{version}\2",
        "version",
    )
    text = replace_once(
        text,
        r'^(\s*sha256\s+)(?::no_check|"[0-9a-f]{64}")',
        rf'\g<1>"{digest}"',
        "sha256",
    )
    path.write_text(text)


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--tag", required=True, help="Release tag, e.g. v0.1.0")
    parser.add_argument(
        "--repository",
        default="arshiaghaf/Baseline",
        help="Source repository, e.g. arshiaghaf/Baseline",
    )
    args = parser.parse_args()

    tag = args.tag.strip()
    if not re.fullmatch(r"v[0-9]+[.][0-9]+[.][0-9]+([-+][A-Za-z0-9._-]+)?", tag):
        raise SystemExit("tag must look like v0.1.0 or v0.1.0-beta.1")

    version = tag[1:]
    artifact = f"Baseline-{version}-unsigned.dmg"
    url = f"https://github.com/{args.repository}/releases/download/{tag}/{artifact}"
    digest = sha256(url)
    path = pathlib.Path("Casks/baseline.rb")
    if not path.exists():
        raise SystemExit(f"{path} does not exist")

    update_cask(path, version, digest)
    print(f"{digest}  {artifact}")
    print(f"updated {path} to {version}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
