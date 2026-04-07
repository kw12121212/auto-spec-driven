# add-spec-driven-simple-task-skill

## What

Add a new skill `spec-driven-simple-task` that handles lightweight ad-hoc tasks (debugging, documentation, small adjustments) without the full change proposal lifecycle. The skill uses a two-phase model: execute the task first, then assess spec impact afterward.

## Why

The current workflow assumes all work is a formal "change" requiring proposal, design, tasks, verify, review, and archive. In practice, developers frequently need to perform small tasks — debugging an issue, updating a comment, adjusting a config — that don't warrant the full ceremony. These tasks may or may not affect specs, but they are not changes in the spec-driven sense. Without a lightweight path, users either skip the workflow entirely or go through unnecessary overhead.

## Scope

- Create a new skill `spec-driven-simple-task` with its own `SKILL.md`
- Define entry gate that rejects oversized tasks and hotfixes, redirecting to appropriate skills
- Implement two-phase flow: task execution with spec context, followed by spec impact assessment
- Add logging to `.spec-driven/simple-tasks/YYYY-MM-DD-<name>.md` for each completed task
- Define spec requirements for the new skill's behavior in a new spec file `skills/simple-task.md`
- Update `scripts/behavior.md` if any CLI support is needed for the simple-tasks directory

## Unchanged Behavior

- All existing 15 skills and their behavior remain unchanged
- The change workflow (propose → apply → verify → review → archive) is not affected
- `.spec-driven/changes/` structure and conventions are unchanged
- `.spec-driven/specs/` main spec editing continues through existing skills
