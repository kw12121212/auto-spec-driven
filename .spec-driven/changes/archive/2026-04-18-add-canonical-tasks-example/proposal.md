# Proposal: add-canonical-tasks-example

## What

Add a canonical tasks.md example — with annotated verification keyword requirements — to every skill prompt that generates tasks.md, and document the same example in the specs README.

## Why

AI agents frequently generate `## Testing` sections that fail the `verify` script because the task text omits the required keywords (`lint`, `validate`, `validation`, `typecheck`, `type-check`, `build` for lint tasks; `unit test` or `unit tests` for unit test tasks) or lacks explicit runnable commands. The delta spec format solved the same class of problem by embedding canonical copyable examples in skill prompts. Applying the same pattern to tasks.md will let agents produce testing sections that pass verification on the first attempt.

## Scope

- Add a canonical tasks.md sample (with keyword annotations) to the instructions of `spec-driven-propose`, `spec-driven-brainstorm`, `spec-driven-modify`, `roadmap-propose`, and `roadmap-recommend`
- Add a Tasks Format section to `.spec-driven/specs/README.md`
- Add a planning spec requirement that proposal-authoring skills embed canonical tasks examples

## Unchanged Behavior

- The `verify` script's existing validation logic is unchanged
- The delta spec canonical examples are unchanged
- `config.yaml` rules are unchanged
