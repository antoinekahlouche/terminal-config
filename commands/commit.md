---
description: Review changes, propose commits, and commit after confirmation
---

Follow the process line by line:

1. **Single or Multiple commit**: review the diff and propose whether it should be one or multiple atomic commits (one logical change per commit). Explain the reasoning.
2. **Propose commit message(s)**: draft the commit message(s)
    - Write in English.
    - Use: Conventional Commits from https://www.conventionalcommits.org/en/v1.0.0/
    - NEVER add `Co-Authored-By` trailers to commit messages.
    - ALWAYS ask the user to validate, with a `y/n` question.
    - NEVER commit without a commit message validation.
3. **Execute commit(s)**: only after the user validates the message(s), run the git commit command(s).
4. **Push**: automatically push after committing.
5. **Done**: the process is finished.
