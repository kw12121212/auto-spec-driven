## ADDED Requirements

### Requirement: spec-edit-reads-index-before-choosing-target
`spec-driven-spec-edit` MUST read `.spec-driven/specs/INDEX.md` and the relevant
main spec files before deciding which spec file to create or modify. It MUST
prefer existing categories and files unless the content clearly requires a new
path.

### Requirement: spec-edit-edits-main-specs-directly
`spec-driven-spec-edit` MUST edit `.spec-driven/specs/` main spec files directly.
It MUST NOT create or interact with `.spec-driven/changes/` delta spec files.

### Requirement: spec-edit-updates-index-on-structural-changes
When `spec-driven-spec-edit` creates a new spec file or category under
`.spec-driven/specs/`, it MUST update `.spec-driven/specs/INDEX.md` to include
the new entry.

### Requirement: spec-edit-describes-observable-behavior-only
When `spec-driven-spec-edit` writes or modifies requirements, it MUST describe
observable behavior only, not implementation details.

### Requirement: spec-edit-handles-removals-explicitly
When `spec-driven-spec-edit` removes requirements, it MUST identify the exact
`### Requirement:` heading or headings being removed and delete them cleanly.
It MUST NOT leave orphaned headings or vague remnants.

### Requirement: spec-edit-confirms-before-writing
`spec-driven-spec-edit` MUST present the planned modifications — which files
will be changed and what the new content will look like — and wait for
explicit user confirmation before writing anything to disk. It MUST NOT
silently modify spec files.

### Requirement: spec-edit-is-planning-layer-only
`spec-driven-spec-edit` is a planning/documentation skill. It MUST NOT
implement product code changes.
