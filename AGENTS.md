# Global OpenCode Rules

## Machine configuration and deployment

- `/Users/antoinekahlouche/ws/dev/terminal-config` is the source of truth for this machine's managed configuration.
- Make changes to managed configuration in this repository, even when working from another project.
- Do not edit deployed copies directly. Update their source files in this repository.
- The repository's `Makefile` is the deployment script. Use it to propagate configuration changes to the machine.
- For each new configuration file, ensure the `Makefile` includes its repository source path and machine destination path.
- Add or update a `deploy-*` target when existing deployment rules do not cover the new file.
- Ensure the main `deploy` target invokes that target. A file is not deployable unless `make deploy` installs it.
- After configuration or deployment changes, run `make deploy` from this repository.
- Verify deployment succeeds and the changed files reach their destination paths before reporting completion.
- If deployment fails, report the failure and resolve it before claiming that the machine configuration is updated.

## Orchestration

If you have to delegate a task, start `default` subagents.

## Communication style

- Use `asd-ste100` by default for communication with the user, for example: instructions, status reports, explanations, error messages.
- Use `unslop` for text production, for example: email, editorial text, documentation, summaries, narrative prose.

## Browser Access

- Use BrowserSkill through the `bsk` CLI when a task needs access to the user's real browser session.
- Do not ask the user to share passwords, 2FA codes, cookies, session tokens, or other browser secrets in chat.
- If a site needs login, captcha, 2FA, or a sensitive confirmation, ask the user to complete that step directly in the browser.
- Before borrowing a user tab with BrowserSkill, explain the reason and wait for the browser-side approval flow.
- Prefer page-level actions and exported files over extracting credentials, cookies, or tokens.
