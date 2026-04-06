# Design: enforce-testing-tasks-in-proposals

## Approach

Update the workflow at two layers.

First, tighten the planning specs that govern proposal-producing skills so they
all generate the same minimum `## Testing` content: one lint or validation task
and one unit test task, each written as a runnable command when the command can
be derived from repository context.

Second, tighten the CLI validation contract so `verify` does not stop at the
presence of a `## Testing` heading. It should reject proposal artifacts whose
testing section is missing, lacks either required test category, or uses vague
task wording without an executable command.

## Key Decisions

- Enforce the rule in both skill prompts and script validation.
  Prompt-only guidance would still allow invalid artifacts through, while
  validation-only changes would keep generation noisy and repetitive.

- Keep the minimum testing bar at lint or validation plus unit tests.
  This preserves a baseline quality gate even in repositories that do not have a
  dedicated lint script, without overfitting every project to integration or
  e2e requirements.

- Require explicit commands in testing tasks.
  Runnable commands make proposal tasks directly actionable during
  `/spec-driven-apply` and reduce ambiguous wording such as "run tests".

- Record unknown commands in `questions.md` rather than guessing.
  Planning skills should not invent repository commands that are not supported
  by project context.

## Alternatives Considered

- Only updating skill prompts.
  Rejected because hand-written or modified proposals could still bypass the
  testing standard without any blocking validation.

- Only updating CLI verify behavior.
  Rejected because proposal-generation quality would remain inconsistent across
  `spec-driven-brainstorm`, `roadmap-propose`, and `roadmap-recommend`.

- Requiring additional mandatory test categories such as integration or e2e.
  Rejected for now because the immediate problem is missing baseline testing
  discipline, not project-specific higher-level coverage policy.
