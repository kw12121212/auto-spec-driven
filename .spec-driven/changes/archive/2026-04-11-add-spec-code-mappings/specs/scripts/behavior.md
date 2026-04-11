---
mapping:
  implementation:
    - scripts/spec-driven.ts
  tests:
    - test/run.js
---

## ADDED Requirements

### Requirement: verify-spec-mappings-validates-spec-frontmatter
`spec-driven.js verify-spec-mappings [path]` MUST inspect every main spec file
under the target `.spec-driven/specs/` directory, excluding `INDEX.md` and
`README.md`, and validate that each file begins with YAML frontmatter containing
`mapping.implementation` and `mapping.tests` arrays.

Each entry in those arrays MUST be a repo-relative file path string. The command
MUST validate that each mapped path exists in the target repository. It MUST
output JSON `{ valid, warnings[], errors[] }`, where `valid` is false when
`errors` is non-empty.

The command MUST report enough detail for an AI agent to identify the affected
spec file, mapping field, and invalid condition. The command MUST NOT attempt to
judge whether a mapped file semantically implements or tests the spec.

#### Scenario: valid-spec-mappings
- GIVEN every main spec file has mapping frontmatter with existing
  implementation and test file paths
- WHEN `verify-spec-mappings` is run
- THEN the command reports `valid: true`
- AND `errors` is empty

#### Scenario: missing-spec-mapping-frontmatter
- GIVEN a main spec file has no frontmatter mapping
- WHEN `verify-spec-mappings` is run
- THEN the command reports `valid: false`
- AND `errors` identifies the spec file and missing mapping frontmatter

#### Scenario: invalid-spec-mapping-path
- GIVEN a main spec file maps an implementation or test path that does not exist
- WHEN `verify-spec-mappings` is run
- THEN the command reports `valid: false`
- AND `errors` identifies the spec file, field, and missing target path

### Requirement: verify-spec-mappings-is-structural-only
`verify-spec-mappings` MUST limit itself to deterministic filesystem mechanics:
frontmatter presence, mapping field shape, path string validation, and target
existence. Semantic alignment between specs, implementation behavior, and tests
MUST remain the responsibility of AI skills.

#### Scenario: structural-validation-does-not-claim-semantic-coverage
- GIVEN a mapped file path exists but may not actually implement the spec
- WHEN `verify-spec-mappings` is run
- THEN the command does not report semantic coverage claims
- AND it only validates the mapping structure and path existence
