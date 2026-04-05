# define-planned-change-status-format

## What

Add a fixed, machine-validated status field to each roadmap milestone planned
change entry.

This change updates the canonical `## Planned Changes` line format to:
`- \`<change-name>\` - Declared: <status> - <summary>`.

The per-change status enum is intentionally minimal: `planned` or `complete`.
Roadmap authoring and reconciliation behavior will default new entries to
`planned` and update archived changes to `complete`.

## Why

Milestone files already constrain the milestone-level `## Status` section, but
they do not constrain how authors record completion state for individual planned
changes. That gap leaves room for AI or humans to invent ad hoc labels and freeform
formats, which weakens validation and makes roadmap files harder to parse reliably.

Adding one canonical per-change status field keeps the roadmap readable while
removing the ambiguity that currently invites format drift.

## Scope

In scope:
- Update roadmap requirements so each planned change line carries a declared
  per-change status in a fixed format.
- Limit per-change planned change statuses to `planned` and `complete`.
- Define that new planned change entries default to `planned`.
- Define that archived changes are reconciled to `complete` by roadmap-aware
  tooling.
- Update roadmap planning skill requirements so roadmap authoring tools write the
  canonical format and roadmap handoff tools resolve changes by name while
  ignoring the declared status and summary text.
- Update script requirements so `verify-roadmap` validates the new line shape,
  `roadmap-status` reports declared versus derived per-change status, and
  `archive` reconciles listed archived changes to `complete`.

Out of scope:
- Add more per-change states such as `active` or `blocked`.
- Redesign milestone-level `## Status` semantics.
- Change the normal proposal artifact format under `.spec-driven/changes/`.

## Unchanged Behavior

Behaviors that must not change as a result of this change (leave blank if nothing is at risk):
- Planned changes remain single-line top-level bullets under `## Planned Changes`.
- Planned change names remain kebab-case identifiers resolved from the
  ``<change-name>`` portion of the bullet.
- Milestone completion remains derived from archived planned changes rather than
  from freeform prose in roadmap files.
