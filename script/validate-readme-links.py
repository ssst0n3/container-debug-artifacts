#!/usr/bin/env python3

import re
import sys
from pathlib import Path


README = Path(__file__).resolve().parents[1] / "README.md"
LINK_PATTERN = re.compile(r"\[([^\]]+)\]\(([^)]+)\)")


def expected_name_from_url(url: str) -> str:
    return url.rstrip("/").split("/")[-1]


def main() -> int:
    lines = README.read_text(encoding="utf-8").splitlines()
    errors = []

    for line_no, line in enumerate(lines, start=1):
        if "releases/download" not in line:
            continue

        for text, url in LINK_PATTERN.findall(line):
            expected = expected_name_from_url(url)
            if text != expected:
                errors.append(
                    f"README.md:{line_no}: link text '{text}' does not match url basename '{expected}'"
                )

    if errors:
        print("README link validation failed:")
        for error in errors:
            print(f"- {error}")
        return 1

    print("README link validation passed")
    return 0


if __name__ == "__main__":
    sys.exit(main())
