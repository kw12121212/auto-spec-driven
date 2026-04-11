# add-spec-code-mappings

## What

Add explicit spec-to-code mapping metadata to spec files. Each main spec file
will declare YAML frontmatter with separate `mapping.implementation` and
`mapping.tests` file lists. The CLI will validate the mapping format and report
machine-readable JSON errors so AI workflows can identify malformed mappings,
missing fields, and missing target files. Add a dedicated
`spec-driven-remap-specs` skill to retrofit mappings onto older spec files and
repair stale or malformed mappings.

## Why

The current workflow requires AI agents to infer which code and tests relate to
a spec from repository context. That inference works for small changes but is
easy to miss as specs, skills, scripts, and tests grow. Putting the mapping at
the top of each spec file makes the relationship visible exactly where the
requirement context is read, while still keeping implementation details out of
requirement bodies.

## Scope

In scope:
- Define a frontmatter mapping schema for spec files:
  `mapping.implementation` and `mapping.tests`, both arrays of repo-relative
  file paths.
- Add mappings to the existing main spec files under `.spec-driven/specs/`.
- Add a CLI validation command that reports JSON `{ valid, warnings[], errors[] }`.
- Validate that mapping fields are present, arrays contain strings, and each
  referenced file path exists.
- Add `spec-driven-remap-specs`, a planning-layer skill that reads existing
  specs, runs mapping validation, inspects related repository files, proposes
  mapping repairs, and after confirmation updates spec frontmatter directly.
- Update skill workflow requirements so apply, verify, review, archive, and
  direct spec synchronization maintain the mappings as specs and code change.
- Keep mappings at file granularity only.

Out of scope:
- External traceability files such as `.spec-driven/traceability.json`.
- Symbol, function, range, or line-level mapping.
- CLI semantic judgment about whether a mapped file truly implements or tests a
  requirement.
- Requiring full historical requirement-level coverage in the first version.
- Changing implementation behavior while remapping specs.

## Unchanged Behavior

Behaviors that must not change as a result of this change (leave blank if nothing is at risk):
- Requirement bodies continue to describe observable behavior, not
  implementation details.
- Existing delta spec section markers and requirement formatting remain valid.
- Proposal, apply, verify, review, archive, roadmap, maintenance, and install
  commands keep their existing behavior except where explicitly extended for
  spec-code mapping validation or maintenance.
- Scripts continue to perform deterministic filesystem mechanics only; AI
  skills remain responsible for semantic interpretation.
