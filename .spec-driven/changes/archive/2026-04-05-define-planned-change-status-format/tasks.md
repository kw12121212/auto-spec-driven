# Tasks: define-planned-change-status-format

## Implementation

- [x] Update roadmap specs to require the canonical planned change format `- \`<change-name>\` - Declared: <status> - <summary>` and limit declared per-change statuses to `planned` or `complete`.
- [x] Update planning skill specs so roadmap authoring and handoff skills read and write the canonical planned change status format, with new entries defaulting to `planned`.
- [x] Update script behavior specs so `verify-roadmap`, `roadmap-status`, and `archive` validate, report, and reconcile per-change declared statuses.

## Testing

- [x] Add or update automated coverage for planned change status validation and per-change status reconciliation.
- [x] Run the relevant roadmap validation and status commands against milestone fixtures that use the new planned change status format.

## Verification

- [x] Verify the proposal artifacts describe only observable roadmap behavior changes and leave no open questions.
- [x] Verify `node dist/scripts/spec-driven.js verify define-planned-change-status-format` passes.
