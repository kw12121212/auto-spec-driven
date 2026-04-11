# Tasks: require-explicit-script-command-references

## Implementation

- [x] Add a workflow delta spec requiring concrete script command references in skill prompts.
- [x] Update affected skills so any validator or audit step names the exact `node {{SKILL_DIR}}/scripts/spec-driven.js ...` command.
- [x] Add or update validation/tests to catch missing concrete command references where practical.

## Testing

- [x] Run `npm run validate-skills`.
- [x] Run `npm test`.
- [x] Run the unit test command `npm test` and confirm it covers the updated skill prompt validation behavior through `test/validate-skills.ts`.

## Verification

- [x] Verify updated skill prompts no longer rely on generic validator/audit wording where a concrete command is expected.
