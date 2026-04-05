## MODIFIED Requirements

### Requirement: roadmap-skills-read-roadmap-context-before-editing
`roadmap-plan`, `roadmap-milestone`, and `roadmap-sync` MUST read
`.spec-driven/config.yaml`, existing
`.spec-driven/roadmap/INDEX.md` and relevant milestone files when present, and
the active or archived changes needed to understand current execution state
before they decide what roadmap updates to make.

Those skills MUST also surface the legal roadmap status enums directly in their
instructions before editing roadmap assets so the AI can use the legal values
without inferring them from separate spec files.

When legacy milestone migration is in scope, `roadmap-plan` MUST also treat the
existing milestone wording itself as migration evidence and use that evidence to
preserve intent conservatively while rewriting the file. That includes reading
legacy section labels and nearby prose as evidence for whether content should
map into `## Planned Changes`, `## Dependencies`, `## Risks`, `## In Scope`,
`## Out of Scope`, or `## Notes`.

### Requirement: roadmap-propose-reads-roadmap-and-spec-context-before-writing
`roadmap-propose` MUST read `.spec-driven/config.yaml`,
`.spec-driven/roadmap/INDEX.md`, the relevant milestone file, and
`.spec-driven/specs/INDEX.md` before it scaffolds a change.

Before it asks the AI to interpret milestone or planned change status values,
`roadmap-propose` MUST surface the legal roadmap status enums directly in its
instructions rather than assuming the AI will infer them from main specs or
validator behavior.

`roadmap-propose` MUST treat planned change entries as single-line roadmap input
in the canonical format
`- \`<change-name>\` - Declared: <status> - <summary>` when reading milestone
context. It MUST resolve the target change from the ``<change-name>`` portion
and MUST NOT rely on the declared status or trailing summary text as part of the
planning context.

### Requirement: roadmap-recommend-reads-roadmap-context-before-recommending
`roadmap-recommend` MUST read `.spec-driven/config.yaml`,
`.spec-driven/roadmap/INDEX.md`, the relevant milestone files, and
`.spec-driven/specs/INDEX.md` before it recommends a change.

Before it asks the AI to interpret milestone or planned change status values,
`roadmap-recommend` MUST surface the legal roadmap status enums directly in its
instructions rather than assuming the AI will infer them from main specs or
validator behavior.

`roadmap-recommend` MUST treat planned change entries as single-line roadmap
input in the canonical format
`- \`<change-name>\` - Declared: <status> - <summary>` when reading milestone
context. It MUST resolve the candidate change from the ``<change-name>`` portion
and MUST NOT rely on the declared status or trailing summary text as part of the
recommendation context.

### Requirement: roadmap-authoring-skills-default-new-planned-changes-to-planned
`roadmap-plan` and `roadmap-milestone` MUST write planned change entries in the
canonical format `- \`<change-name>\` - Declared: <status> - <summary>`.

Those skills MUST explicitly describe the legal milestone declared status enum
as `proposed`, `active`, `blocked`, or `complete`, and the legal planned change
declared status enum as `planned` or `complete`, before they write or revise
roadmap content.

When those skills add a new planned change, or rewrite an existing planned
change that is not yet archived, they MUST use `Declared: planned`. They MUST
NOT invent other per-change status labels.

When `roadmap-sync` rewrites milestone files from repository evidence, it MUST
set archived planned changes to `Declared: complete` and all other planned
changes to `Declared: planned`.
