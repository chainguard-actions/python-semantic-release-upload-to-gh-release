<!-- markdownlint-disable -->

# Hardening Report: python-semantic-release--upload-to-gh-release/v9.8.6

> This file was generated automatically by the hardening agent.

**Policy SHA:** `d636be7e43ef829af6e853da6b3c7566db9f72fe`

**Test Policy SHA:** `843adf9e4b8f85d0c08b27b9d0b09dd094b54702`

**Harden Agent Version:** `2`

Action **python-semantic-release--upload-to-gh-release/v9.8.6** was hardened automatically. 1 finding(s) were identified and resolved across 2 iteration(s).

## Findings Fixed

### unpinned-uses (severity: high)

Multiple workflow steps use action references pinned to mutable tags rather than immutable 40-character commit SHAs. This exposes the workflow to supply-chain attacks if the upstream tag is moved or the repository is compromised. Affected references in release.yml: `actions/checkout@v4` (×2), `python-semantic-release/python-semantic-release@v9.8.6`. Affected references in stale.yml: `actions/stale@v9` (×3). All should be pinned to full SHA digests with the tag retained as a comment, e.g. `actions/checkout@11bd71901bbe5b1630ceea73d27597364c9af683 # v4`.

Locations:

- `.github/workflows/release.yml:29`
- `.github/workflows/release.yml:46`
- `.github/workflows/release.yml:49`
- `.github/workflows/stale.yml:30`
- `.github/workflows/stale.yml:73`
- `.github/workflows/stale.yml:116`

## Iteration Notes

### Iteration 1

**Fixes applied:** unpinned-uses

**Notes:**

Pinned all 6 unpinned action references to full commit SHAs:
- release.yml line 29: actions/checkout@v4 → actions/checkout@11d5960a326750d5838078e36cf38b85af677262 # v4
- release.yml line 46: actions/checkout@v4 → actions/checkout@11d5960a326750d5838078e36cf38b85af677262 # v4
- release.yml line 49: python-semantic-release/python-semantic-release@v9.8.6 → python-semantic-release/python-semantic-release@dec06aa649fddae6610bc64878868498bfcbad7b # v9.8.6
- stale.yml line 30: actions/stale@v9 → actions/stale@5bef64f19d7facfb25b37b414482c7164d639639 # v9
- stale.yml line 73: actions/stale@v9 → actions/stale@5bef64f19d7facfb25b37b414482c7164d639639 # v9
- stale.yml line 116: actions/stale@v9 → actions/stale@5bef64f19d7facfb25b37b414482c7164d639639 # v9
All original tags are preserved as inline comments for readability.

### Iteration 2

**Fixes applied:** script-injection, suspicious-run-content

**Notes:**

Rewrote action.sh to eliminate both findings: (1) Removed the `explicit_run_cmd` helper that used `eval "$cmd"` — replaced with direct array-based command execution. (2) Fixed `${INPUT_ROOT_OPTIONS}` injection by safely tokenizing it into a bash array using `xargs printf '%s\0'` with a null-delimited read loop, which handles quoted sub-arguments while preventing shell metacharacter injection. (3) Fixed `${INPUT_TAG}` injection by making it a properly quoted separate array element (`--tag "${INPUT_TAG}"`) instead of embedding it unquoted inside a string. The final command is now `"$PSR_VENV_BIN/semantic-release" "${ROOT_OPTIONS_ARGS[@]}" publish "${PUBLISH_ARGS[@]}"` — no eval, no unquoted user-controlled values.

