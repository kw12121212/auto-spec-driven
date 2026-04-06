# Delta: Skills Planning

## MODIFIED Requirements

### Requirement: propose-scaffolds-five-artifacts
Previously: `spec-driven-propose` MUST scaffold a new change with `proposal.md`, `specs/`,
`design.md`, `tasks.md`, and `questions.md`, populated from project context.
It MUST NOT modify implementation code while proposing.

`spec-driven-propose` MUST scaffold a new change with `proposal.md`, `specs/`,
`design.md`, `tasks.md`, and `questions.md`, populated from project context.
It MUST NOT modify implementation code while proposing.

When it writes `tasks.md`, it MUST include a `## Testing` section with at least:
- one lint or validation task written as an explicit runnable command when the repository
  command is knowable from project context
- one unit test task written as an explicit runnable command when the repository
  command is knowable from project context

If the relevant command cannot be determined confidently from repository
context, `spec-driven-propose` MUST record that ambiguity in `questions.md`
instead of guessing.

### Requirement: brainstorm-produces-the-same-proposal-artifacts
Previously: After confirmation, `spec-driven-brainstorm` MUST generate the same five planning
artifacts as `spec-driven-propose`, follow the same delta-spec formatting rules,
record unresolved ambiguity in `questions.md`, and run `verify` before presenting
the proposal as ready.

After confirmation, `spec-driven-brainstorm` MUST generate the same five planning
artifacts as `spec-driven-propose`, follow the same delta-spec formatting rules,
record unresolved ambiguity in `questions.md`, and run `verify` before presenting
the proposal as ready.

Its `tasks.md` output MUST follow the same testing minimum as
`spec-driven-propose`: a `## Testing` section with explicit lint or validation
and unit test tasks written as runnable commands when those commands are
knowable from project context.

### Requirement: roadmap-propose-creates-standard-change-artifacts
Previously: `roadmap-propose` MUST create the same five artifacts as
`spec-driven-propose`: `proposal.md`, `specs/`, `design.md`, `tasks.md`, and
`questions.md`. It MUST NOT implement product code while doing so.

`roadmap-propose` MUST create the same five artifacts as
`spec-driven-propose`: `proposal.md`, `specs/`, `design.md`, `tasks.md`, and
`questions.md`. It MUST NOT implement product code while doing so.

Its `tasks.md` output MUST include a `## Testing` section with at least one
explicit lint or validation command task and one explicit unit test command
task when the commands are knowable from repository context.

If roadmap and repository context do not make the commands clear,
`roadmap-propose` MUST add an open question instead of inventing commands.

### Requirement: roadmap-recommend-produces-standard-change-artifacts
Previously: After confirmation, `roadmap-recommend` MUST create the same five artifacts as
`spec-driven-propose`: `proposal.md`, `specs/`, `design.md`, `tasks.md`, and
`questions.md`. It MUST follow the same validation standard as
`roadmap-propose` and MUST NOT implement product code while doing so.

After confirmation, `roadmap-recommend` MUST create the same five artifacts as
`spec-driven-propose`: `proposal.md`, `specs/`, `design.md`, `tasks.md`, and
`questions.md`. It MUST follow the same validation standard as
`roadmap-propose` and MUST NOT implement product code while doing so.

Its `tasks.md` output MUST include a `## Testing` section with at least one
explicit lint or validation command task and one explicit unit test command
task when the commands are knowable from repository context.

If roadmap and repository context do not make the commands clear,
`roadmap-recommend` MUST add an open question instead of inventing commands.
