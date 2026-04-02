# Delta: Skills Workflow

## MODIFIED Requirements

### Requirement: planning-skills-do-not-implement-code
`spec-driven-init`, `spec-driven-propose`, `spec-driven-modify`,
`spec-driven-spec-content`, `spec-driven-sync-specs`,
`spec-driven-roadmap-plan`, `spec-driven-roadmap-milestone`, and
`spec-driven-roadmap-sync` MUST stay in the planning/documentation layer. They
MAY create or edit workflow artifacts under `.spec-driven/`, but they MUST NOT
implement product code changes.

Previously: `spec-driven-init`, `spec-driven-propose`, `spec-driven-modify`,
`spec-driven-spec-content`, and `spec-driven-sync-specs` were the only explicit
planning/documentation skills called out here.
