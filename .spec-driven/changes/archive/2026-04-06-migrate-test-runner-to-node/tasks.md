# Tasks: migrate-test-runner-to-node

## Implementation

- [x] Create `test/run.js` and migrate the existing test-runner control flow,
  assertion helpers, and fixture lifecycle from `test/run.sh`.
- [x] Update `package.json` so `npm test` runs the new Node.js test runner.
- [x] Update repository documentation and skill text that currently present
  `bash test/run.sh` as the default command for this repository.
- [x] Remove the old `test/run.sh` entry point and any runner-specific shell
  assumptions that are no longer needed.

## Testing

- [x] Run `npm run build` to confirm the compiled CLI still builds successfully.
- [x] Run `npm test` to confirm the migrated test runner preserves the existing
  repository test coverage.

## Verification

- [x] Verify the repository no longer depends on `bash test/run.sh` as a
  supported test entry point.
- [x] Verify the migrated runner still resets fixture state before and after
  execution so repeated runs remain stable.
