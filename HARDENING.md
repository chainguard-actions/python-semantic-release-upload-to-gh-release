<!-- markdownlint-disable -->

# Hardening Report: python-semantic-release--upload-to-gh-release/v9.8.5

> This file was generated automatically by the hardening agent.

**Policy SHA:** `d636be7e43ef829af6e853da6b3c7566db9f72fe`

**Test Policy SHA:** `843adf9e4b8f85d0c08b27b9d0b09dd094b54702`

**Harden Agent Version:** `2`

Action **python-semantic-release--upload-to-gh-release/v9.8.5** was hardened automatically. 1 finding(s) were identified and resolved across 1 iteration(s).

## Findings Fixed

### unpinned-uses (severity: high)

Workflow files reference GitHub Actions by mutable tag/version strings instead of pinned 40-character commit SHAs. This exposes the workflow to supply-chain attacks if the referenced tag is moved or the upstream repository is compromised.

In .github/workflows/release.yml:
  - uses: actions/checkout@v4  (line ~30 and ~42)
  - uses: python-semantic-release/python-semantic-release@v9.8.3  (line ~48)

In .github/workflows/stale.yml:
  - uses: actions/stale@v9  (appears 3 times, lines ~28, ~68, ~100)

All of these should be pinned to their full 40-character commit SHA, e.g.:
  uses: actions/checkout@11bd71901bbe5b1630ceea73d27597364c9af683 # v4

Locations:

- `.github/workflows/release.yml:30`
- `.github/workflows/release.yml:42`
- `.github/workflows/release.yml:48`
- `.github/workflows/stale.yml:28`
- `.github/workflows/stale.yml:68`
- `.github/workflows/stale.yml:100`

## Iteration Notes

### Iteration 1

**Fixes applied:** unpinned-uses

**Notes:**

Pinned all 6 unpinned action references to their full 40-character commit SHAs:
- release.yml: actions/checkout@v4 → @11d5960a326750d5838078e36cf38b85af677262 # v4 (2 occurrences)
- release.yml: python-semantic-release/python-semantic-release@v9.8.3 → @0f4c0b152e115c266c7a838c8e3997483a44de64 # v9.8.3
- stale.yml: actions/stale@v9 → @5bef64f19d7facfb25b37b414482c7164d639639 # v9 (3 occurrences)
Original tag names preserved as inline comments for readability.

