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

# Skills Execution

## MODIFIED Requirements

### Requirement: review-focuses-on-code-and-test-quality
Previously: `spec-driven-review` MUST evaluate readability, security, error handling, performance,
best practices, and whether tests cover the key scenarios described by the delta specs.

`spec-driven-review` MUST evaluate readability, security, error handling,
performance, best practices, and whether tests cover the key scenarios
described by the delta specs.

Before issuing findings, `spec-driven-review` MUST identify any applicable
change-type-specific review checklists from the proposal, delta specs, tasks,
changed files, mapping frontmatter, and repository context. The supported
checklist types MUST include:
- security-sensitive changes
- UI changes
- DX changes
- migration changes
- API changes
- maintenance changes

Checklist routing MUST be additive. A change MAY match multiple checklist types,
and matching a specialized checklist MUST NOT skip the baseline code quality,
test quality, or mapping quality checks required for every review.

Security-sensitive review MUST emphasize input validation, authorization or
permission changes, secret handling, injection risks, data exposure, and safe
failure behavior. UI review MUST emphasize user-visible regressions,
accessibility, layout stability, state transitions, and test evidence for key
interactions. DX review MUST emphasize command usability, documentation,
operator feedback, error messages, and compatibility with existing workflow
conventions. Migration review MUST emphasize reversibility, idempotency,
backward compatibility, partial failure behavior, and data preservation. API
review MUST emphasize contract compatibility, error semantics, validation,
versioning or migration expectations, and caller impact. Maintenance review
MUST emphasize repeatability, dependency or generated-artifact safety,
repository hygiene, and avoidance of unrelated churn.

#### Scenario: review-applies-security-sensitive-checklist
- GIVEN a change modifies authentication, authorization, secret handling, or
  other security-sensitive behavior
- WHEN `spec-driven-review` reviews the change
- THEN it applies security-sensitive checklist items in addition to the baseline
  review checks

#### Scenario: review-applies-multiple-checklists
- GIVEN a change modifies an API boundary and includes migration behavior
- WHEN `spec-driven-review` reviews the change
- THEN it applies both API and migration checklist items
- AND it still performs baseline code, test, and mapping review

#### Scenario: review-keeps-specialized-findings-in-standard-severities
- GIVEN a specialized checklist identifies a review concern
- WHEN `spec-driven-review` reports the concern
- THEN the concern is classified as MUST FIX, SHOULD FIX, or NITS according to
  the existing severity model
