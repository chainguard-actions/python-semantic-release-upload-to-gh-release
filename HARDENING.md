<!-- markdownlint-disable -->

# Hardening Report: python-semantic-release--upload-to-gh-release/v9.8.8

> This file was generated automatically by the hardening agent.

**Policy SHA:** `d636be7e43ef829af6e853da6b3c7566db9f72fe`

**Test Policy SHA:** `843adf9e4b8f85d0c08b27b9d0b09dd094b54702`

**Harden Agent Version:** `2`

Action **python-semantic-release--upload-to-gh-release/v9.8.8** was hardened automatically. 1 finding(s) were identified and resolved across 1 iteration(s).

## Findings Fixed

### unpinned-uses (severity: high)

Multiple workflow files reference GitHub Actions using mutable version tags instead of pinned 40-character commit SHAs. This exposes the workflow to supply-chain attacks where a tag could be silently moved to point to malicious code. Failing references:
- .github/workflows/release.yml: `actions/checkout@v4` (line 29), `actions/checkout@v4` (line 47), `python-semantic-release/python-semantic-release@v9.8.8` (line 52)
- .github/workflows/stale.yml: `actions/stale@v9` (line 27), `actions/stale@v9` (line 63), `actions/stale@v9` (line 96)

All should be pinned to their full 40-character commit SHA, e.g. `actions/checkout@11bd71901bbe5b1630ceea73d27597364c9af683 # v4`.

Locations:

- `.github/workflows/release.yml:29`
- `.github/workflows/release.yml:47`
- `.github/workflows/release.yml:52`
- `.github/workflows/stale.yml:27`
- `.github/workflows/stale.yml:63`
- `.github/workflows/stale.yml:96`

## Iteration Notes

### Iteration 1

**Fixes applied:** unpinned-uses

**Notes:**

Pinned all 6 unpinned action references to their full 40-character commit SHAs:
- actions/checkout@v4 → @11d5960a326750d5838078e36cf38b85af677262 # v4 (2 occurrences in release.yml)
- python-semantic-release/python-semantic-release@v9.8.8 → @fe6b271e942115b528c85e42bc19611b01dcea59 # v9.8.8 (1 occurrence in release.yml)
- actions/stale@v9 → @5bef64f19d7facfb25b37b414482c7164d639639 # v9 (3 occurrences in stale.yml)
All SHAs were resolved via lookup_action_sha. Original tags preserved as inline comments for readability.

