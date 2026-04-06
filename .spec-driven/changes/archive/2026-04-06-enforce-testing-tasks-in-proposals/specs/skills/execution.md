# Delta: Skills Execution

## MODIFIED Requirements

### Requirement: verify-checks-artifact-and-testing-readiness
Previously: `spec-driven-verify` MUST run the CLI `verify` check, report artifact format problems,
and promote the absence of a `## Testing` section in `tasks.md` to a CRITICAL issue.

`spec-driven-verify` MUST run the CLI `verify` check, report artifact format problems,
and promote testing-readiness problems in `tasks.md` to CRITICAL issues.

At minimum, `spec-driven-verify` MUST treat each of the following as CRITICAL:
- a missing `## Testing` section
- a `## Testing` section that does not contain a lint or validation task
- a `## Testing` section that does not contain a unit test task
- testing tasks that do not identify explicit runnable commands when the command
  is knowable from repository context

When the command is not knowable from repository context,
`spec-driven-verify` MUST expect that ambiguity to be captured as an open or
resolved question rather than silently accepted inside `tasks.md`.
