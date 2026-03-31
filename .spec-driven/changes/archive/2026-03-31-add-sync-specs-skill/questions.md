# Questions: add-sync-specs-skill

## Open

<!-- No open questions -->

## Resolved

- [x] Q: Should the drift report be written to a standalone file such as `report.md`?
  Context: This affects whether the workflow introduces a sixth required artifact.
  A: No. The report should be presented as an in-chat summary only.

- [x] Q: Must the skill scan the whole repository every time, or can it be limited
  to part of the codebase?
  Context: This affects how the skill selects evidence and how broadly it claims
  drift findings.
  A: It must support partial scans for a selected directory, module, or feature
  area.
