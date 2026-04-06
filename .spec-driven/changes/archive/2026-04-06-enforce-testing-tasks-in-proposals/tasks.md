# Tasks: enforce-testing-tasks-in-proposals

## Implementation

- [x] Update planning skill instructions so proposal-producing workflows require
  concrete `## Testing` tasks with explicit lint or validation and unit test
  commands.
- [x] Update the CLI verify contract and implementation so proposals fail when
  `tasks.md` lacks required testing tasks or uses non-runnable testing wording.
- [x] Rebuild `dist/scripts/spec-driven.js` after changing `scripts/spec-driven.ts`.

## Testing

- [x] Run `npm run build` to confirm the TypeScript CLI still compiles.
- [x] Run `bash test/run.sh` to confirm the workflow fixture still passes.

## Verification

- [x] Run `node dist/scripts/spec-driven.js verify enforce-testing-tasks-in-proposals`
  and confirm the proposal artifacts validate with no non-question errors.
