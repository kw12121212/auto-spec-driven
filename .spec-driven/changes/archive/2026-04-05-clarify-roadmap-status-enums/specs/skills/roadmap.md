## MODIFIED Requirements

### Requirement: roadmap-plan-builds-or-restructures-milestones
`roadmap-plan` MUST help the user create or restructure the roadmap
into milestone files with explicit phase goals, milestone boundaries, and
planned changes. Before writing or rewriting roadmap assets, it MUST read
`.spec-driven/config.yaml`, any existing roadmap files, relevant specs, and the
currently active or archived changes needed to understand the repository's
present state.

When `roadmap-plan` instructs the AI how to write or interpret roadmap status
fields, it MUST explicitly state the legal milestone declared status enum:
- `proposed`
- `active`
- `blocked`
- `complete`

It MUST also explicitly state the legal planned change declared status enum:
- `planned`
- `complete`

When milestone-local context is too large for one planned change summary line,
`roadmap-plan` MUST keep the planned change entry itself single-line and place
additional explanation elsewhere in the milestone file, such as `## Notes`,
rather than adding attached continuation lines under `## Planned Changes`.

When existing milestone files use an older structure, such as an extra
`## Candidate Ideas` section, a combined `## Dependencies / Risks` section, or
missing `## In Scope`, `## Out of Scope`, or `## Notes` sections,
`roadmap-plan` MAY migrate them into the canonical milestone format during
restructuring. It MUST preserve clearly recoverable content, rewrite the file
into the current standard section set, and avoid silently inventing ambiguous
content.

When the legacy source supports a confident mapping, `roadmap-plan` MUST map
that content into the canonical sections conservatively. When no canonical
section is an exact fit but the content is still worth preserving,
`roadmap-plan` MAY preserve that context in `## Notes` instead of dropping it.

When the legacy source does not support a confident split into the new milestone
sections, `roadmap-plan` MUST surface that ambiguity in the planning discussion
instead of pretending the migration is exact.

### Requirement: roadmap-milestone-refines-one-milestone-without-collapsing-the-roadmap
`roadmap-milestone` MUST focus on one milestone at a time. It MUST
refine that milestone's goal, done criteria, planned changes, dependencies, and
risks without collapsing multiple milestones into one oversized document.

When `roadmap-milestone` instructs the AI how to write or interpret roadmap
status fields, it MUST explicitly state the legal milestone declared status
enum:
- `proposed`
- `active`
- `blocked`
- `complete`

It MUST also explicitly state the legal planned change declared status enum:
- `planned`
- `complete`

When a milestone author needs more context than one planned change summary line
can carry, `roadmap-milestone` MUST preserve the planned change as a single-line
entry and move additional explanation to another milestone section instead of
adding attached continuation lines.

When the user wants to migrate only one legacy milestone instead of
restructuring the wider roadmap, `roadmap-milestone` MAY be used as a narrower
fallback path. When used that way, it MUST preserve clearly recoverable content
and surface ambiguity instead of pretending the migrated structure is exact.

### Requirement: roadmap-propose-promotes-planned-changes-into-normal-changes
`roadmap-propose` MUST turn a milestone `Planned Changes` item into a normal
change scaffold under `.spec-driven/changes/<name>/`. It MUST require the target
work item to already appear under a milestone `## Planned Changes` section
before scaffolding.

When `roadmap-propose` instructs the AI how to interpret roadmap status values,
it MUST explicitly state the legal milestone declared status enum:
- `proposed`
- `active`
- `blocked`
- `complete`

It MUST also explicitly state the legal planned change declared status enum:
- `planned`
- `complete`

`roadmap-propose` MUST treat each planned change entry as a single-line roadmap
input in the canonical format
`- \`<change-name>\` - Declared: <status> - <summary>`.
It MUST resolve the target work item from the ``<change-name>`` portion only,
and MUST NOT depend on the declared status or trailing summary text when
drafting change proposal artifacts.

### Requirement: roadmap-recommend-recommends-the-next-change-from-roadmap-context
`roadmap-recommend` MUST analyze roadmap milestone context and recommend a next
change candidate for the user to consider. The recommendation MUST identify the
proposed change name, the milestone it comes from, and why it is a good next
step. The recommended candidate MUST already exist under a milestone
`## Planned Changes` section.

When `roadmap-recommend` instructs the AI how to interpret roadmap status
values, it MUST explicitly state the legal milestone declared status enum:
- `proposed`
- `active`
- `blocked`
- `complete`

It MUST also explicitly state the legal planned change declared status enum:
- `planned`
- `complete`

`roadmap-recommend` MUST treat each planned change entry as a single-line roadmap
input in the canonical format
`- \`<change-name>\` - Declared: <status> - <summary>`.
It MUST resolve the recommended work item from the ``<change-name>`` portion
only, and MUST NOT depend on the declared status or trailing summary text when
explaining or summarizing the recommended change.

### Requirement: roadmap-sync-reconciles-roadmap-state-with-change-history
`roadmap-sync` MUST use script assistance to reconcile roadmap state before it
edits roadmap files. It MUST read roadmap milestone files together with
`.spec-driven/changes/` and `.spec-driven/changes/archive/`, and it MUST run
`node {{SKILL_DIR}}/scripts/spec-driven.js roadmap-status` to obtain structured
milestone and planned change state before it decides what roadmap updates to
make. It MUST update milestone declared status and planned change declared
status based on repository evidence rather than preserving stale manual labels.

When `roadmap-sync` instructs the AI how to interpret roadmap status fields, it
MUST explicitly state the legal milestone declared status enum:
- `proposed`
- `active`
- `blocked`
- `complete`

It MUST also explicitly state the legal planned change declared status enum:
- `planned`
- `complete`
