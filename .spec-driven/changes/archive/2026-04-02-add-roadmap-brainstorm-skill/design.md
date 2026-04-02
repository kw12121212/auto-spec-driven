# Design: add-roadmap-brainstorm-skill

## Approach

- Add a new `skills/roadmap-brainstorm/` skill with the standard scripts link.
- Make the skill read `.spec-driven/config.yaml`, roadmap files, roadmap status,
  and active/archive change history before recommending the next change.
- Keep the skill recommendation-only: it should propose a change name, explain
  why it is the best next candidate, and wait for the user to accept or modify
  it before suggesting `roadmap-propose`.

## Key Decisions

- Keep brainstorming separate from scaffolding so the user can adjust the
  recommendation without creating artifacts prematurely.
- Focus the recommendation on roadmap context rather than generic project ideas,
  which keeps the skill distinct from `spec-driven-brainstorm`.
- Allow the skill to recommend from either `Planned Changes` or, if clearly
  justified by user request, candidate roadmap work that still needs promotion,
  but require the user to confirm any adjustment before moving on.

## Alternatives Considered

- Reuse `spec-driven-brainstorm` for this job. Rejected because it is not
  roadmap-specific and does not naturally reason from milestone sequencing.
- Make `roadmap-propose` also choose the next change automatically. Rejected
  because recommending a change and scaffolding it are different decision points.
