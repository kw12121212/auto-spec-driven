# Questions: migrate-test-runner-to-node

## Open

<!-- No open questions -->

## Resolved

- [x] Q: Should the repository keep `bash test/run.sh` as a compatibility
  entry point?
  Context: This determines whether the migration fully removes shell from the
  supported test runner path or keeps a forwarding layer.
  A: No. The repository should fully switch to the Node.js runner.
- [x] Q: What file form should the new Node.js runner use?
  Context: This affects whether the change introduces build coupling or keeps
  the runner as a direct repository script.
  A: Use `test/run.js`.
