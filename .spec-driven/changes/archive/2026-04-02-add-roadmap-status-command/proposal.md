# add-roadmap-status-command

## What

- Add a read-only `roadmap-status` CLI command that compares roadmap milestone
  `Planned Changes` against active and archived changes.
- Update `roadmap-sync` guidance to use the command as structured input before
  the skill decides how to edit roadmap files.

## Why

- `roadmap-sync` currently relies on the AI model to perform all status
  comparison work itself.
- The comparison between milestone planned changes and repository change state is
  deterministic and should be script-assisted so the skill can focus on
  ambiguity handling and documentation updates.

## Scope

- In scope:
  - add a new script command that reports roadmap milestone status as JSON
  - derive per-planned-change state from `.spec-driven/changes/` and
    `.spec-driven/changes/archive/`
  - derive milestone status from those change states and report mismatches
  - update roadmap-sync skill text, docs, specs, and tests
- Out of scope:
  - automatically rewriting milestone files from the script
  - resolving renamed changes automatically
  - promoting `Candidate Ideas` into `Planned Changes`

## Unchanged Behavior

Behaviors that must not change as a result of this change (leave blank if nothing is at risk):
- roadmap files remain documentation owned by skills rather than direct script output
- `verify-roadmap` remains the validation command for milestone shape and size
- ambiguous roadmap cleanup still requires AI judgment or user confirmation
