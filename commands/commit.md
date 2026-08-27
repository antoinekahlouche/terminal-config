---
description: Generate a commit message for staged changes
agent: commit
---

Generate one commit message for the staged Git changes.

Rules:

1. Write the commit message in English.
2. Use Conventional Commits: https://www.conventionalcommits.org/en/v1.0.0/
3. Output exactly one subject line.
4. Do not output Markdown, quotes, code fences, or explanations.
5. Never add `Co-Authored-By` trailers.
6. Inspect only what is necessary to write the message.
7. Do not stage files, commit, push, run tests, lint, typecheck, format, or ask questions.

User guidance, if any: $ARGUMENTS
