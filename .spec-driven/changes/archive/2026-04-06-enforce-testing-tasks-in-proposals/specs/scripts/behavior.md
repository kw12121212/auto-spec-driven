# Delta: Scripts Behavior

## MODIFIED Requirements

### Requirement: verify-checks-artifacts
Previously: `spec-driven.js verify <name>` MUST check that `proposal.md`, `design.md`, `tasks.md`,
and `questions.md` exist and are non-empty, and that `specs/` directory exists.
Output is always `{ valid, warnings[], errors[] }` and exits 0.
`valid` is false only when `errors` is non-empty.

`spec-driven.js verify <name>` MUST check that `proposal.md`, `design.md`, `tasks.md`,
and `questions.md` exist and are non-empty, and that `specs/` directory exists.
Output is always `{ valid, warnings[], errors[] }` and exits 0.
`valid` is false only when `errors` is non-empty.

For `tasks.md`, the command MUST validate testing readiness, not only heading
presence. At minimum, it MUST report an error when:
- `## Testing` is missing
- the `## Testing` section has no checkbox tasks
- the `## Testing` section does not contain a lint or validation task
- the `## Testing` section does not contain a unit test task
- a required testing task is phrased without an explicit runnable command

The validator MAY use heuristic matching for command-like task wording, but it
MUST reject obviously vague entries such as `run tests`, `testing passes`,
`verify tests`, or `lint passes` when they do not name a concrete command.

#### Scenario: testing-section-missing-is-invalid
- GIVEN `tasks.md` has no `## Testing` section
- WHEN `verify` is run
- THEN errors contains a missing testing section message
- AND valid is false

#### Scenario: required-testing-task-missing-is-invalid
- GIVEN `tasks.md` has a `## Testing` section with only one of lint or
  validation coverage and unit test coverage
- WHEN `verify` is run
- THEN errors contains a missing required testing task message
- AND valid is false

#### Scenario: vague-testing-wording-is-invalid
- GIVEN `tasks.md` has a `## Testing` section whose lint or unit test entry does
  not include an explicit runnable command
- WHEN `verify` is run
- THEN errors contains a non-runnable testing task message
- AND valid is false
