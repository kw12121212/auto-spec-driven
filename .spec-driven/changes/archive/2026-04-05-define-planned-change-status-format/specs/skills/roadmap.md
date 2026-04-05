# Delta: Skills Roadmap

## ADDED Requirements

### Requirement: planned-change-declared-status-derives-from-archive-state
The roadmap MUST treat each planned change's declared status as structured
planning metadata while keeping repository evidence authoritative for whether the
change is actually complete.

A planned change's derived status MUST be `complete` only when the referenced
change is archived under `.spec-driven/changes/archive/`. In all other cases,
its derived status MUST be `planned`.

If a milestone file declares a planned change as `complete` while that change is
still active or missing, the declared status is stale and MUST be reported as a
mismatch.

#### Scenario: archived-change-derives-complete
- GIVEN a milestone lists a planned change with `Declared: planned`
- AND that change is archived under `.spec-driven/changes/archive/`
- WHEN roadmap state is evaluated
- THEN the planned change derives as `complete`

#### Scenario: stale-complete-planned-change-is-mismatched
- GIVEN a milestone lists a planned change with `Declared: complete`
- AND that change is not archived
- WHEN roadmap state is evaluated
- THEN the planned change derives as `planned`
- AND the result reports a declared-versus-derived mismatch

## MODIFIED Requirements

### Requirement: planned-changes-are-the-only-milestone-work-list
Previously: Each roadmap milestone file MUST use `## Planned Changes` as its only work list.
Items under that section MUST represent concrete approved change candidates
expected to enter or already exist under `.spec-driven/changes/`. Milestone
files MUST NOT use that section as a speculative backlog of unapproved ideas.

Each planned change entry MUST use the canonical bullet format
`- \`<change-name>\` - <summary>`.
`<change-name>` MUST be the kebab-case change identifier. `<summary>` MUST be a
single-line human-readable explanation of why that change belongs in the
milestone. Planned change entries MUST NOT include attached continuation lines
or other multiline detail below the canonical bullet.

Each roadmap milestone file MUST use `## Planned Changes` as its only work list.
Items under that section MUST represent concrete approved change candidates
expected to enter or already exist under `.spec-driven/changes/`. Milestone
files MUST NOT use that section as a speculative backlog of unapproved ideas.

Each planned change entry MUST use the canonical bullet format
`- \`<change-name>\` - Declared: <status> - <summary>`.
`<change-name>` MUST be the kebab-case change identifier. `<status>` MUST be one
of `planned` or `complete`. `<summary>` MUST be a single-line human-readable
explanation of why that change belongs in the milestone. Planned change entries
MUST NOT include attached continuation lines or other multiline detail below the
canonical bullet.

### Requirement: roadmap-propose-promotes-planned-changes-into-normal-changes
Previously: `roadmap-propose` MUST turn a milestone `Planned Changes` item into a normal
change scaffold under `.spec-driven/changes/<name>/`. It MUST require the target
work item to already appear under a milestone `## Planned Changes` section
before scaffolding.

`roadmap-propose` MUST treat each planned change entry as a single-line roadmap
input. It MUST NOT depend on attached continuation lines below the planned
change bullet when drafting change proposal artifacts.

`roadmap-propose` MUST turn a milestone `Planned Changes` item into a normal
change scaffold under `.spec-driven/changes/<name>/`. It MUST require the target
work item to already appear under a milestone `## Planned Changes` section
before scaffolding.

`roadmap-propose` MUST treat each planned change entry as a single-line roadmap
input in the canonical format
`- \`<change-name>\` - Declared: <status> - <summary>`.
It MUST resolve the target work item from the ``<change-name>`` portion only,
and MUST NOT depend on the declared status or trailing summary text when
drafting change proposal artifacts.

### Requirement: roadmap-recommend-recommends-the-next-change-from-roadmap-context
Previously: `roadmap-recommend` MUST analyze roadmap milestone context and recommend a next
change candidate for the user to consider. The recommendation MUST identify the
proposed change name, the milestone it comes from, and why it is a good next
step. The recommended candidate MUST already exist under a milestone
`## Planned Changes` section.

`roadmap-recommend` MUST treat each planned change entry as a single-line roadmap
input. It MUST NOT depend on attached continuation lines below the planned
change bullet when explaining or summarizing the recommended change.

`roadmap-recommend` MUST analyze roadmap milestone context and recommend a next
change candidate for the user to consider. The recommendation MUST identify the
proposed change name, the milestone it comes from, and why it is a good next
step. The recommended candidate MUST already exist under a milestone
`## Planned Changes` section.

`roadmap-recommend` MUST treat each planned change entry as a single-line roadmap
input in the canonical format
`- \`<change-name>\` - Declared: <status> - <summary>`.
It MUST resolve the recommended work item from the ``<change-name>`` portion
only, and MUST NOT depend on the declared status or trailing summary text when
summarizing the recommended change.

### Requirement: roadmap-sync-reconciles-roadmap-state-with-change-history
Previously: `roadmap-sync` MUST use script assistance to reconcile roadmap state before it
edits roadmap files. It MUST read roadmap milestone files together with
`.spec-driven/changes/` and `.spec-driven/changes/archive/`, and it MUST run
`node {{SKILL_DIR}}/scripts/spec-driven.js roadmap-status` to obtain structured
milestone and planned change state before it decides what roadmap updates to
make. It MUST update roadmap status based on repository evidence rather than
preserving stale manual labels.

`roadmap-sync` MUST use script assistance to reconcile roadmap state before it
edits roadmap files. It MUST read roadmap milestone files together with
`.spec-driven/changes/` and `.spec-driven/changes/archive/`, and it MUST run
`node {{SKILL_DIR}}/scripts/spec-driven.js roadmap-status` to obtain structured
milestone and planned change state before it decides what roadmap updates to
make. It MUST update milestone declared status and planned change declared
status based on repository evidence rather than preserving stale manual labels.
