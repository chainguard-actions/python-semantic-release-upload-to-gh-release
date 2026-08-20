<!-- markdownlint-disable -->

# Hardening Report: python-semantic-release--upload-to-gh-release/v9.8.9

> This file was generated automatically by the hardening agent.

**Policy SHA:** `d636be7e43ef829af6e853da6b3c7566db9f72fe`

**Test Policy SHA:** `843adf9e4b8f85d0c08b27b9d0b09dd094b54702`

**Harden Agent Version:** `2`

Action **python-semantic-release--upload-to-gh-release/v9.8.9** was hardened automatically. 1 finding(s) were identified and resolved across 1 iteration(s).

## Findings Fixed

### unpinned-uses (severity: high)

Multiple `uses:` references in workflow files use mutable tags instead of full 40-character SHA commit hashes, making the workflows vulnerable to supply-chain attacks if the referenced action tags are moved or compromised.

Failing references:
- `.github/workflows/release.yml`: `actions/checkout@v4` (appears twice), `python-semantic-release/python-semantic-release@v9.8.8`
- `.github/workflows/stale.yml`: `actions/stale@v9` (appears three times)

All of these should be pinned to their full commit SHA, e.g. `actions/checkout@11bd71901bbe5b1630ceea73d27597364c9af683 # v4`.

Locations:

- `.github/workflows/release.yml:31`
- `.github/workflows/release.yml:43`
- `.github/workflows/release.yml:50`
- `.github/workflows/stale.yml:24`
- `.github/workflows/stale.yml:72`
- `.github/workflows/stale.yml:100`

## Iteration Notes

### Iteration 1

**Fixes applied:** unpinned-uses

**Notes:**

Pinned all 6 unpinned `uses:` references to their full 40-character SHA commit hashes:
- `.github/workflows/release.yml`: Both `actions/checkout@v4` → `@11d5960a326750d5838078e36cf38b85af677262 # v4`; `python-semantic-release/python-semantic-release@v9.8.8` → `@fe6b271e942115b528c85e42bc19611b01dcea59 # v9.8.8`
- `.github/workflows/stale.yml`: All three `actions/stale@v9` → `@5bef64f19d7facfb25b37b414482c7164d639639 # v9`
Original tag names preserved as inline comments for readability.

