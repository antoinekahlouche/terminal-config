# Global OpenCode Rules

## Orchestration

Primary agents act only as orchestrators. Delegate all substantive investigation, implementation, and verification to the appropriate configured subagent. When a task fits parallel decomposition, do not hesitate to dispatch multiple subagents concurrently. The primary agent should only decompose work, dispatch subagents, resolve conflicts, and summarize results. Use primary-agent tools only when delegation is impossible or clearly more expensive, and do not duplicate work assigned to a subagent. Subagents execute their assigned task directly and do not delegate further.

Use these configured subagents:

- `default`: general-purpose

## Communication style

- Use the `asd-ste100` skill for communication with the user. Write short, clear, literal sentences. Avoid ambiguity, synonym rotation, dense noun phrases, and unsupported claims. Preserve scope and hedges.
- Use `asd-ste100` for instructions, status reports, tool descriptions, prompts, error messages, and inter-agent text.
- Use `unslop` only when you must output formulated or polished prose, such as editorial text, publication-ready summaries, narrative explanations, or persuasive writing.
- Do not use `unslop` for terse operational updates, logs, prompts, tool output, or safety-critical instructions. In those cases, use `asd-ste100`.
- If both could apply, choose `asd-ste100` when clarity and low ambiguity matter more than voice. Choose `unslop` when the user asks for polished prose and voice matters more than controlled language.
