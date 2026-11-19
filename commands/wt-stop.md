---
description: Finish the current worktree, or remove it if nothing changed
subagent: false
---

Use `bash "${XDG_CONFIG_HOME:-$HOME/.config}/opencode/scripts/opencode-worktree.sh"` for the script calls below. Quote all path and branch arguments. Stop on script failure unless the integration failed because of merge conflicts, as described below.

1. Run the script with `inspect`. Save the reported main path, task path, and branch.
   - If it reports `action=cleanup`, use the OpenCode `session_move` tool to switch to the main path.
   - Run the script from main with `cleanup TASK BRANCH`, using the saved values. Report the result and stop. Skip checks, commits, pulls, merges, and pushes.
2. Read `CONTRIBUTING.md` and applicable `AGENTS.md` instructions. Review changes and run the required checks.
3. Stage only this task's changes. Commit according to `CONTRIBUTING.md`. Skip the commit if there are no changes.
4. Run the script with `integrate` from the task worktree. It checks both worktrees, pulls main, and merges the task branch. If the merge has conflicts, resolve them in the main worktree, preserve intended behavior, and complete the merge. Stop on any other failure.
5. Use the OpenCode `session_move` tool to switch this session to the saved main path.
6. Run the required checks on the merged result. Fix task-related failures and commit fixes according to `CONTRIBUTING.md`.
7. Run the script from main with `publish TASK BRANCH`, using the saved values. It pushes main without force, then removes the task worktree and deletes its branch without force. On failure, stop.
8. Report the result. Keep the session in the main worktree.
