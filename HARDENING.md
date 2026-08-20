<!-- markdownlint-disable -->

# Hardening Report: python-semantic-release--upload-to-gh-release/v9.8.7

> This file was generated automatically by the hardening agent.

**Policy SHA:** `d636be7e43ef829af6e853da6b3c7566db9f72fe`

**Test Policy SHA:** `843adf9e4b8f85d0c08b27b9d0b09dd094b54702`

**Harden Agent Version:** `2`

Action **python-semantic-release--upload-to-gh-release/v9.8.7** was hardened automatically. 1 finding(s) were identified and resolved across 1 iteration(s).

## Findings Fixed

### unpinned-uses (severity: high)

Multiple workflow files reference GitHub Actions using mutable tags instead of full 40-character SHA commit digests. This exposes the workflow to supply-chain attacks if the referenced tag is moved or the upstream repository is compromised.

In .github/workflows/release.yml:
- `uses: actions/checkout@v4` (build job, line 29)
- `uses: actions/checkout@v4` (release job, line 44)
- `uses: python-semantic-release/python-semantic-release@v9.8.6` (line 47)

In .github/workflows/stale.yml:
- `uses: actions/stale@v9` (Stale Issues/PRs step, line 29)
- `uses: actions/stale@v9` (Unresponsive Issues/PRs step)
- `uses: actions/stale@v9` (Reminders on Confirmed Issues/PRs step)

All of these should be pinned to their full SHA digest, e.g. `actions/checkout@11bd71901bbe5b1630ceea73d27597364c9af683 # v4`.

Locations:

- `.github/workflows/release.yml:29`
- `.github/workflows/release.yml:44`
- `.github/workflows/release.yml:47`
- `.github/workflows/stale.yml:29`

## Iteration Notes

### Iteration 1

**Fixes applied:** unpinned-uses

**Notes:**

Pinned all mutable tag references to full 40-character SHA digests:
- release.yml: Both `actions/checkout@v4` references pinned to `11d5960a326750d5838078e36cf38b85af677262` and `python-semantic-release/python-semantic-release@v9.8.6` pinned to `dec06aa649fddae6610bc64878868498bfcbad7b`
- stale.yml: All three `actions/stale@v9` references pinned to `5bef64f19d7facfb25b37b414482c7164d639639`
Original tags preserved as inline comments for readability.

