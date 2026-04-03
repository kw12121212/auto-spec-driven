# extend-roadmap-plan-for-legacy-migration

## What

Extend `roadmap-plan` so it can restructure old-format roadmap milestones into
the current milestone format while reorganizing roadmap content. The skill will
preserve mechanically recoverable content, infer the new sections when the
source is clear enough, and explicitly surface ambiguity when the old milestone
does not provide enough information to migrate confidently.

## Why

The repository now has a newer milestone format, but older milestone files do
not automatically migrate. Asking maintainers to manually rewrite every legacy
milestone inside a broader roadmap planning session adds friction and invites
inconsistent conversions. `roadmap-plan` is already the skill used to create or
restructure roadmap assets, so it is the right place to fold legacy-format
migration into normal roadmap maintenance without adding a separate migration
command.

## Scope

In scope:
- Define that `roadmap-plan` can detect and migrate legacy milestone structures
  while restructuring a roadmap
- Define how legacy content maps into the current milestone sections when the
  source information is mechanically or semantically recoverable
- Require `roadmap-plan` to preserve original meaning conservatively and surface
  ambiguity instead of silently inventing content
- Update roadmap skill guidance so migration work runs `verify-roadmap` after
  rewriting legacy milestones
- Allow `roadmap-milestone` guidance to acknowledge legacy migration as a
  narrower single-milestone fallback when needed

Out of scope:
- Adding a new CLI command that auto-migrates milestone prose
- Requiring fully automatic migration without user review
- Changing the canonical milestone format again
- Bulk rewriting legacy milestones outside a user-requested planning session

## Unchanged Behavior

Behaviors that must not change as a result of this change (leave blank if nothing is at risk):
- `roadmap-plan` remains a planning/documentation skill and does not implement
  product code
- `verify-roadmap` remains the final validation gate for migrated milestone files
- Milestone completion still derives from archived planned changes
- `roadmap-milestone` remains focused on one milestone at a time even if it can
  be used as a migration fallback
