---
description: Review changes and create atomic commits
agent: commit
---

Review the current Git changes and create the smallest sensible set of atomic commits.

Rules:

1. Write all commit message(s) in English.
2. Use Conventional Commits: https://www.conventionalcommits.org/en/v1.0.0/
3. Never add `Co-Authored-By` trailers.
4. Run `git commit` immediately without asking for confirmation.
5. Prefer one commit; split only changes that are clearly independent.
6. Do not run tests, lint, typecheck, formatting, push, or post-commit checks.
