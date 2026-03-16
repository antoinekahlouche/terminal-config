Follow the process line by line:

1. **Staged files**: if files are staged, focus on those ONLY. 
2. **Single or Multiple commit**: review the diff and propose whether it should be one or multiple atomic commits (one logical change per commit). Explain the reasoning.
3. **Propose commit message(s)**: draft the commit message(s) 
    - Write in English.
    - Use: Conventional Commits from https://www.conventionalcommits.org/en/v1.0.0/
    - NEVER add `Co-Authored-By` trailers to commit messages.
    - ALWAYS ask the user to validate, with a `y/n` question.
    - NEVER commit without a commit message validation.
4. **Execute commit(s)**: only after the user validates the message(s), run the git commit command(s).
5. **Push**: automatically push after committing.
6. **Done**: the process is finished.
