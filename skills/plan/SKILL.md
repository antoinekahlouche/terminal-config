---
name: plan
description: Create implementation plans for product or engineering work. Use this skill when the user asks for a plan, PRD, epic, stories, task breakdown, sequencing, or impact analysis across the codebase.
---

This skill guides creation of execution-ready plans for product and engineering work. It is for requests that need clarification, a PRD-level epic, ordered implementation stories, task lists per story, and an explicit view of which files or areas of the codebase will likely need updates.

## Process

When the user asks for planning work:

1. Clarify the request before planning.
Ask targeted questions when requirements, constraints, or success criteria are ambiguous. Keep questions short and only ask what materially changes the plan.

2. Inspect the codebase before proposing work.
Read the relevant files, search for affected features, and identify the current architecture, touch points, and constraints. Do not invent file paths or components when the repository can answer that directly.

3. Produce a PRD as the epic.
Summarize:
- Problem statement
- Goal and non-goals
- Users or stakeholders
- Scope
- Constraints and dependencies
- Acceptance criteria
- Risks or open questions

Save the epic in `.todo/` at the root of the current project. The filename should be derived from the subject in a filesystem-safe format.

4. Break the epic into ordered stories.
Each story should be independently understandable and sequenced by implementation dependency: what must be done first goes first. Prefer vertical slices when possible, but put foundational work ahead of dependent work. Write every story as a Markdown todo item using `- [ ]`.

5. Add concrete tasks inside each story.
Tasks should be specific enough for execution: code changes, data/model changes, UI work, tests, migration steps, docs, rollout work, and validation. Test work must always be planned explicitly. Write every task as a Markdown todo item using `- [ ]`.

6. Add a final hardening phase.
Always include a last phase or story dedicated to:
- Refactor
- Format
- Lint
- Typecheck
- Optimisation
- Simplification

These tasks should happen after the functional work unless there is a clear reason to pull part of them earlier.

7. Include repository impact analysis.
Call out the files, directories, systems, or modules that likely need to be created or updated. Distinguish between confirmed impacts from code inspection and inferred impacts based on the current structure.

## Output Format

Use this structure unless the user asks for another one:

### Questions
- Only if clarification is still needed

### PRD / Epic
- Title
- Problem
- Goal
- Non-goals
- Scope
- Stakeholders or users
- Constraints / dependencies
- Acceptance criteria
- Risks / open questions

Persist this document under `.todo/<subject-derived-name>.md` in the current project root.

### Ordered Stories
For each story include:
- `- [ ]` Story title
- Why it comes in this order
- Tasks written as `- [ ]`
- Dependencies
- Expected files to update

Include explicit testing tasks in the relevant story or stories, plus a final hardening phase that covers refactor, format, lint, typecheck, optimisation, and simplification.

### File Impact
- Confirmed files or modules from repository inspection
- Likely additional files to update
- New files to create, if any

## Planning Rules

- Order by dependency, not by presentation.
- Prefer tasks that can be verified independently.
- Include testing and validation work in the relevant story, not as an afterthought.
- Always plan the test strategy and test implementation work.
- Always include a final hardening phase for refactor, format, lint, typecheck, optimisation, and simplification.
- Always format stories and tasks as Markdown todo items using `- [ ]` so downstream skills can track execution state.
- If migration, rollout, or config changes are required, make them explicit.
- If the request is underspecified, separate confirmed facts from assumptions.
- If the repository is available, always inspect it before naming files to update.
- If the repository is not available, say that file impact is provisional.
- Always save the epic document in `.todo/` at the project root using a filename derived from the subject.
