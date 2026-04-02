# Design: add-roadmap-propose-skill

## Approach

- Add a new skill directory `skills/roadmap-propose/` with the same script link
  pattern as the other skills.
- Make the skill read roadmap context, require the selected work item to already
  live under a milestone `Planned Changes` section, and then scaffold the change
  via `node {{SKILL_DIR}}/scripts/spec-driven.js propose <name>`.
- Reuse the same proposal artifact expectations as `spec-driven-propose`, but
  frame them as a roadmap-to-change handoff.

## Key Decisions

- Use a dedicated roadmap-prefixed skill instead of overloading `roadmap-milestone`
  or `roadmap-sync` because the user wants an explicit handoff step.
- Keep the underlying CLI unchanged and implement the behavior in skill space,
  because the mechanical scaffold already exists in `spec-driven.js propose`.
- Restrict the skill to `Planned Changes` so candidate ideas do not silently
  become executable change scaffolds.

## Alternatives Considered

- Tell users to manually run `/spec-driven-propose`. Rejected because it leaves a
  gap in the roadmap workflow and hides the intended handoff.
- Extend `roadmap-milestone` to also scaffold changes. Rejected because it mixes
  roadmap editing with change creation in one skill.
