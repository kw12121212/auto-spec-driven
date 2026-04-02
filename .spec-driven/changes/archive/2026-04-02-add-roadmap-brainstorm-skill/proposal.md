# add-roadmap-brainstorm-skill

## What

- Add a dedicated `roadmap-brainstorm` skill that reads roadmap context and
  recommends a candidate change for the user to accept or modify.
- Update roadmap docs, installer behavior, and skill specs so roadmap users have
  an explicit pre-proposal recommendation step.

## Why

- Users may want guidance on which roadmap item should become the next change
  before they commit to creating a scaffold.
- The roadmap workflow benefits from a lightweight recommendation step that does
  not create artifacts until the user accepts or edits the proposed change.

## Scope

- In scope:
  - add a new bundled `roadmap-brainstorm` skill
  - recommend a single change candidate from roadmap context
  - require explicit user confirmation or modification before handoff to
    `roadmap-propose`
  - update docs, install list, specs, and tests
- Out of scope:
  - automatically scaffolding the change during brainstorming
  - implementing product code
  - automatically rewriting roadmap files while recommending a change

## Unchanged Behavior

Behaviors that must not change as a result of this change (leave blank if nothing is at risk):
- roadmap assets remain separate from change artifacts until the user confirms a handoff
- `roadmap-propose` remains the skill that actually scaffolds the change
- `spec-driven-brainstorm` remains available for non-roadmap idea exploration
