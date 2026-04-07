# Design: add-spec-driven-simple-task-skill

## Approach

Create a standalone skill that operates outside the change lifecycle. The skill is invoked with a task description, assesses whether the task fits its lightweight scope, executes it with spec context, then evaluates spec impact after completion.

### Entry Gate

Before executing, the skill evaluates the task description against three criteria:

1. **Scope check**: If the task clearly spans multiple modules, involves schema changes, or affects cross-cutting concerns → reject, recommend `/spec-driven-propose` or `/spec-driven-brainstorm`
2. **Hotfix check**: If the task is framed as urgent/hotfix/critical production fix → reject, recommend the formal change workflow
3. **Simplicity check**: If the task is ambiguous in scope or could grow → reject, recommend `/spec-driven-brainstorm` to clarify first

Only tasks that are clearly bounded, non-urgent, and lightweight proceed.

### Two-Phase Model

**Phase 1 — Execute**: Load `.spec-driven/config.yaml`, `INDEX.md`, and relevant specs as background context. Perform the task directly (edit files, run commands, etc.).

**Phase 2 — Assess**: After task completion, evaluate whether the work affected any specs:
- No spec impact → log only
- Spec drift detected → suggest `/spec-driven-sync-specs` or `/spec-driven-spec-edit`
- New change need discovered → suggest `/spec-driven-propose` or `/spec-driven-brainstorm`

### Logging

Each completed task creates a markdown log at `.spec-driven/simple-tasks/YYYY-MM-DD-<name>.md` with:
- Task description
- What was done
- Spec impact assessment result
- Follow-up suggestions (if any)

The `simple-tasks/` directory is a flat log — no subdirectories, no lifecycle management.

## Key Decisions

1. **No CLI subcommand needed**: The skill only reads existing files and creates simple markdown logs. No new `spec-driven.js` subcommand is required.
2. **No changes/ interaction**: Simple tasks never create or modify `.spec-driven/changes/`. They exist entirely outside the change lifecycle.
3. **Spec context is read-only**: The skill loads specs as background knowledge but does not modify them. Spec updates happen through existing skills (`spec-edit`, `sync-specs`).
4. **Log-only persistence**: No verification, review, or archive step. The log file is the only artifact.

## Alternatives Considered

- **Simplified change type** (lighter change with fewer artifacts): Rejected because it still forces the changes/ structure and would blur the line between real changes and ad-hoc work.
- **No logging**: Rejected because the user explicitly requested task records with date-prefixed names under `.spec-driven/simple-tasks/`.
- **Automatic spec sync after every task**: Rejected as too aggressive. The skill should assess and suggest, not automatically run other skills.
