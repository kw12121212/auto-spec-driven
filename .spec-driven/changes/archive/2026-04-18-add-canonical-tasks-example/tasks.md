# Tasks: add-canonical-tasks-example

## Implementation

- [x] Add a planning delta spec requiring proposal-authoring and modify skills to embed a canonical tasks.md example with annotated verification keywords.
- [x] Update `skills/spec-driven-propose/SKILL.md` to embed the canonical tasks.md example and keyword annotations in step 7.
- [x] Update `skills/spec-driven-brainstorm/SKILL.md` to embed the canonical tasks.md example and keyword annotations in step 7.
- [x] Update `skills/spec-driven-modify/SKILL.md` to embed the canonical tasks.md example and keyword annotations in the tasks.md editing guidance.
- [x] Update `skills/roadmap-propose/SKILL.md` to embed the canonical tasks.md example and keyword annotations in step 6.
- [x] Update `skills/roadmap-recommend/SKILL.md` to embed the canonical tasks.md example and keyword annotations in step 7.
- [x] Add a Tasks Format section to `.spec-driven/specs/README.md` with the canonical example and keyword list.

## Testing

- [x] Run `npm run validate-skills` to validate updated skill prompts
- [x] Run `npm test` to confirm unit tests pass after spec and skill changes

## Verification

- [x] Verify each updated skill prompt contains the canonical tasks.md example with keyword annotations
- [x] Verify `.spec-driven/specs/README.md` documents the required keywords for lint/validation and unit test tasks
- [x] Verify the canonical example matches the verify script's actual keyword matching logic
