# Skills Workflow

### Requirement: propose-scaffolds-change
`spec-driven-propose` MUST scaffold a new change with all four artifacts
(`proposal.md`, `specs/` directory, `design.md`, `tasks.md`) populated from project context.
It MUST NOT modify any codebase files — planning only.

### Requirement: propose-fills-delta-specs
`spec-driven-propose` MUST populate delta spec files under `changes/<name>/specs/`,
mirroring the structure of `.spec-driven/specs/`. Each file MUST use the standard format:
`## ADDED/MODIFIED/REMOVED Requirements` section headers, `### Requirement: <name>` headings,
RFC 2119 keywords (MUST/SHOULD/MAY), and `#### Scenario:` blocks (GIVEN/WHEN/THEN) where applicable.

### Requirement: modify-preserves-completed-tasks
`spec-driven-modify` MUST NOT uncheck completed tasks (`- [x]`) unless the user
explicitly requests it.

### Requirement: apply-implements-in-order
`spec-driven-apply` MUST implement tasks in order, marking each `- [x]` immediately
upon completion. It MUST load all four artifacts and main specs before writing code,
and MUST update delta files in `changes/<name>/specs/` to reflect what was actually implemented.

### Requirement: verify-tiered-report
`spec-driven-verify` MUST output a tiered report: CRITICAL / WARNING / SUGGESTION.
CRITICAL issues block archiving. Checks include artifact format (via verify.js),
implementation evidence, delta spec accuracy, and spec alignment.

### Requirement: archive-merges-delta-specs
`spec-driven-archive` MUST merge all delta files in `changes/<name>/specs/` into the
corresponding files in `.spec-driven/specs/` before moving the change to archive.
Each delta file mirrors its main spec file by path:
- ADDED requirements are appended to the target spec file (creating it if needed)
- MODIFIED requirements are located by `### Requirement: <name>` and replaced in place
- REMOVED requirements are located by name and deleted

#### Scenario: empty-delta-on-archive
- GIVEN `changes/<name>/specs/` directory is empty
- WHEN archive is run
- THEN the user is asked to confirm no spec impact before proceeding

### Requirement: init-bootstraps-project
`spec-driven-init` MUST create `.spec-driven/` with `config.yaml`, `specs/INDEX.md`,
and `specs/README.md`. It MUST exit if `.spec-driven/` already exists.

### Requirement: cancel-removes-change
`spec-driven-cancel` MUST delete the change directory without archiving, after
confirming with the user.
