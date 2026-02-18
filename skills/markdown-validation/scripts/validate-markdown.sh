#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

npx -y markdownlint-cli2 --fix --config "$SCRIPT_DIR/.markdownlint-cli2.jsonc" "$@"
