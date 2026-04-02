# Delta: Scripts Behavior

## ADDED Requirements

### Requirement: roadmap-status-reports-milestone-and-change-state
`spec-driven.js roadmap-status [path]` MUST inspect roadmap milestone files in
the target repository (or CWD), compare each listed planned change against
`.spec-driven/changes/` and `.spec-driven/changes/archive/`, and output JSON.

### Requirement: roadmap-status-includes-derived-status-and-mismatches
For each roadmap milestone, `roadmap-status` MUST report the declared roadmap
status, a derived status based on planned change archive state, the listed
planned changes with their resolved state (`archived`, `active`, or `missing`),
and mismatch messages when the declared roadmap status disagrees with the
derived status.

#### Scenario: active-and-missing-planned-changes
- GIVEN a milestone lists one archived planned change, one active planned
  change, and one missing planned change
- WHEN `roadmap-status` is run
- THEN the JSON reports those three planned change states
- AND the milestone derived status is not complete

#### Scenario: no-planned-changes-keeps-milestone-proposed
- GIVEN a milestone has no items under `## Planned Changes`
- WHEN `roadmap-status` is run
- THEN the milestone derived status is `proposed`

#### Scenario: declared-status-mismatch
- GIVEN the roadmap file declares a milestone status that does not match the
  status derived from change history
- WHEN `roadmap-status` is run
- THEN the milestone result includes a mismatch message describing the status disagreement
