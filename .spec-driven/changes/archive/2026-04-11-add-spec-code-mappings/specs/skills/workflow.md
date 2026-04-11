---
mapping:
  implementation:
    - skills/spec-driven-init/SKILL.md
    - skills/spec-driven-propose/SKILL.md
    - skills/spec-driven-brainstorm/SKILL.md
    - skills/spec-driven-modify/SKILL.md
    - skills/spec-driven-spec-edit/SKILL.md
    - skills/spec-driven-sync-specs/SKILL.md
    - skills/spec-driven-apply/SKILL.md
    - skills/spec-driven-verify/SKILL.md
    - skills/spec-driven-review/SKILL.md
    - skills/spec-driven-archive/SKILL.md
    - skills/spec-driven-auto/SKILL.md
    - skills/spec-driven-simple-task/SKILL.md
    - skills/spec-driven-remap-specs/SKILL.md
    - scripts/spec-driven.ts
  tests:
    - test/run.js
    - test/validate-skills.ts
---

## ADDED Requirements

### Requirement: spec-files-declare-code-mappings-in-frontmatter
Every main spec file under `.spec-driven/specs/`, excluding `INDEX.md` and
`README.md`, MUST begin with YAML frontmatter that declares related
implementation files and test files separately.

The mapping frontmatter MUST use:

```yaml
mapping:
  implementation:
    - <repo-relative implementation path>
  tests:
    - <repo-relative test path>
```

The mapping is many-to-many at file granularity: a spec file MAY list multiple
implementation and test files, and the same repository file MAY appear in
multiple spec files.

#### Scenario: spec-file-has-separated-code-and-test-mappings
- GIVEN a main spec file describes behavior implemented by a script and tested
  by the test runner
- WHEN the spec file is read
- THEN its frontmatter lists the script under `mapping.implementation`
- AND it lists the test runner under `mapping.tests`

### Requirement: spec-mapping-state-stays-synchronized
When a workflow creates, modifies, merges, or directly synchronizes main spec
files, it MUST preserve and update mapping frontmatter so the listed
implementation and test files continue to reflect the current repository
evidence for that spec file.

Requirement bodies MUST continue to describe observable behavior rather than
embedding implementation file paths in prose.

#### Scenario: spec-edit-preserves-mapping-frontmatter
- GIVEN a workflow modifies an existing main spec file
- WHEN it writes the updated spec file
- THEN the mapping frontmatter remains present
- AND implementation details are not moved into requirement prose
