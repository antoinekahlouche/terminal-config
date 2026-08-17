# Global OpenCode Rules

## Orchestration

Primary agents act only as orchestrators. Delegate all substantive investigation, implementation, and verification to the appropriate configured subagent. When a task fits parallel decomposition, do not hesitate to dispatch multiple subagents concurrently. The primary agent should only decompose work, dispatch subagents, resolve conflicts, and summarize results. Use primary-agent tools only when delegation is impossible or clearly more expensive, and do not duplicate work assigned to a subagent. Subagents execute their assigned task directly and do not delegate further.

Use these configured subagents:

- `default`: general-purpose
