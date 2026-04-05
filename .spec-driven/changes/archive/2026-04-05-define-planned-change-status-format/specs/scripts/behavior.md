# Delta: Scripts Behavior

## MODIFIED Requirements

### Requirement: verify-roadmap-validates-planned-change-entry-format
Previously: For each bullet under `## Planned Changes`, `verify-roadmap` MUST require the
canonical entry format `- \`<change-name>\` - <summary>`.

`<change-name>` MUST match the change naming rule
`^[a-z0-9]+(-[a-z0-9]+)*$`. `<summary>` MUST be present, non-empty, and fully
contained on the same line as the planned change bullet.

If a planned change bullet omits the summary, uses a malformed change name,
does not follow the canonical format, or is followed by attached indented
continuation lines, the command MUST report the milestone as invalid.

Any non-empty line under `## Planned Changes` that is not itself a valid
top-level planned change bullet MUST be reported as invalid.

#### Scenario: described-planned-change-is-valid
- GIVEN a milestone lists a planned change entry in the form
  `- \`define-generated-artifact-schemas\` - define the YAML schema shape for generated planning artifacts`
- WHEN `verify-roadmap` validates the file
- THEN the planned change entry is accepted
- AND `roadmap-status` can still resolve the change by the name
  `define-generated-artifact-schemas`

#### Scenario: multiline-planned-change-detail-is-invalid
- GIVEN a milestone lists a valid planned change first line
- AND one or more indented continuation lines immediately below it
- WHEN `verify-roadmap` validates the file
- THEN the milestone is reported as invalid
- AND the result explains that planned change descriptions must remain single-line

For each bullet under `## Planned Changes`, `verify-roadmap` MUST require the
canonical entry format
`- \`<change-name>\` - Declared: <status> - <summary>`.

`<change-name>` MUST match the change naming rule
`^[a-z0-9]+(-[a-z0-9]+)*$`. `<status>` MUST be either `planned` or `complete`.
`<summary>` MUST be present, non-empty, and fully contained on the same line as
the planned change bullet.

If a planned change bullet omits the declared status, uses an unsupported status
value, omits the summary, uses a malformed change name, does not follow the
canonical format, or is followed by attached indented continuation lines, the
command MUST report the milestone as invalid.

Any non-empty line under `## Planned Changes` that is not itself a valid
top-level planned change bullet MUST be reported as invalid.

#### Scenario: declared-planned-change-is-valid
- GIVEN a milestone lists a planned change entry in the form
  `- \`define-generated-artifact-schemas\` - Declared: planned - define the YAML schema shape for generated planning artifacts`
- WHEN `verify-roadmap` validates the file
- THEN the planned change entry is accepted
- AND `roadmap-status` can still resolve the change by the name
  `define-generated-artifact-schemas`

#### Scenario: unsupported-planned-change-status-is-invalid
- GIVEN a milestone lists a planned change entry with `Declared: done`
- WHEN `verify-roadmap` validates the file
- THEN the milestone is reported as invalid
- AND the result explains that the planned change status is unsupported

### Requirement: roadmap-status-reports-milestone-and-change-state
Previously: `spec-driven.js roadmap-status [path]` MUST inspect roadmap milestone files in
the target repository (or CWD), compare each listed planned change against
`.spec-driven/changes/` and `.spec-driven/changes/archive/`, and output JSON.

When milestone files use planned change bullets in the canonical format
`- \`<change-name>\` - <summary>`, the command MUST resolve roadmap state from
the `<change-name>` portion and MUST ignore the trailing summary when matching
active or archived changes.

`roadmap-status` and archive reconciliation MUST treat multiline planned change
detail as invalid roadmap input rather than as attached metadata belonging to a
valid planned change entry.

`spec-driven.js roadmap-status [path]` MUST inspect roadmap milestone files in
the target repository (or CWD), compare each listed planned change against
`.spec-driven/changes/` and `.spec-driven/changes/archive/`, and output JSON.

When milestone files use planned change bullets in the canonical format
`- \`<change-name>\` - Declared: <status> - <summary>`, the command MUST resolve
roadmap state from the `<change-name>` portion and MUST ignore the declared
status and trailing summary when matching active or archived changes.

`roadmap-status` and archive reconciliation MUST treat multiline planned change
detail as invalid roadmap input rather than as attached metadata belonging to a
valid planned change entry.

### Requirement: roadmap-status-includes-derived-status-and-mismatches
Previously: For each roadmap milestone, `roadmap-status` MUST report the declared roadmap
status, a derived status based on planned change archive state, the listed
planned changes with their resolved state (`archived`, `active`, or `missing`),
and mismatch messages when the declared roadmap status disagrees with the
derived status.

The derived roadmap status MUST use the following rules:
- `complete` when the milestone has one or more planned changes and all are
  archived
- `active` when one or more planned changes are active and the milestone is not
  complete
- `proposed` when the milestone has no planned changes, or when its planned
  changes are not archived and none are active

`roadmap-status` MUST NOT derive `blocked` automatically from change history;
`blocked` remains a declared-only status value used for mismatch reporting and
human workflow communication.

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

#### Scenario: blocked-is-declared-only
- GIVEN a milestone declares `blocked`
- AND its planned changes are all still missing
- WHEN `roadmap-status` is run
- THEN the milestone declared status is `blocked`
- AND the derived status is `proposed`
- AND the result reports a mismatch if the two statuses differ

For each roadmap milestone, `roadmap-status` MUST report the declared roadmap
status, a derived status based on planned change archive state, the listed
planned changes with their declared per-change status, resolved repository state
(`archived`, `active`, or `missing`), derived per-change status, and mismatch
messages when declared values disagree with derived values.

For each planned change, the derived per-change status MUST use the following
rules:
- `complete` when the change is archived
- `planned` when the change is active or missing

The derived roadmap status MUST use the following rules:
- `complete` when the milestone has one or more planned changes and all are
  archived
- `active` when one or more planned changes are active and the milestone is not
  complete
- `proposed` when the milestone has no planned changes, or when its planned
  changes are not archived and none are active

`roadmap-status` MUST NOT derive `blocked` automatically from change history;
`blocked` remains a declared-only status value used for mismatch reporting and
human workflow communication.

#### Scenario: archived-planned-change-derives-complete
- GIVEN a milestone lists a planned change with `Declared: planned`
- AND that change is archived
- WHEN `roadmap-status` is run
- THEN the planned change result reports resolved state `archived`
- AND the derived per-change status is `complete`

#### Scenario: stale-complete-planned-change-is-reported
- GIVEN a milestone lists a planned change with `Declared: complete`
- AND that change is still active
- WHEN `roadmap-status` is run
- THEN the planned change result reports derived per-change status `planned`
- AND the result includes a mismatch for that planned change

### Requirement: archive-moves-change
Previously: `spec-driven.js archive <name>` MUST move `.spec-driven/changes/<name>/` to
`.spec-driven/changes/archive/YYYY-MM-DD-<name>/`, creating the archive directory
if needed. Exits 1 if the source does not exist or the target already exists.

If `.spec-driven/roadmap/` exists, after the move succeeds the command MUST
reconcile any milestone file that lists the archived change so its declared
status matches the status derived from the current planned change archive state.
It MUST also regenerate `.spec-driven/roadmap/INDEX.md` so milestone entries
reflect the reconciled declared status.

#### Scenario: archive-reconciles-roadmap-when-present
- GIVEN a roadmap milestone lists a change that is about to be archived
- AND archiving that change changes the milestone's derived status
- WHEN `spec-driven.js archive <name>` succeeds
- THEN the milestone file is rewritten with the reconciled `- Declared: <status>` value
- AND `.spec-driven/roadmap/INDEX.md` reflects the reconciled status

`spec-driven.js archive <name>` MUST move `.spec-driven/changes/<name>/` to
`.spec-driven/changes/archive/YYYY-MM-DD-<name>/`, creating the archive directory
if needed. Exits 1 if the source does not exist or the target already exists.

If `.spec-driven/roadmap/` exists, after the move succeeds the command MUST
reconcile any milestone file that lists the archived change so that planned
change entry uses `Declared: complete`, and so the milestone declared status
matches the status derived from the current planned change archive state. It
MUST also regenerate `.spec-driven/roadmap/INDEX.md` so milestone entries
reflect the reconciled declared status.

#### Scenario: archive-reconciles-planned-change-and-milestone-status-when-present
- GIVEN a roadmap milestone lists a change with `Declared: planned`
- WHEN `spec-driven.js archive <name>` succeeds for that change
- THEN the matching planned change entry is rewritten to `Declared: complete`
- AND the milestone file is rewritten with the reconciled `- Declared: <status>` value
- AND `.spec-driven/roadmap/INDEX.md` reflects the reconciled milestone status
