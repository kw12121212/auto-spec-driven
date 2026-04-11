# Tasks: specialize-review-checklists

## Implementation

- [x] Update execution delta specs so `spec-driven-review` must identify and apply relevant change-type-specific checklists.
- [x] Update workflow delta specs so specialized review remains one review skill and does not split the workflow into separate review entry points.
- [x] Update `skills/spec-driven-review/SKILL.md` with checklist routing guidance for security-sensitive, UI, DX, migration, API, and maintenance changes.
- [x] Add or update validation coverage so the modified review skill remains schema-valid.
- [x] Re-read the updated review prompt and affected specs to confirm baseline review, mapping audit, and MUST FIX blocker behavior are preserved.

## Testing

- [x] Run `npm run build`.
- [x] Run `npm run validate-skills`.
- [x] Run unit tests with `npm test`.
- [x] Run `node dist/scripts/spec-driven.js verify specialize-review-checklists`.

## Verification

- [x] Verify review checklist routing covers security-sensitive, UI, DX, migration, API, and maintenance changes.
- [x] Verify `spec-driven-review` remains the single review entry point.
- [x] Verify no commit, push, PR, deployment, release, canary, or ship behavior is added.
- [x] Verify specialized checklist findings still use MUST FIX, SHOULD FIX, and NITS.
