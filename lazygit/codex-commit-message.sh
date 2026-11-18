#!/bin/sh
set -eu

if ! command -v codex >/dev/null 2>&1; then
    echo 'Codex is not installed or is not in PATH.' >&2
    exit 1
fi

tmpdir=$(mktemp -d "${TMPDIR:-/tmp}/lazygit-codex.XXXXXX")
trap 'rm -f "$tmpdir/diff" "$tmpdir/message" "$tmpdir/log"; rmdir "$tmpdir"' EXIT
trap 'exit 1' HUP INT TERM

git diff --cached --no-ext-diff --no-textconv --no-color > "$tmpdir/diff"
if [ ! -s "$tmpdir/diff" ]; then
    echo 'Stage changes before generating a commit message.' >&2
    exit 1
fi

if ! codex exec --sandbox read-only --ephemeral --color never \
    --output-last-message "$tmpdir/message" \
    'Write a commit message for the staged diff using Conventional Commits. Output only the message on one line.' \
    < "$tmpdir/diff" > "$tmpdir/log" 2>&1; then
    cat "$tmpdir/log" >&2
    exit 1
fi

if [ ! -s "$tmpdir/message" ]; then
    echo 'Codex returned an empty commit message.' >&2
    exit 1
fi

# Lazygit requires runCommand output to contain only one line.
tr '\r\n' '  ' < "$tmpdir/message" | sed 's/^[[:space:]]*//; s/[[:space:]]*$//'
printf '\n'
