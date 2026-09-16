#!/bin/sh
set -eu

repo_root=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
actual=$(mktemp)
trap 'rm -f "$actual"' EXIT HUP INT TERM

awk -f "$repo_root/_scripts/filter_codex_config.awk" \
	"$repo_root/tests/fixtures/codex-config-input.toml" >"$actual"

diff -u "$repo_root/tests/fixtures/codex-config-expected.toml" "$actual"
