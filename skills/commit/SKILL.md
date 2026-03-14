---
name: commit
origin: https://github.com/zed-industries/zed/blob/main/crates/git_ui/src/commit_message_prompt.txt
description: Write clear, well-structured Git commit messages following conventional prefixes and good Git style. Use this skill when the user asks to commit changes, write a commit message, or summarize changes for version control.
---

This skill guides writing of short, clear Git commit messages that accurately summarize changes.

## Process

When the user asks to commit or says "git commit":

1. **Analyze changes** — review the diff and propose whether it should be one or multiple atomic commits (one logical change per commit). Explain the reasoning and ask the user to validate.
2. **Propose commit message(s)** — draft the commit message(s) following the rules below and ALWAYS ask the user to validate. NEVER commit without a commit message validation.
3. **Execute commit(s)** — only after the user validates the message(s), run the git commit command(s).
4. **Push** — automatically push after committing.

## Commit message

You are an expert at writing Git commits. Your job is to write a short clear commit message that summarizes the changes.

If you can accurately express the change in just the subject line, don't include anything in the message body. Only use the body when it is providing *useful* information.

Don't repeat information from the subject line in the message body.

Only return the commit message in your response. Do not include any additional meta-commentary about the task. Do not include the raw diff output in the commit message.

Follow good Git style:

- Separate the subject from the body with a blank line
- Try to limit the subject line to 50 characters
- Capitalize the subject line
- Do not end the subject line with any punctuation
- Use the imperative mood in the subject line
- Wrap the body at 72 characters
- Keep the body short and concise (omit it entirely if not useful)

Prefix every commit message with the type :
- ✨ FEAT Commits that add, adjust or remove a new feature to the API or UI
- 🐛 FIX Commits that fix an API or UI bug of a preceded feat commit
- ♻️ REFACTOR Commits that rewrite or restructure code without altering API or UI behavior
- 🎨 STYLE Commits that address code style (e.g., white-space, formatting, missing semi-colons) and do not affect application behavior
- ⏪ REVERT Commits that revert a previous commit
- 🧪 TEST Commits that add missing tests or correct existing ones
- 📝 DOCS Commits that exclusively affect documentation
- 🏗️ BUILD Commits that affect build-related components such as build tools, dependencies, project version, ...
- 🚀 OPS Commits that affect operational aspects like infrastructure (IaC), deployment scripts, CI/CD pipelines, backups, monitoring, or recovery procedures, ...
- 🔧 CHORE Commits that represent tasks like initial commit, modifying .gitignore, ...

The type shoud be ALL CAPS, then a colon, a space and then the subject

Write in English

NEVER add `Co-Authored-By` trailers to commit messages
