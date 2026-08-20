#!/bin/bash

set -e

# See https://github.com/actions/runner-images/issues/6775#issuecomment-1409268124
# and https://github.com/actions/runner-images/issues/6775#issuecomment-1410270956
git config --system --add safe.directory "*"

# Change to configured directory
cd "${INPUT_DIRECTORY}"

# Make Token available as a correctly-named environment variables
export GH_TOKEN="${INPUT_GITHUB_TOKEN}"

# Safely tokenize INPUT_ROOT_OPTIONS into an array (handles quoted sub-arguments)
ROOT_OPTIONS_ARGS=()
if [ -n "${INPUT_ROOT_OPTIONS}" ]; then
  while IFS= read -r -d '' t; do ROOT_OPTIONS_ARGS+=("$t"); done \
    < <(printf '%s' "${INPUT_ROOT_OPTIONS}" | xargs printf '%s\0')
fi

# Bash array to store publish arguments
PUBLISH_ARGS=()

# Add publish arguments as necessary
if [ -n "${INPUT_TAG}" ]; then
  PUBLISH_ARGS+=(--tag "${INPUT_TAG}")
fi

# Run Semantic Release
printf '%s\n' "> $PSR_VENV_BIN/semantic-release ${ROOT_OPTIONS_ARGS[*]} publish ${PUBLISH_ARGS[*]}"
"$PSR_VENV_BIN/semantic-release" "${ROOT_OPTIONS_ARGS[@]}" publish "${PUBLISH_ARGS[@]}"
