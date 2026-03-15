---
name: build
description: Execute work from an existing story checklist in .stories/. Use this skill when the user asks to build, implement, continue, or execute a planned task list.
---

This skill guides execution of implementation work from story files created by the `plan` skill. It operates on Markdown todo lists stored in `.stories/` at the root of the current project. The user chooses which story file to trigger.

## Process

When the user asks to build or continue work:

1. Read `.stories/` at the project root and identify the story file to execute.
Use the story file specified by the user.

2. Read the selected story file and identify the next work to do.
Inspect the checklist state and find the next actionable unchecked task.

Do not skip ahead unless the story explicitly indicates that work can be parallelized.

3. Execute the task list in order.
Follow the checklist from top to bottom until all tasks are complete or execution must stop.

4. Build the work task by task.
Execute tasks in dependency order. Read the relevant repository files before editing. Implement the work, verify it, and update the checklist immediately as each task is completed.

5. Keep the story file in sync.
Mark completed tasks by changing `- [ ]` to `- [x]` in the selected `.stories/` file as soon as each task is actually done and validated. This process may stop mid-execution, so the checklist must always reflect the latest completed task.

## Selection Rules

- Prefer the first unchecked task in the file.
- Treat the whole file as a single story.
- Do not choose a different story file on the user's behalf.
- If everything is checked, tell the user that this story is done and there is nothing more to do.
- Separate confirmed next work from assumptions if the checklist structure is ambiguous.

## Execution Rules

- Always inspect the codebase before implementing the selected work.
- Follow the task order in the file unless there is an explicit reason in the story to do otherwise.
- Implement and validate task by task rather than batching unrelated work together.
- Run relevant tests, checks, or validations for the work being completed.
- Update the story checklist immediately after each completed task so another skill can resume from the same file later, even if execution stops before the file is fully complete.
- If the next unchecked work is the final hardening phase, execute it as written: refactor, format, lint, typecheck, optimisation, and simplification.

## File Format Rules

- The story file should be a task list only.
- Do not require paragraph descriptions in the story file.
- Execute from checklist items, headings, and task structure only.
- Assume the triggered file is the story to execute.

## Output Format

Use this flow unless the user asks for another one:

### Next Work
- Selected story file
- Next task to execute

### Execution
- Task being implemented
- Status
- Validation performed
- Checklist updates applied

### Complete
- This story is done
- Nothing more to do
