# Design: migrate-test-runner-to-node

## Approach

Implement a standalone Node.js test runner in `test/run.js` that mirrors the
current shell script flow section by section. The runner will provide a small
set of helpers for command execution, output assertions, JSON field checks, and
temporary fixture setup so the existing test intent stays recognizable while
becoming easier to maintain.

The migration will also replace direct shell-only test entry references in
repository-facing docs and skill prompts with `npm test`, while keeping the
underlying fixture commands and CLI subprocesses unchanged unless the runner
itself needs a Node-native equivalent.

## Key Decisions

- Use `test/run.js` instead of a compiled TypeScript runner.
  Rationale: this keeps the migration small and avoids coupling the repository's
  main build step to its own test harness implementation.
- Fully replace `test/run.sh` instead of keeping a shell wrapper.
  Rationale: the goal is to remove the shell maintenance burden, not just hide
  it behind a forwarding layer.
- Treat `npm test` as the repository's primary documented entry point.
  Rationale: it is stable for users, works with existing package-managed
  dependencies, and decouples documentation from the exact file name of the
  runner implementation.
- Preserve the current coverage and execution order unless the Node migration
  requires a safe mechanical adjustment.
  Rationale: this proposal is about maintainability, not about redesigning the
  scope of the test suite.

## Alternatives Considered

- Keep expanding `test/run.sh`.
  Rejected because the current maintenance problem comes from the size and
  complexity of the shell script itself.
- Keep `test/run.sh` as a thin wrapper around a Node.js runner.
  Rejected because it retains an extra supported entry point without providing
  clear value once `npm test` points at Node directly.
- Move the runner into compiled TypeScript under `scripts/`.
  Rejected because the runner does not need to ship as part of the CLI build
  artifact and the extra compile dependency would add unnecessary coupling.
