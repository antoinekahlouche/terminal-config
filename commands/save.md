---
description: Stage all changes, generate a commit message, commit, and push
subagent: false
---

Save all changes in the current Git repository. Stop on any failure and report it.

1. Run `git rev-parse --show-toplevel` to find the repository root. Run all subsequent Git commands from that root.
2. Run `git add --all` to stage all changes, including untracked files and deletions.
3. Check for staged changes with `git diff --cached --quiet`. Exit code 1 means changes exist; any other nonzero code is a failure. If there are no staged changes, skip the commit and continue to the push.
4. Inspect the staged diff with `git diff --cached --no-ext-diff --no-textconv --no-color`. Generate an English Conventional Commit message, using the same rule as the Lazygit helper: "Write a commit message for the staged diff using Conventional Commits. Output only the message on one line." Generate the message yourself; do not require Codex. Do not add a `Co-Authored-By` trailer.
5. Run `git commit -m MESSAGE`, passing the generated message as one safely quoted argument. Do not amend an existing commit or bypass hooks.
6. Run `git push` to push the current branch to its configured upstream. Do not force-push. If no upstream is configured, report that and stop rather than guessing a remote or branch.
7. Report the commit and push result. If the push fails after a successful commit, state that the commit exists locally but was not pushed.
