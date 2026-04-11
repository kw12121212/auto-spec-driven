---
mapping:
  implementation:
    - skills/spec-driven-simple-task/SKILL.md
  tests:
    - test/validate-skills.ts
---

# Skills Simple Task

### Requirement: simple-task-assesses-scope-before-executing
`spec-driven-simple-task` MUST evaluate the user's task description before executing. It MUST reject tasks that:
- span multiple modules, involve schema changes, or affect cross-cutting concerns
- are framed as urgent, hotfix, or critical production fixes
- are ambiguous in scope or likely to grow beyond a single bounded piece of work

When rejecting a task, it MUST recommend an appropriate alternative skill:
- `/spec-driven-propose` or `/spec-driven-brainstorm` for work that is a real change
- the formal change workflow for hotfixes or urgent work

#### Scenario: oversized-task-is-rejected
- GIVEN a user invokes `spec-driven-simple-task` with a description that spans multiple modules
- WHEN the skill evaluates the scope
- THEN it rejects the task and recommends `/spec-driven-propose` or `/spec-driven-brainstorm`

#### Scenario: hotfix-is-rejected
- GIVEN a user invokes `spec-driven-simple-task` with a description framed as a hotfix
- WHEN the skill evaluates the scope
- THEN it rejects the task and recommends the formal change workflow

### Requirement: simple-task-loads-spec-context-before-work
Before executing, `spec-driven-simple-task` MUST read `.spec-driven/config.yaml`,
`.spec-driven/specs/INDEX.md`, and every relevant main spec file needed to understand
the current requirements as background context for the task.

### Requirement: simple-task-executes-work-directly
`spec-driven-simple-task` MUST perform the requested work directly — editing files,
running commands, or other actions — without creating any `.spec-driven/changes/`
directory or change artifacts.

### Requirement: simple-task-assesses-spec-impact-after-work
After completing the task, `spec-driven-simple-task` MUST evaluate whether the work
affected any specs:
- If no spec impact is detected, it logs the task as completed with no spec change
- If spec drift is detected, it suggests `/spec-driven-sync-specs` or `/spec-driven-spec-edit`
- If the work reveals a real change need, it suggests `/spec-driven-propose` or `/spec-driven-brainstorm`

It MUST NOT automatically invoke other skills. Suggestions are advisory only.

### Requirement: simple-task-logs-to-simple-tasks-directory
Each completed task MUST create a markdown log at
`.spec-driven/simple-tasks/YYYY-MM-DD-<name>.md`, where `<name>` is a short
kebab-case identifier derived from the task description and the date is the
current date. The log MUST contain:
- the task description
- what was done
- the spec impact assessment result
- follow-up suggestions, if any

The `simple-tasks/` directory MUST be a flat log with no subdirectories and no
lifecycle management.

### Requirement: simple-task-does-not-interact-with-changes
`spec-driven-simple-task` MUST NOT create, modify, or archive any entries under
`.spec-driven/changes/`. It exists entirely outside the change lifecycle.
