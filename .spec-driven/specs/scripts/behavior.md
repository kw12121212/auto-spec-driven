# Scripts Behavior

### Requirement: propose-creates-artifacts
`spec-driven.js propose <name>` MUST create `.spec-driven/changes/<name>/` containing
`proposal.md`, `specs/` directory, `design.md`, and `tasks.md` with seed content.
The name MUST match `^[a-z0-9]+(-[a-z0-9]+)*$`. Exits 1 if invalid or already exists.

### Requirement: modify-lists-and-shows
`spec-driven.js modify` with no argument MUST list all active change directories,
excluding `archive/`. With a name argument, MUST print paths to all four artifacts
(`proposal.md`, `specs/`, `design.md`, `tasks.md`).
Exits 1 if the named change does not exist.

### Requirement: apply-tracks-tasks
`spec-driven.js apply <name>` MUST parse `tasks.md` for `- [ ]` and `- [x]` checkboxes
and output JSON `{ total, complete, remaining, tasks[] }`.
Exits 1 if the change or tasks.md does not exist.

### Requirement: verify-checks-artifacts
`spec-driven.js verify <name>` MUST check that `proposal.md`, `design.md`, and `tasks.md`
exist and are non-empty, and that `specs/` directory exists.
Output is always `{ valid, warnings[], errors[] }` and exits 0.
`valid` is false only when `errors` is non-empty.

#### Scenario: specs-directory-missing
- GIVEN `specs/` directory does not exist
- WHEN verify is run
- THEN errors contains a missing directory message and valid is false

#### Scenario: specs-directory-empty
- GIVEN `specs/` directory exists but contains no `.md` files
- WHEN verify is run
- THEN warnings contains an empty specs message

#### Scenario: spec-file-format-violation
- GIVEN a `.md` file in `specs/` has content but no `### Requirement:` headings
- WHEN verify is run
- THEN errors contains a format violation message and valid is false

#### Scenario: spec-file-missing-section-marker
- GIVEN a `.md` file in `specs/` has `### Requirement:` headings but no `## ADDED Requirements`, `## MODIFIED Requirements`, or `## REMOVED Requirements` section marker
- WHEN verify is run
- THEN errors contains a missing section marker message and valid is false

#### Scenario: unresolved-clarification-markers
- GIVEN an artifact or spec file contains `[NEEDS CLARIFICATION]` markers
- WHEN verify is run
- THEN warnings contains an unresolved markers message

### Requirement: archive-moves-change
`spec-driven.js archive <name>` MUST move `.spec-driven/changes/<name>/` to
`.spec-driven/changes/archive/YYYY-MM-DD-<name>/`, creating the archive directory
if needed. Exits 1 if the source does not exist or the target already exists.

### Requirement: cancel-removes-change
`spec-driven.js cancel <name>` MUST delete the change directory without archiving.
Exits 1 if the change does not exist.

### Requirement: init-bootstraps-project
`spec-driven.js init [path]` MUST create `.spec-driven/` with `config.yaml`,
`specs/INDEX.md`, `specs/README.md`, and `changes/` directory at the given path (or CWD).
Exits 1 if `.spec-driven/` already exists.

### Requirement: migrate-openspec-project
`spec-driven.js migrate [path]` MUST migrate an OpenSpec-style project in the given path (or CWD)
to slim-spec-driven conventions.
It MUST rename `openspec/` to `.spec-driven/` when `.spec-driven/` does not already exist,
ensure `.spec-driven/config.yaml`, `.spec-driven/specs/INDEX.md`, `.spec-driven/specs/README.md`,
and `.spec-driven/changes/` exist, remove OpenSpec skills and command files for supported tools,
and install bundled `spec-driven-*` skills for supported tools.

#### Scenario: unsupported-tool-is-skipped
- GIVEN a project contains OpenSpec artifacts for an unsupported AI tool
- WHEN migrate is run
- THEN migrate reports that tool as skipped and continues

#### Scenario: spec-driven-directory-already-exists
- GIVEN `.spec-driven/` already exists alongside `openspec/`
- WHEN migrate is run
- THEN migrate does not rename `openspec/` over the existing directory and reports the rename as skipped
