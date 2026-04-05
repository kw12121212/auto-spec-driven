# Design: define-planned-change-status-format

## Approach

Extend the existing single-line planned change bullet instead of introducing a
new milestone subsection or a separate status table.

The proposal keeps the roadmap work list compact by inserting a fixed declared
status field directly into the existing bullet format:
`- \`<change-name>\` - Declared: <status> - <summary>`.

Roadmap validation and status reporting can then parse one canonical line shape,
derive actual completion from repository evidence, and detect stale declared
status values without relying on freeform text.

## Key Decisions

- Keep the format inline. A single canonical bullet is the smallest change to the
  roadmap structure and is easy for both humans and scripts to scan.
- Use only `planned` and `complete`. The user goal is format restriction, not a
  richer workflow state machine, so a two-value enum leaves less room for AI
  improvisation.
- Keep repository evidence authoritative. A planned change should only be
  derived as `complete` when it is archived; all other repository states still
  derive to `planned`, even if the milestone file says otherwise.
- Allow roadmap-aware tooling to reconcile stale declared values automatically so
  milestone files do not depend on manual cleanup after archive operations.

## Alternatives Considered

- Add a separate planned change status section keyed by change name. Rejected
  because it duplicates identifiers, creates more room for drift, and is harder
  to validate consistently.
- Support additional per-change statuses such as `active` or `blocked`.
  Rejected because the immediate problem is unconstrained formatting, and extra
  states add complexity without solving that core issue.
- Leave status wording freeform and rely on prompt instructions. Rejected
  because the repository already uses specs and validation to constrain roadmap
  structure; per-change status should follow the same model.
