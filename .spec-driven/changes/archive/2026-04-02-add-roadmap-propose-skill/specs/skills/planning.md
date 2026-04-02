# Delta: Skills Planning

## ADDED Requirements

### Requirement: roadmap-propose-reads-roadmap-and-spec-context-before-writing
`roadmap-propose` MUST read `.spec-driven/config.yaml`,
`.spec-driven/roadmap/INDEX.md`, the relevant milestone file, and
`.spec-driven/specs/INDEX.md` before it scaffolds a change.

### Requirement: roadmap-propose-creates-standard-change-artifacts
`roadmap-propose` MUST create the same five artifacts as
`spec-driven-propose`: `proposal.md`, `specs/`, `design.md`, `tasks.md`, and
`questions.md`. It MUST NOT implement product code while doing so.
