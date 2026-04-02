# Design: add-roadmap-status-command

## Approach

- Add a `roadmap-status` subcommand to `scripts/spec-driven.ts`.
- Reuse the existing roadmap section parser to read milestone files and extract
  `Goal`, `Planned Changes`, and declared `Status`.
- Compare each planned change name against active changes and archived changes,
  then emit JSON with milestone summaries, per-change states, and mismatch
  messages.
- Keep the command read-only so it is safe to run before the AI skill decides
  what roadmap edits to make.

## Key Decisions

- Start with a dry-run style reporting command instead of an auto-write sync
  command. This keeps the first version deterministic and low-risk.
- Treat archived changes as the source of truth for completion and active changes
  as the source of truth for in-progress work.
- Report both declared roadmap status and derived status so `roadmap-sync` can
  correct stale roadmap text without the script editing prose directly.

## Alternatives Considered

- Add a full `sync-roadmap` write command immediately. Rejected because status
  comparison is deterministic, but file rewriting still contains user-facing
  prose decisions.
- Leave roadmap-sync fully AI-driven. Rejected because the status comparison is
  mechanical and should not depend on model reasoning alone.
