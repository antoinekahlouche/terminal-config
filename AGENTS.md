# Global OpenCode Rules

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
