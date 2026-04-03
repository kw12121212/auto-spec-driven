# refine-milestone-format

## What

Refine the roadmap milestone Markdown format so each milestone records scope
boundaries, described planned changes, separated dependencies versus risks, and
a standard notes area without giving up machine validation. The change updates
the roadmap contract, script parsing rules, and roadmap examples/templates in
this repository so the richer milestone shape becomes the default authoring
format.

Planned change entries will keep a canonical first line for machine parsing, but
they may also include optional indented detail lines so each milestone can
record richer context than just a name plus one short description.

## Why

The current milestone format is valid but terse. It does not distinguish what a
milestone includes from what it intentionally excludes, it mixes dependencies
with risks, planned changes only expose change names, and there is no standard
place for maintainers to capture state context beyond the single declared-status
bullet. That makes roadmap files harder to review and easier to misread. A
clearer section contract keeps milestones more useful to humans while staying
rigid enough for script validation and status tooling.

## Scope

In scope:
- Expand the standard milestone section set with `## In Scope`, `## Out of Scope`,
  `## Dependencies`, `## Risks`, and `## Notes`
- Replace the combined `## Dependencies / Risks` section with separate sections
- Define a canonical `## Planned Changes` bullet format that preserves the
  kebab-case change name and adds a short human-readable summary
- Allow each planned change to include optional indented detail lines beneath
  that canonical first line
- Update roadmap parsing and validation contracts so scripts can validate and
  resolve the refined planned-change entry shape
- Update roadmap template/example files in this repository to use the new
  milestone structure

Out of scope:
- Introducing YAML or frontmatter metadata for roadmap milestones
- Renaming `## Done Criteria`
- Changing the declared milestone status enum or derived status rules
- Reworking roadmap index structure or milestone completion semantics
- Adding roadmap priority scoring, dependency graphs, or automatic milestone
  splitting

## Unchanged Behavior

Behaviors that must not change as a result of this change (leave blank if nothing is at risk):
- Roadmap milestones remain Markdown files under `.spec-driven/roadmap/milestones/`
- `## Planned Changes` remains the milestone's only work list
- Milestone completion still derives from archived planned changes rather than
  manual completion overrides
- `## Status` continues to use `- Declared: <status>` as the machine-validated
  status field
