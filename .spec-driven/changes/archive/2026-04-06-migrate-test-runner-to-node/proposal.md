# migrate-test-runner-to-node

## What

Replace the repository's shell-based test runner with a Node.js entry point at
`test/run.js` and update the repository's standard test command to use that
Node.js runner.

The new runner will preserve the current suite structure, fixture setup, reset
behavior, and command assertions while moving orchestration logic out of the
large `test/run.sh` script.

## Why

`test/run.sh` has grown large enough that continued maintenance in shell is
becoming harder to read, extend, and debug. The repository already uses Node.js
tooling and manages dependencies through `package.json`, so moving the test
orchestration into JavaScript reduces maintenance friction without changing the
CLI features under test.

## Scope

In scope:
- Add `test/run.js` as the new repository test runner.
- Migrate the existing test orchestration, assertions, fixture setup, and reset
  behavior from `test/run.sh` into Node.js.
- Update `package.json` so `npm test` runs the Node.js test runner.
- Update repository documentation and skill examples that currently refer to
  `bash test/run.sh`, preferring `npm test` as the primary command.

Out of scope:
- Changing CLI behavior or the underlying feature coverage of the existing
  tests.
- Introducing a new test framework.
- Keeping `test/run.sh` as a supported compatibility wrapper.
- Reworking fixture content beyond what is needed to support the runner
  migration.

## Unchanged Behavior

Behaviors that must not change as a result of this change (leave blank if nothing is at risk):
- The full repository test suite remains repeatable and continues to reset test
  state before and after execution.
- Existing assertions around `init`, `verify-roadmap`, `install`, `migrate`,
  `run-maintenance`, `propose`, `modify`, `list`, `apply`, `verify`,
  `archive`, and `cancel` coverage remain intact.
- The repository continues to expose a single standard test command through
  `package.json`.
