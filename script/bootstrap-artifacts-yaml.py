#!/usr/bin/env python3

import re
from pathlib import Path

import yaml


ROOT = Path(__file__).resolve().parents[1]
README = ROOT / "README.md"
TARGET_COMPONENTS = {
    "runc",
    "containerd",
    "docker",
    "kubernetes",
    "podman",
    "nvidia-container-toolkit",
    "dlv",
}
COMPONENT_OUTPUT = {
    "runc": ROOT / "runc/artifacts.yaml",
    "containerd": ROOT / "containerd/artifacts.yaml",
    "docker": ROOT / "docker/artifacts.yaml",
    "kubernetes": ROOT / "kubernetes/artifacts.yaml",
    "podman": ROOT / "podman/artifacts.yaml",
    "nvidia-container-toolkit": ROOT / "nvidia-container-toolkit/artifacts.yaml",
    "dlv": ROOT / "delve/artifacts.yaml",
}
LINK_PATTERN = re.compile(r"\[([^\]]+)\]\(([^)]+)\)")
PLACEHOLDER_VERSIONS = {":arrow_up:", "\u2191"}


def split_row(line: str) -> list[str]:
    content = line.strip().strip("|")
    return [cell.strip() for cell in content.split("|")]


def parse_link(cell: str) -> tuple[str, str]:
    match = LINK_PATTERN.search(cell)
    if not match:
        return cell.strip(), ""
    return match.group(1).strip(), match.group(2).strip()


def normalize_column(column: str) -> str:
    return column.lower().replace(" ", "_")


def normalize_version_token(version: str) -> str:
    token = version.strip()
    if token in PLACEHOLDER_VERSIONS:
        return ""
    return token


def main() -> None:
    lines = README.read_text(encoding="utf-8").splitlines()

    components = []
    current = None
    columns = []
    in_table = False

    for line in lines:
        if line.startswith("## "):
            section = line[3:].strip()
            if section in TARGET_COMPONENTS:
                current = {
                    "name": section,
                    "columns": [],
                    "version_link": False,
                    "versions": [],
                }
                components.append(current)
                columns = []
                in_table = False
            else:
                current = None
                columns = []
                in_table = False
            continue

        if current is None:
            continue

        if not line.startswith("|"):
            continue

        row = split_row(line)
        if not columns:
            columns = row
            current["columns"] = columns
            in_table = True
            continue

        if in_table and all(cell.replace("-", "").strip() == "" for cell in row):
            continue

        while len(row) < len(columns):
            row.append("")

        version_text, version_url = parse_link(row[0])
        version_text = normalize_version_token(version_text)
        binary_text, _ = parse_link(row[1]) if len(row) > 1 else ("", "")

        if version_url:
            current["version_link"] = True

        artifacts = current["versions"]
        if version_text:
            artifacts.append({"version": version_text, "artifacts": []})

        if not artifacts:
            continue

        if not binary_text or binary_text == "-":
            continue

        entry = {"binary": binary_text}

        for idx in range(2, len(columns)):
            key = normalize_column(columns[idx])
            entry[key] = row[idx].strip() if idx < len(row) else ""

        artifacts[-1]["artifacts"].append(entry)

    for component in components:
        if component.get("version_link", True):
            component.pop("version_link", None)
        component["columns"] = component["columns"][2:]
        output = COMPONENT_OUTPUT[component["name"]]
        output.parent.mkdir(parents=True, exist_ok=True)
        with output.open("w", encoding="utf-8") as handle:
            yaml.safe_dump(component, handle, sort_keys=False, allow_unicode=False)


if __name__ == "__main__":
    main()
