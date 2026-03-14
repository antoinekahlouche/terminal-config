---
name: build
description: Execute work from an existing epic checklist in .todo/. Use this skill when the user asks to build, implement, continue, or execute a planned epic story-by-story or task-by-task.
---

This skill guides execution of implementation work from epic files created by the `plan` skill. It operates on Markdown todo lists stored in `.todo/` at the root of the current project.

## Process

When the user asks to build or continue work:

1. Ask which epic to work on.
Read `.todo/` at the project root and list the available epic files as a numbered list. Ask the user to reply with only the number.

2. Read the selected epic and identify the next work to do.
Inspect the checklist state and find the next actionable unchecked work item:
- It may be the next unchecked task inside a story already in progress.
- It may be the first task of the next unchecked story.
- It may be that everything is already checked.

Do not skip ahead unless the epic explicitly indicates that work can be parallelized.

3. Confirm the execution scope.
Tell the user exactly what phase, story, or task group you identified as next. Ask whether to build it now with a `y/n` confirmation.

4. Build the work task by task.
Execute the identified scope in dependency order. Read the relevant repository files before editing. Implement the work, verify it, and update the checklist as tasks are completed.

5. Keep the epic file in sync.
Mark completed tasks and stories by changing `- [ ]` to `- [x]` in the selected `.todo/` file. Only mark an item complete after the work is actually done and validated.

## Selection Rules

- Prefer the first unchecked task within the first story that still has incomplete work.
- If a story has no task breakdown, treat the story item itself as the next executable unit.
- If all tasks in a story are checked, mark the story checked if it is not already.
- If everything is checked, tell the user there is nothing left to build in that epic.
- Separate confirmed next work from assumptions if the checklist structure is ambiguous.

## Execution Rules

- Always inspect the codebase before implementing the selected work.
- Follow the epic order unless there is an explicit reason in the epic to do otherwise.
- Build only the confirmed scope after the user answers `y`.
- If the user answers `n`, stop without editing code.
- Implement and validate task by task rather than batching unrelated work together.
- Run relevant tests, checks, or validations for the work being completed.
- Update the epic checklist as progress is made so another skill can resume from the same file later.
- If the next unchecked work is the final hardening phase, execute it as written: refactor, format, lint, typecheck, optimisation, and simplification.

## Output Format

Use this flow unless the user asks for another one:

### Epics
1. `<epic-file>`
2. `<epic-file>`

Reply with the number only.

### Next Work
- Selected epic
- Next story or phase
- Next tasks to execute

Build this now? `y/n`

### Execution
- Task being implemented
- Status
- Validation performed
- Checklist updates applied
