---
mapping:
  implementation:
    - skills/spec-driven-init/SKILL.md
    - skills/spec-driven-propose/SKILL.md
    - skills/spec-driven-brainstorm/SKILL.md
    - skills/spec-driven-modify/SKILL.md
    - skills/spec-driven-spec-edit/SKILL.md
    - skills/spec-driven-sync-specs/SKILL.md
    - skills/spec-driven-resync-code-mapping/SKILL.md
    - skills/spec-driven-apply/SKILL.md
    - skills/spec-driven-verify/SKILL.md
    - skills/spec-driven-review/SKILL.md
    - skills/spec-driven-archive/SKILL.md
    - skills/spec-driven-auto/SKILL.md
    - skills/spec-driven-simple-task/SKILL.md
    - scripts/spec-driven.ts
  tests:
    - test/run.js
    - test/validate-skills.ts
---

# Skills Workflow

## ADDED Requirements

### Requirement: specialized-review-checklists-stay-within-one-review-skill
Change-type-specific review checklist routing MUST remain inside
`spec-driven-review` rather than creating separate review skills for security,
UI, DX, migration, API, or maintenance changes.

The specialized checklist routing MUST preserve the existing workflow contract:
review happens after implementation and verification readiness, uses current
change artifacts and repository state as source of truth, reports MUST FIX,
SHOULD FIX, and NITS, and treats MUST FIX findings as archive blockers.

#### Scenario: specialized-review-does-not-split-entry-point
- GIVEN a completed change needs security-sensitive or migration review
- WHEN the user enters the review workflow
- THEN the user still uses `spec-driven-review`
- AND the skill routes internally to the relevant checklist guidance
