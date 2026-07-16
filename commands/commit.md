---
description: Review changes, create atomic commits, and push by default
---

Review the current git diff and decide whether it should be one commit or multiple atomic commits.

Rules:

1. Write all commit message(s) in English.
2. Use Conventional Commits: https://www.conventionalcommits.org/en/v1.0.0/
3. Never add `Co-Authored-By` trailers.
4. Run `git commit` immediately without asking for confirmation.
5. Pushing is mandatory. Do not finish the command after creating commits.
6. Push the current branch:
   - If it has an upstream, run `git push`.
   - Otherwise, run `git push -u origin HEAD`.
7. Verify the push with `git status --short --branch` and confirm the branch is not ahead of its upstream.
8. Do not report success until push verification passes. If pushing fails, report the exact error and leave the commits intact.
