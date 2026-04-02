# Delta: Skills Planning

## ADDED Requirements

### Requirement: roadmap-skills-read-roadmap-context-before-editing
`spec-driven-roadmap-plan`, `spec-driven-roadmap-milestone`, and
`spec-driven-roadmap-sync` MUST read `.spec-driven/config.yaml`, existing
`.spec-driven/roadmap/INDEX.md` and relevant milestone files when present, and
the active or archived changes needed to understand current execution state
before they decide what roadmap updates to make.

### Requirement: roadmap-plan-confirms-milestone-structure-before-writing
Before `spec-driven-roadmap-plan` creates or substantially restructures roadmap
artifacts, it MUST converge with the user on milestone boundaries, stage goals,
and completion criteria, then confirm the intended roadmap shape before writing
files.

## MODIFIED Requirements

### Requirement: init-bootstraps-or-repairs-workflow-scaffold
`spec-driven-init` MUST create `.spec-driven/` with `config.yaml`,
`.spec-driven/roadmap/INDEX.md`, `.spec-driven/roadmap/milestones/`,
`specs/INDEX.md`, and `specs/README.md` when the workflow is absent.
If `.spec-driven/` already exists, it MUST create any missing scaffold files and
directories, including the roadmap scaffold, and regenerate `specs/INDEX.md`
without overwriting existing files.

Previously: The init scaffold requirement only called out `config.yaml`,
`specs/INDEX.md`, and `specs/README.md`.
