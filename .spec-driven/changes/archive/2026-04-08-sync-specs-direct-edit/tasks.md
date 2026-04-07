# Tasks: sync-specs-direct-edit

## Implementation

- [x] Rewrite `skills/spec-driven-sync-specs/SKILL.md` with direct-edit workflow (scan → report → confirm → edit specs → init → report)
- [x] Update `.spec-driven/specs/skills/workflow.md` if it references sync-specs creating changes

## Testing

- [x] Run `npm run build` to confirm validation passes
- [x] Run `npm test` to confirm unit tests pass

## Verification

- [x] Verify the rewritten SKILL.md no longer references change lifecycle (propose, verify, archive)
- [x] Verify the rewritten SKILL.md includes explicit confirmation step before editing specs
- [x] Verify the rewritten SKILL.md includes `init` step to refresh INDEX.md
