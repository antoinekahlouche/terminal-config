---
description: Start work in a new worktree
subagent: false
---

1. Use `$ARGUMENTS` as the subject. Ask for the subject if empty.
2. Simplify the subject to 1–5 words that describe the task. Convert those words to a lowercase ASCII slug. Replace non-alphanumeric runs with hyphens and trim surrounding hyphens. Reject an empty slug.
3. Run `bash "${XDG_CONFIG_HOME:-$HOME/.config}/opencode/scripts/opencode-worktree.sh" start SLUG` with the slug as a quoted argument. Do not interpolate the raw subject into shell code. The script checks main, pulls, and creates the branch and sibling worktree. Stop on failure.
4. Use the OpenCode `session_move` tool to switch this session to the reported task path. Report its path and branch.
