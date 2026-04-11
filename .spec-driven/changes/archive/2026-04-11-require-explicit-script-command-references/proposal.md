# require-explicit-script-command-references

## What

Require spec-driven skills to name the exact repository CLI command whenever
they instruct the agent to run a validator or audit step, instead of relying on
generic phrases like "the CLI validator" or "the audit command."

## Why

Some skills currently mention follow-up validator or audit steps without always
restating the concrete script command. That makes the workflow easier for humans
to infer, but less reliable for agents and runtimes that need an explicit
command reference at the point of use.

## Scope

In scope:
- add a workflow requirement that skills must name concrete script commands when
  they direct the agent to run repository CLI actions
- update affected skill prompts to replace generic validator/audit references
  with explicit `node {{SKILL_DIR}}/scripts/spec-driven.js ...` commands
- add validation coverage for this prompt rule where practical

Out of scope:
- changing CLI behavior
- changing install behavior
- changing the semantics of verify, review, or resync workflows

## Unchanged Behavior

Behaviors that must not change as a result of this change (leave blank if nothing is at risk):

- Skills continue to call the same CLI subcommands and follow the same workflow
  gates; this change only makes those command references explicit.
