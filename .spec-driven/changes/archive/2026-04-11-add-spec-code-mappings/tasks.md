# Tasks: add-spec-code-mappings

## Implementation

- [x] Add frontmatter mapping documentation to `.spec-driven/specs/README.md`.
- [x] Add `mapping.implementation` and `mapping.tests` frontmatter to every existing main spec file under `.spec-driven/specs/`, excluding `INDEX.md` and `README.md`.
- [x] Add `verify-spec-mappings [path]` to `scripts/spec-driven.ts`, including JSON output and validation for required mapping fields, string arrays, and existing repo-relative target paths.
- [x] Update CLI help and script behavior specs for the new validation command.
- [x] Add `skills/spec-driven-resync-code-mapping/SKILL.md` for retrofitting old spec mappings and repairing stale or malformed mapping frontmatter after confirmation.
- [x] Update `install.sh` and related installation tests so `spec-driven-resync-code-mapping` is installed with the other bundled skills.
- [x] Update planning, execution, lifecycle, workflow, and sync-related skill instructions so spec edits preserve and maintain mapping frontmatter.
- [x] Update or add tests in `test/run.js` for valid mappings, missing frontmatter, invalid mapping fields, and missing mapped files.

## Testing

- [x] Run `npm run build`.
- [x] Run `npm run validate-skills`.
- [x] Run unit tests with `npm test`.
- [x] Run `node dist/scripts/spec-driven.js verify-spec-mappings`.

## Verification

- [x] Verify each changed main spec file has separate implementation and test mappings.
- [x] Verify `spec-driven-resync-code-mapping` does not edit implementation files or requirement bodies when only mapping repair is requested.
- [x] Verify CLI JSON errors identify the affected spec file, field, and invalid path or format condition.
- [x] Verify no requirement body was rewritten to include implementation details that belong in frontmatter.
