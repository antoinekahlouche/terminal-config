---
description: Start work in a new worktree
subagent: false
---

1. Find the main worktree with `git worktree list --porcelain`. Stop if it has uncommitted changes.
2. Run `git pull --ff-only` on `main` in that worktree. Stop on failure.
3. Use `$ARGUMENTS` as the subject. Ask for the subject if empty.
4. Convert the subject to a lowercase ASCII slug. Replace non-alphanumeric runs with hyphens and trim surrounding hyphens. Reject an empty slug.
5. Create a branch and sibling worktree named with that slug, based on `main`. Do not overwrite an existing branch or directory.
6. Use the OpenCode `session_move` tool to switch this session to the new worktree. Report its path and branch.
