# Delta: Skills Planning

## ADDED Requirements

### Requirement: roadmap-authoring-skills-default-new-planned-changes-to-planned
`roadmap-plan` and `roadmap-milestone` MUST write planned change entries in the
canonical format `- \`<change-name>\` - Declared: <status> - <summary>`.

When those skills add a new planned change, or rewrite an existing planned
change that is not yet archived, they MUST use `Declared: planned`. They MUST
NOT invent other per-change status labels.

When `roadmap-sync` rewrites milestone files from repository evidence, it MUST
set archived planned changes to `Declared: complete` and all other planned
changes to `Declared: planned`.

## MODIFIED Requirements

### Requirement: roadmap-propose-reads-roadmap-and-spec-context-before-writing
Previously: `roadmap-propose` MUST read `.spec-driven/config.yaml`,
`.spec-driven/roadmap/INDEX.md`, the relevant milestone file, and
`.spec-driven/specs/INDEX.md` before it scaffolds a change.

`roadmap-propose` MUST treat planned change entries as single-line roadmap input
when reading milestone context. It MUST NOT rely on attached continuation lines
under `## Planned Changes` as part of the planning context.

`roadmap-propose` MUST read `.spec-driven/config.yaml`,
`.spec-driven/roadmap/INDEX.md`, the relevant milestone file, and
`.spec-driven/specs/INDEX.md` before it scaffolds a change.

`roadmap-propose` MUST treat planned change entries as single-line roadmap input
in the canonical format
`- \`<change-name>\` - Declared: <status> - <summary>` when reading milestone
context. It MUST resolve the target change from the ``<change-name>`` portion
and MUST NOT rely on the declared status or trailing summary text as part of the
planning context.

### Requirement: roadmap-recommend-reads-roadmap-context-before-recommending
Previously: `roadmap-recommend` MUST read `.spec-driven/config.yaml`,
`.spec-driven/roadmap/INDEX.md`, the relevant milestone files, and
`.spec-driven/specs/INDEX.md` before it recommends a change.

`roadmap-recommend` MUST treat planned change entries as single-line roadmap
input when reading milestone context. It MUST NOT rely on attached continuation
lines under `## Planned Changes` as part of the recommendation context.

`roadmap-recommend` MUST read `.spec-driven/config.yaml`,
`.spec-driven/roadmap/INDEX.md`, the relevant milestone files, and
`.spec-driven/specs/INDEX.md` before it recommends a change.

`roadmap-recommend` MUST treat planned change entries as single-line roadmap
input in the canonical format
`- \`<change-name>\` - Declared: <status> - <summary>` when reading milestone
context. It MUST resolve the candidate change from the ``<change-name>`` portion
and MUST NOT rely on the declared status or trailing summary text as part of the
recommendation context.
