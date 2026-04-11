---
mapping:
  implementation:
    - skills/spec-driven-apply/SKILL.md
    - skills/spec-driven-verify/SKILL.md
    - skills/spec-driven-review/SKILL.md
    - skills/spec-driven-auto/SKILL.md
  tests:
    - test/run.js
    - test/validate-skills.ts
---

## ADDED Requirements

### Requirement: apply-uses-spec-mappings-as-code-context
`spec-driven-apply` MUST inspect mapping frontmatter from relevant main spec
files and change delta spec files before implementation. It MUST use mapped
implementation and test paths as starting context when deciding which files to
read or modify.

The mappings guide context loading but do not replace repository inspection.
`spec-driven-apply` MUST still read existing code before modifying it.

#### Scenario: apply-loads-mapped-files-before-editing
- GIVEN a relevant spec file maps implementation and test paths
- WHEN `spec-driven-apply` prepares to implement a task for that spec area
- THEN it reads the mapped implementation and test files as part of its initial
  code context

### Requirement: apply-updates-spec-mappings-after-implementation
After implementation, `spec-driven-apply` MUST update the relevant delta spec
mapping frontmatter to reflect the actual implementation and test files changed
or relied on for the completed behavior.

If the implementation changes behavior covered by a spec file but no matching
mapping exists, `spec-driven-apply` MUST add or update the mapping metadata
before verification.

#### Scenario: apply-adds-mapping-for-new-test-coverage
- GIVEN implementation adds a new test file for a changed spec
- WHEN `spec-driven-apply` finishes the implementation task
- THEN the relevant delta spec mapping lists that file under `mapping.tests`

### Requirement: verify-checks-spec-mapping-readiness
`spec-driven-verify` MUST run the CLI spec mapping validation command and report
any malformed mapping frontmatter, missing required mapping fields, or missing
mapped files as CRITICAL findings.

`spec-driven-verify` MUST also compare the mapping metadata against completed
tasks, changed files, proposal scope, and delta specs. If a touched spec file
lacks mappings for the implementation or test files that provide the behavior,
that mismatch is a CRITICAL issue.

#### Scenario: verify-blocks-missing-mapped-test
- GIVEN a change adds behavior and tests for a spec file
- AND the relevant mapping omits the test file
- WHEN `spec-driven-verify` checks the change
- THEN it reports the missing mapped test evidence as a CRITICAL issue

### Requirement: review-loads-mapped-implementation-and-test-files
`spec-driven-review` MUST read mapped implementation and test files for the
relevant spec files before issuing review findings. Review findings SHOULD call
out stale or misleading mappings when they would make future verification or
maintenance unreliable.

#### Scenario: review-flags-stale-mapping
- GIVEN a spec maps a file that no longer contains relevant implementation
  evidence
- WHEN `spec-driven-review` evaluates the change
- THEN it reports the stale mapping as a review finding
