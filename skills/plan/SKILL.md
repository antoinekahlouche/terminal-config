---
name: plan
description: Create implementation plans for product or engineering work. Use this skill when the user asks for a plan, PRD, story, task breakdown, sequencing, or impact analysis across the codebase.
---

This skill guides creation of execution-ready plans for product and engineering work. It is for requests that need clarification, a PRD-level story file, an ordered task list, and an explicit view of which files or areas of the codebase will likely need updates.

## Philosophy

- **KISS**: "Keep It Simple, Stupid" always prefer the simplest solution that works. Never overengineer. If more is needed, we'll iterate.
- **DRY**: "Don't Repeat Yourself" - avoid duplication by abstracting shared logic.
- **Unix philosophy**: when designing an app:
  - Write programs that `do one thing and do it well`.
  - Write programs to `work together`.
  - Write programs to `handle text streams`, because that is a universal interface.

## Process

When the user asks for planning work:

1. Clarify the request before planning.
Ask targeted questions when requirements, constraints, or success criteria are ambiguous. Keep questions short and only ask what materially changes the plan.

2. Inspect the codebase before proposing work.
Read the relevant files, search for affected features, and identify the current architecture, touchpoints, and constraints. Do not invent file paths or components when the repository can answer that directly.

3. Produce a story file.
Save the plan in `.stories/` at the root of the current project. The filename should be derived from the subject in a filesystem-safe format.

4. Write the file as a task list only.
Do not write explanatory paragraphs inside the story file. Use headings and Markdown todo items only.

5. Add concrete tasks in execution order.
Tasks should be specific enough for execution: code changes, data/model changes, UI work, tests, migration steps, docs, rollout work, and validation. Test work must always be planned explicitly. Write every task as a Markdown todo item using `- [ ]`.

6. Add a final hardening section.
Always include a last section dedicated to:
- Refactor
- Format
- Lint
- Typecheck
- Optimisation
- Simplification

These tasks should happen after the functional work unless there is a clear reason to pull part of them earlier.

7. Include repository impact analysis.
Call out the files, directories, systems, or modules that likely need to be created or updated. Distinguish between confirmed impacts from code inspection and inferred impacts based on the current structure. Keep this as a checklist-oriented section, not prose paragraphs.

## Output Format

Use this structure unless the user asks for another one:

### Questions
- Only if clarification is still needed

### Story File
- Title
- Optional short metadata bullets if needed

Persist this document under `.stories/<subject-derived-name>.md` in the current project root.

### Task List
- Use headings for sections when useful
- Write executable tasks as `- [ ]`
- Order tasks by dependency
- Include explicit testing tasks near the related implementation work

Include a final hardening section that covers refactor, format, lint, typecheck, optimisation, and simplification.

### File Impact
- `- [ ]` Confirmed files or modules from repository inspection
- `- [ ]` Likely additional files to update
- `- [ ]` New files to create, if any

## Planning Rules

- Order by dependency, not by presentation.
- Prefer tasks that can be verified independently.
- Include testing and validation work in the relevant part of the task list, not as an afterthought.
- Always plan the test strategy and test implementation work.
- Always include a final hardening section for refactor, format, lint, typecheck, optimisation, and simplification.
- Always format executable work as Markdown todo items using `- [ ]` so downstream skills can track execution state.
- The whole file is a single story.
- Do not break the plan into multiple stories inside one file.
- Do not rely on paragraph descriptions inside the story file.
- If migration, rollout, or config changes are required, make them explicit.
- If the request is underspecified, separate confirmed facts from assumptions.
- If the repository is available, always inspect it before naming files to update.
- If the repository is not available, say that file impact is provisional.
- Always save the story document in `.stories/` at the project root using a filename derived from the subject.
