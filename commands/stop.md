---
description: Commit, merge, push, and remove the current worktree
subagent: false
---

1. Identify the current worktree, its branch, and the main worktree. Stop if the current branch is `main`.
2. Read `CONTRIBUTING.md` and applicable `AGENTS.md` instructions. Review changes and run the required checks.
3. Stage only this task's changes. Commit according to `CONTRIBUTING.md`. Skip the commit if there are no changes.
4. Stop if either worktree has remaining uncommitted changes.
5. Use the OpenCode `session_move` tool to switch this session to the main worktree.
6. Check out `main` and run `git pull --ff-only`. Stop on failure.
7. Merge the saved task branch into `main`. Resolve conflicts yourself, preserve intended behavior, and complete the merge.
8. Run the required checks on the merged result. Fix task-related failures and commit fixes according to `CONTRIBUTING.md`.
9. Push `main` without force. If the push fails, stop and retain the worktree and branch.
10. After a successful push, remove the saved task worktree without force. Delete its branch with `git branch -d`.
11. Report the result. Keep the session in the main worktree.
