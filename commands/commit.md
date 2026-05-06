---
description: Review changes, propose commits, and commit after confirmation
---

Review the current git diff and decide whether it should be one commit or multiple atomic commits.

Rules:

1. Output only the proposed commit message(s), one per line.
2. Write all commit message(s) in English.
3. Use Conventional Commits: https://www.conventionalcommits.org/en/v1.0.0/
4. Never add `Co-Authored-By` trailers.
5. After the commit message(s), output a blank line, then exactly this line:
   `r = Reject, c = Commit, p = commit + Push`
6. Do not output any explanation, summary, rationale, or extra text.
7. Do not commit until the user explicitly chooses `c` or `p`.
8. If the user chooses `r`, restart this command from the beginning and come up with different commit message(s).
9. If the user chooses `c`, create the commit(s).
10. If the user chooses `p`, create the commit(s) and then push.
