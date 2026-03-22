# Scripts Behavior

### Requirement: propose-creates-artifacts
`spec-driven.js propose <name>` MUST create `.spec-driven/changes/<name>/` containing
`proposal.md`, `specs/delta.md`, `design.md`, and `tasks.md` with seed content.
The name MUST match `^[a-z0-9]+(-[a-z0-9]+)*$`. Exits 1 if invalid or already exists.

### Requirement: modify-lists-and-shows
`spec-driven.js modify` with no argument MUST list all active change directories,
excluding `archive/`. With a name argument, MUST print paths to all four artifacts
(`proposal.md`, `specs/delta.md`, `design.md`, `tasks.md`).
Exits 1 if the named change does not exist.

### Requirement: apply-tracks-tasks
`spec-driven.js apply <name>` MUST parse `tasks.md` for `- [ ]` and `- [x]` checkboxes
and output JSON `{ total, complete, remaining, tasks[] }`.
Exits 1 if the change or tasks.md does not exist.

### Requirement: verify-checks-artifacts
`spec-driven.js verify <name>` MUST check that `proposal.md`, `specs/delta.md`,
`design.md`, and `tasks.md` exist and are non-empty.
Output is always `{ valid, warnings[], errors[] }` and exits 0.
`valid` is false only when `errors` is non-empty.

#### Scenario: delta-spec-missing
- GIVEN `specs/delta.md` does not exist
- WHEN verify is run
- THEN errors contains a missing artifact message and valid is false

#### Scenario: delta-spec-empty
- GIVEN `specs/delta.md` has no content beyond the seed template
- WHEN verify is run
- THEN warnings contains an empty delta spec message

#### Scenario: delta-spec-format-violation
- GIVEN `specs/delta.md` has content but no `### Requirement:` headings
- WHEN verify is run
- THEN errors contains a format violation message and valid is false

### Requirement: archive-moves-change
`spec-driven.js archive <name>` MUST move `.spec-driven/changes/<name>/` to
`.spec-driven/changes/archive/YYYY-MM-DD-<name>/`, creating the archive directory
if needed. Exits 1 if the source does not exist or the target already exists.

### Requirement: cancel-removes-change
`spec-driven.js cancel <name>` MUST delete the change directory without archiving.
Exits 1 if the change does not exist.

### Requirement: init-bootstraps-project
`spec-driven.js init [path]` MUST create `.spec-driven/` with `config.yaml` and
`specs/README.md` at the given path (or CWD). Exits 1 if `.spec-driven/` already exists.
