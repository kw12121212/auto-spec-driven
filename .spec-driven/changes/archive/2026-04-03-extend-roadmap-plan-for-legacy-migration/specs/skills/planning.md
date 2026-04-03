# Delta: Skills Planning

## MODIFIED Requirements

### Requirement: roadmap-plan-confirms-milestone-structure-before-writing
Previously: Before `roadmap-plan` creates or substantially restructures roadmap
artifacts, it MUST converge with the user on milestone boundaries, stage goals,
and completion criteria, then confirm the intended roadmap shape before writing
files.

Before `roadmap-plan` creates or substantially restructures roadmap
artifacts, it MUST converge with the user on milestone boundaries, stage goals,
and completion criteria, then confirm the intended roadmap shape before writing
files.

If the roadmap contains legacy milestone files that need migration, that
confirmation step MUST also cover any non-obvious content reinterpretation the
skill plans to make while rewriting those milestones into the canonical format,
including how it will handle older sections such as `## Candidate Ideas`,
combined `## Dependencies / Risks`, or missing scope and notes sections.

### Requirement: roadmap-skills-read-roadmap-context-before-editing
Previously: `roadmap-plan`, `roadmap-milestone`, and `roadmap-sync` MUST read
`.spec-driven/config.yaml`, existing
`.spec-driven/roadmap/INDEX.md` and relevant milestone files when present, and
the active or archived changes needed to understand current execution state
before they decide what roadmap updates to make.

`roadmap-plan`, `roadmap-milestone`, and `roadmap-sync` MUST read
`.spec-driven/config.yaml`, existing
`.spec-driven/roadmap/INDEX.md` and relevant milestone files when present, and
the active or archived changes needed to understand current execution state
before they decide what roadmap updates to make.

When legacy milestone migration is in scope, `roadmap-plan` MUST also treat the
existing milestone wording itself as migration evidence and use that evidence to
preserve intent conservatively while rewriting the file. That includes reading
legacy section labels and nearby prose as evidence for whether content should
map into `## Planned Changes`, `## Dependencies`, `## Risks`, `## In Scope`,
`## Out of Scope`, or `## Notes`.
