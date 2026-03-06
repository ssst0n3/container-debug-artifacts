# AGENTS.md

## Purpose and Scope

This repository is a patch-and-build orchestration workspace for container projects.
It is not a single Go module with one global test command.
Most work happens inside versioned subdirectories (for example `containerd/v2.1.1/`, `docker/v28.0.4/`, `runc/v1.2.6/`).

Primary workflow:
1. Enter a version directory.
2. Clone upstream source (or reuse existing clone).
3. Apply local patches from `patch/` using `apply-patch.sh` or `patch.sh`.
4. Build dev image (`make image` or project-specific target).
5. Enter dev shell (`make shell`) and run build/test/debug targets in upstream source.

---

## Repository Layout Conventions

- `*/<version>/patch/*.patch`: ordered patch files.
- `*/<version>/series.conf` or `patch.conf`: patch apply order.
- `*/<version>/apply-patch.sh` or `patch.sh`: applies patches with `patch -p1`.
- `*/<version>/image.sh`: clones upstream repo, applies patches, runs project image build target.
- `script/check.sh`: scans all `apply-patch.sh` locations and checks image tags/manifests.

When adding a new version folder, follow existing naming and script structure.

---

## Build, Lint, and Test Commands

## Top-level / utility

- Check image tags referenced by patch folders:
  - `bash script/check.sh`

## Generic per-version bootstrap pattern

From a version directory (example: `containerd/v2.1.1`):
- Build or prepare dev image: `./image.sh`
- Apply patches only: `./apply-patch.sh` (or `./patch.sh` in kubernetes folder)

Then enter cloned upstream source and use its Makefile targets.

## containerd (`containerd/v2.1.1/containerd`)

- Build binaries: `make`
- Lint/check: `make check`
- Unit/non-root tests: `make test`
- Root-required tests: `make root-test`
- Integration tests: `make integration`

Single test examples:
- Non-root single test:
  - `go test -v -run "<TEST_NAME>" ./path/to/package`
- Root-required single test:
  - `go test -v -run "<TEST_NAME>" ./path/to/package -test.root`

Useful knobs:
- `TESTFLAGS="..." make test`
- `TESTFLAGS_PARALLEL=1 make integration`

## moby / docker daemon source (`docker/v28.0.4/moby`)

- Build dev image/container env: `make build`
- Build static binaries: `make binary`
- Unit tests: `make test-unit`
- Integration tests: `make test-integration`
- Full test target: `make test`
- Validation/lint bundle: `make validate`

Single test examples (recommended via env vars consumed by `hack/test/unit`):
- Single test name:
  - `TESTFLAGS='-v -run TestXxx' make test-unit`
- Narrow package scope:
  - `TESTDIRS='./pkg/term' TESTFLAGS='-v -run TestTerm' make test-unit`

## podman (`podman/v5.5.1/podman`)

- Build binaries: `make binaries`
- Lint: `make lint`
- Source validation: `make validate-source`
- Full PR-style validation: `make validatepr`
- Unit tests: `make localunit`
- Integration tests (local): `make localintegration`
- Integration tests (remote): `make remoteintegration`
- System tests: `make localsystem` / `make remotesystem`

Single test examples (Ginkgo based):
- Focus by description:
  - `make localintegration FOCUS="podman inspect bogus pod"`
- Focus by file:
  - `make localintegration FOCUS_FILE=your_test.go`
- Extra Ginkgo flags:
  - `make localintegration TESTFLAGS='--fail-fast'`

## nvidia-container-toolkit (`nvidia-container-toolkit/v1.17.6/nvidia-container-toolkit`)

- Build all: `make build`
- Format: `make fmt`
- Lint: `make lint`
- Tests with coverage: `make test`
- Vendor sync/check: `make vendor` and `make check-vendor`

Single test example:
- `go test -v -run "<TEST_NAME>" ./path/to/package`

## runc-based folders (example `runc/v1.2.6/runc` after patching)

- Build image: `make runcimage` (from patched upstream Makefile)
- Open shell in build container: `make shell`
- Build debug artifacts: `make debug`

---

## Code Style Guidelines

## General

- Keep changes minimal and version-scoped.
- Prefer editing patch scripts and patch files in the version directory instead of ad-hoc edits elsewhere.
- Preserve existing file/directory naming patterns.
- Do not reformat unrelated lines.

## Imports and formatting (Go code in patches)

- Use `gofmt` style for all Go changes.
- Keep imports grouped as standard library, then third-party, then project-local.
- Use blank import (`_ "pkg/path"`) only when side effects are intentional and documented by context.
- Avoid introducing formatting-only diffs in large upstream files.

## Types and API usage

- Prefer concrete types at boundaries when required; otherwise use interfaces already used by upstream code.
- Do not introduce new exported APIs unless required by the patch goal.
- Keep compatibility with the pinned upstream version in each folder.

## Naming conventions

- Follow upstream project conventions in the target repo being patched.
- Bash: use lowercase variables for local script state (`cwd`, `src`, `series`), uppercase only for env-style globals.
- Patch files: keep numeric prefix order (`0001-...`, `0002-...`) and descriptive kebab-case suffixes.

## Error handling

- Bash scripts should fail early for critical failures; avoid silently swallowing errors.
- In Go patches, return errors with context; avoid panic in normal control flow.
- Keep behavior deterministic and reproducible for build scripts.

## Shell scripting rules

- Use `#!/bin/bash` and consistent indentation.
- Quote variable expansions unless word-splitting is intentional.
- Prefer explicit paths and predictable working directories.
- Avoid destructive git operations in helper scripts.

## Patches and series files

- Every patch referenced in `series.conf`/`patch.conf` must exist.
- Keep patch apply order stable and append new patches to the end unless reordering is required.
- After changing patches, re-run `./apply-patch.sh` from a clean upstream checkout.

---

## Validation Checklist Before Submitting Changes

- Scripts execute without path assumptions outside their version folder.
- Patch apply works cleanly on expected upstream tag/commit.
- Targeted project build succeeds (`make`/`make build`/`make image`).
- Relevant lint/tests pass for touched components.
- Single-test invocation path is documented if adding new test workflows.

---

## Agent-Specific Notes

- There are currently no repository-level Cursor rule files:
  - `.cursor/rules/` not present
  - `.cursorrules` not present
- There is currently no Copilot instruction file:
  - `.github/copilot-instructions.md` not present

If these files are added later, treat them as higher-priority constraints and update this document.
