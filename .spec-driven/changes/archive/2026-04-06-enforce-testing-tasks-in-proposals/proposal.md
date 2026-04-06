# enforce-testing-tasks-in-proposals

## What

This change tightens proposal-stage testing requirements so generated
`tasks.md` files include a concrete `## Testing` section with explicit lint or
validation tasks plus explicit unit test tasks.

It also strengthens proposal validation so changes that omit those minimum test
tasks, or describe them without runnable commands, are treated as invalid
proposal artifacts rather than merely advisory warnings.

## Why

Planning artifacts currently require a `## Testing` section, but the rules are
not enforced consistently across planning skills and the CLI validator only
checks for the section heading.

That allows proposals to pass with vague or underspecified testing tasks, which
weakens execution quality and makes `/spec-driven-apply` less reliable.

## Scope

In scope:
- update planning requirements so proposal-producing skills require concrete
  lint or validation tasks plus unit test tasks in `tasks.md`
- require those testing tasks to include explicit runnable commands when the
  project context makes the commands knowable
- require planning skills to record unknown commands in `questions.md` instead
  of guessing
- update CLI verify behavior so missing or underspecified testing tasks are
  reported as blocking errors

Out of scope:
- adding new mandatory integration, e2e, or performance test categories
- changing implementation-stage behavior outside the testing-readiness checks
- changing product code outside the spec-driven workflow itself

## Unchanged Behavior

Behaviors that must not change as a result of this change (leave blank if nothing is at risk):

- Proposal artifacts still consist of `proposal.md`, `design.md`, `tasks.md`,
  `questions.md`, and delta specs under `specs/`
- Proposal skills remain planning-only and must not implement product code
- Changes may still leave delta specs empty when there is truly no observable
  spec impact
