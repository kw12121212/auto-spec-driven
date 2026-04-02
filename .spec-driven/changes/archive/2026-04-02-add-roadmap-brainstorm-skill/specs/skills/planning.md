# Delta: Skills Planning

## ADDED Requirements

### Requirement: roadmap-brainstorm-reads-roadmap-context-before-recommending
`roadmap-brainstorm` MUST read `.spec-driven/config.yaml`,
`.spec-driven/roadmap/INDEX.md`, the relevant milestone files, and
`.spec-driven/specs/INDEX.md` before it recommends a change.

### Requirement: roadmap-brainstorm-confirms-before-handoff
`roadmap-brainstorm` MUST recommend a candidate change name and explain the
reasoning, but it MUST NOT scaffold proposal artifacts. It MUST wait for the
user to accept or modify the recommendation before handing off to
`roadmap-propose`.
