#!/usr/bin/env python3

from pathlib import Path

import yaml


ROOT = Path(__file__).resolve().parents[1]
README_FILE = ROOT / "README.md"
COMPONENT_FILES = [
    ROOT / "runc/artifacts.yaml",
    ROOT / "containerd/artifacts.yaml",
    ROOT / "docker/artifacts.yaml",
    ROOT / "kubernetes/artifacts.yaml",
    ROOT / "podman/artifacts.yaml",
    ROOT / "nvidia-container-toolkit/artifacts.yaml",
    ROOT / "delve/artifacts.yaml",
]
PLACEHOLDER_VERSIONS = {":arrow_up:", "\u2191"}


def make_anchor(name: str) -> str:
    return name.lower().replace(" ", "-")


def render_link(text: str, url: str) -> str:
    if not text:
        return ""
    if url:
        return f"[{text}]({url})"
    return text


def normalize_column(column: str) -> str:
    return column.lower().replace(" ", "_")


def get_column_value(artifact: dict, column: str) -> str:
    key = normalize_column(column)
    if key == "tested_dlv":
        if "tested_dlv" in artifact:
            return artifact.get("tested_dlv", "")
        if "available_dlv" in artifact:
            return artifact.get("available_dlv", "")
        if "dlv" in artifact:
            return artifact.get("dlv", "")
    return artifact.get(key, "")


def derive_binary_url(component: str, binary: str) -> str:
    if not binary or binary == "-":
        return ""
    return (
        "https://github.com/ssst0n3/container-debug-artifacts/releases/download/"
        f"{component}/{binary}"
    )


def derive_version_url(component: str, version: str) -> str:
    if not version:
        return ""
    return f"https://github.com/ssst0n3/container-debug-artifacts/tree/main/{component}/{version}"


def render_component(component: dict) -> str:
    name = component["name"]
    columns = component.get("columns", [])
    versions = component.get("versions", [])
    version_link = component.get("version_link", True)

    summary = "Show dlv versions table" if name == "dlv" else f"Show {name} artifact table"
    lines = [f"## {name}", "", "<details>", f"<summary>{summary}</summary>", ""]

    headers = ["version", "binary", *columns]
    lines.append("| " + " | ".join(headers) + " |")
    lines.append("| " + " | ".join(["---"] * len(headers)) + " |")

    for version_item in versions:
        version = version_item.get("version", "")
        if version in PLACEHOLDER_VERSIONS:
            version = ""
        artifacts = version_item.get("artifacts", [])
        for idx, artifact in enumerate(artifacts):
            rendered = []
            version_text = version if idx == 0 else ""
            version_url = derive_version_url(name, version_text) if version_link else ""
            rendered.append(render_link(version_text, version_url))
            binary = artifact.get("binary", "")
            rendered.append(render_link(binary, derive_binary_url(name, binary)))
            for column in columns:
                rendered.append(get_column_value(artifact, column))
            lines.append("| " + " | ".join(rendered) + " |")

    lines.extend(["", "</details>", ""])
    return "\n".join(lines)


def load_components() -> list[dict]:
    components = []
    for file_path in COMPONENT_FILES:
        if not file_path.exists():
            continue
        payload = yaml.safe_load(file_path.read_text(encoding="utf-8")) or {}
        if payload:
            components.append(payload)
    return components


def main() -> None:
    components = load_components()

    nav_lines = [f"- [{item['name']}](#{make_anchor(item['name'])})" for item in components]

    content = [
        "# Container Debug Artifacts",
        "",
        "Prebuilt debug binaries and patch workflows for container runtimes.",
        "",
        '<img src="./image/debug.png" width=200>',
        "",
        "## Data source",
        "",
        "- Artifact tables are generated from per-project `artifacts.yaml` files.",
        "- Data files: `runc/`, `containerd/`, `docker/`, `kubernetes/`, `podman/`, `nvidia-container-toolkit/`, `delve/`.",
        "- Data shape is `versions[] -> artifacts[]`.",
        "- `version_url` is auto-derived from `component` and `version`.",
        "- `binary_url` is auto-derived from `component` and `binary`.",
        "- Regenerate with `python3 script/generate-readme.py`.",
        "",
        "## Roadmap",
        "",
        "- [ ] build a github action to monitor the release of container repositories",
        "- [ ] build container software builder",
        "- [ ] build container debug artifacts",
        "- [ ] publish these artifacts at this repo",
        "",
        "## Quick navigation",
        "",
        *nav_lines,
        "",
        "## Editing workflow",
        "",
        "1. Add or update `versions[].artifacts[]` in the target project's `artifacts.yaml`.",
        "2. Run `python3 script/generate-readme.py`.",
        "3. Run `python3 script/validate-readme-links.py`.",
        "",
    ]

    for component in components:
        content.append(render_component(component))

    README_FILE.write_text("\n".join(content).rstrip() + "\n", encoding="utf-8")


if __name__ == "__main__":
    main()
