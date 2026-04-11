---
mapping:
  implementation:
    - skills/spec-driven-archive/SKILL.md
    - skills/spec-driven-cancel/SKILL.md
    - skills/spec-driven-auto/SKILL.md
    - scripts/spec-driven.ts
  tests:
    - test/run.js
    - test/validate-skills.ts
---

## ADDED Requirements

### Requirement: archive-merges-spec-mapping-frontmatter
`spec-driven-archive` MUST preserve or merge mapping frontmatter when it merges
accepted delta specs into main spec files. If a delta spec file contains updated
mapping frontmatter for its corresponding main spec file, archive MUST apply
that mapping to the main spec file before moving the change to archive.

After merging, the main spec file MUST still begin with valid mapping
frontmatter and the requirement body MUST remain focused on observable behavior.

#### Scenario: archive-applies-updated-spec-mapping
- GIVEN a delta spec file includes updated mapping frontmatter
- WHEN `spec-driven-archive` merges the delta into the corresponding main spec
- THEN the main spec file begins with the updated mapping frontmatter
- AND the accepted requirement changes are merged below it

### Requirement: archive-validates-spec-mappings-before-closeout
Before completing archive, `spec-driven-archive` MUST ensure spec mapping
validation passes for affected main spec files. Mapping validation failures are
archive blockers unless the user explicitly cancels or revises the change.

#### Scenario: archive-blocks-invalid-mapping
- GIVEN an affected main spec file has malformed mapping frontmatter after merge
- WHEN archive validation runs
- THEN `spec-driven-archive` stops before final closeout
- AND reports the mapping validation error
