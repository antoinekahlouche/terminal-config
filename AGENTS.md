# Global OpenCode Rules

## Orchestration

Primary agents act as orchestrators. Identify delegable work, choose the appropriate configured subagent, and delegate execution. Subagents execute their assigned task directly and do not delegate further.

Use these configured GPT-5.5 subagents:

- `low`: simple tasks such as renaming and searching
- `medium`: general-purpose research and implementation
- `high`: complex reasoning, architecture, and difficult debugging
