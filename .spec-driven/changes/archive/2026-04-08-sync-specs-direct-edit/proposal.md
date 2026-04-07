# sync-specs-direct-edit

## What

Rewrite `spec-driven-sync-specs` to directly edit `.spec-driven/specs/` files
instead of creating a spec-driven change. The skill becomes a drift scanner that
detects code-vs-spec gaps and immediately synchronizes the spec files.

## Why

Syncing specs to match existing code is documentation maintenance, not a product
change. Forcing it through the change lifecycle creates unnecessary overhead:
- No `tasks.md` testing requirement applies (no code changes)
- No delta spec review is needed (specs describe existing behavior)
- `propose`/`verify`/`archive` ceremony adds friction for what is essentially
  keeping docs up to date

Git history already tracks what changed in spec files, so no separate audit
trail is needed.

## Scope

- Rewrite `skills/spec-driven-sync-specs/SKILL.md` with a direct-edit workflow:
  scan → report drift → confirm → edit specs → refresh INDEX.md
- Update `.spec-driven/specs/skills/workflow.md` if it references sync-specs
  creating changes

## Unchanged Behavior

Behaviors that must not change as a result of this change (leave blank if nothing is at risk):

- `spec-driven-spec-edit` continues to work as-is (manual single-file editing)
- Other skills and scripts are unaffected
- The sync-specs skill still reads config.yaml, INDEX.md, and relevant specs
  before judging drift — that preparatory step does not change
