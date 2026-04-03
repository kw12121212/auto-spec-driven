# Delta: Skills Roadmap

## MODIFIED Requirements

### Requirement: planned-changes-are-the-only-milestone-work-list
Previously: Each roadmap milestone file MUST use `## Planned Changes` as its only work list.
Items under that section MUST represent concrete approved change candidates
expected to enter or already exist under `.spec-driven/changes/`. Milestone
files MUST NOT use that section as a speculative backlog of unapproved ideas.

Each roadmap milestone file MUST use `## Planned Changes` as its only work list.
Items under that section MUST represent concrete approved change candidates
expected to enter or already exist under `.spec-driven/changes/`. Milestone
files MUST NOT use that section as a speculative backlog of unapproved ideas.

Each planned change entry MUST use the canonical bullet format
`- \`<change-name>\` - <summary>`.
`<change-name>` MUST be the kebab-case change identifier. `<summary>` MUST be a
short human-readable explanation of why that change belongs in the milestone.

After that canonical first line, a planned change entry MAY include additional
indented detail lines to capture richer milestone-local context. Those detail
lines belong to the preceding planned change entry and MUST NOT introduce a new
planned change unless they start a new top-level bullet.

### Requirement: milestone-files-capture-stage-goals-and-risks
Previously: Each roadmap milestone file MUST record the milestone goal, done criteria,
planned changes, dependencies/risks, and current status. These fields define
the stage boundary for the milestone and must not be implied only by chat
context.

Each roadmap milestone file MUST record the milestone goal, in-scope boundary,
out-of-scope boundary, done criteria, planned changes, dependencies, risks,
current status, and notes. These fields define the stage boundary for the
milestone and must not be implied only by chat context.

### Requirement: milestone-files-use-standard-sections-for-validation
Previously: Roadmap milestone files MUST use the following section headings so roadmap
validation can inspect them predictably:
- `## Goal`
- `## Done Criteria`
- `## Planned Changes`
- `## Dependencies / Risks`
- `## Status`

Roadmap milestone files MUST use the following section headings so roadmap
validation can inspect them predictably:
- `## Goal`
- `## In Scope`
- `## Out of Scope`
- `## Done Criteria`
- `## Planned Changes`
- `## Dependencies`
- `## Risks`
- `## Status`
- `## Notes`

The `## Status` section MUST contain exactly one bullet in the form
`- Declared: <status>`.

`<status>` MUST be one of:
- `proposed`
- `active`
- `blocked`
- `complete`

Roadmap milestone files MUST NOT use freeform prose or additional bullet fields
inside `## Status`. Explanatory context that does not change machine-visible
status belongs in `## Notes`.

#### Scenario: milestone-status-explanation-lives-in-notes
- GIVEN a milestone author needs to explain why a milestone is blocked or still
  proposed
- WHEN they add human-readable context to the milestone file
- THEN that explanation appears under `## Notes`
- AND the `## Status` section remains limited to the declared status bullet
