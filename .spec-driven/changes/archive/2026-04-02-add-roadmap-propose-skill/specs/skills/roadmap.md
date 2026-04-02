# Delta: Skills Roadmap

## ADDED Requirements

### Requirement: roadmap-propose-promotes-planned-changes-into-normal-changes
`roadmap-propose` MUST turn a milestone `Planned Changes` item into a normal
change scaffold under `.spec-driven/changes/<name>/`. It MUST require the target
work item to already appear under a milestone `## Planned Changes` section
rather than promoting a `Candidate Idea` implicitly.

#### Scenario: planned-change-becomes-change-scaffold
- GIVEN a roadmap milestone lists `add-auth-audit-log` under `## Planned Changes`
- WHEN `roadmap-propose add-auth-audit-log` is used
- THEN `.spec-driven/changes/add-auth-audit-log/` is scaffolded as a normal change

### Requirement: roadmap-workflow-can-handoff-from-milestone-to-change
The roadmap workflow MUST support an explicit handoff from milestone planning to
change execution through `roadmap-propose`, before the user enters
`spec-driven-apply`, `spec-driven-auto`, or other execution-stage skills.
