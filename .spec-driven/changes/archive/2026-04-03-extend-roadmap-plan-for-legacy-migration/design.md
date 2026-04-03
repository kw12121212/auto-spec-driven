# Design: extend-roadmap-plan-for-legacy-migration

## Approach

Update the roadmap skill specs and prompts so `roadmap-plan` explicitly handles
legacy milestone migration as part of roadmap restructuring. The skill should
read existing milestone files, recognize when they use older section shapes such
as `Dependencies / Risks` or lack the newer scope and notes sections, and then
rewrite them into the current canonical structure.

The migration behavior stays conservative:
- keep directly reusable content when a legacy section maps cleanly to the new
  structure
- derive missing sections only when the source milestone makes the meaning clear
- ask the user or flag planning gaps when the old file does not support a
  confident split into `In Scope`, `Out of Scope`, `Dependencies`, `Risks`, or
  richer planned change summaries

`roadmap-milestone` will pick up lighter guidance so a user can migrate one
legacy milestone in isolation, but the main migration flow lives in
`roadmap-plan`.

## Key Decisions

- Keep migration in `roadmap-plan` rather than adding a new migration-only skill.
  The migration work is already a kind of roadmap restructuring.
- Keep migration user-reviewed rather than fully automatic. Legacy milestone
  prose can be ambiguous, so silent conversion would be too risky.
- Treat conservative preservation as more important than filling every section
  aggressively. If a section is unclear, the skill should surface the gap.
- Continue to rely on `verify-roadmap` after rewriting legacy milestones so the
  migrated output always lands in the current canonical format.

## Alternatives Considered

- Add a new `roadmap-migrate` skill. Rejected because it duplicates roadmap
  restructuring behavior that already belongs in `roadmap-plan`.
- Add a CLI migration command. Rejected because the scripts layer should not be
  responsible for guessing semantic roadmap content.
- Force every migration to be fully manual. Rejected because the skill can still
  preserve and transform a large amount of structure safely when guided by the
  existing roadmap context.
