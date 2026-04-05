# Questions: define-planned-change-status-format

## Open

<!-- No open questions -->

## Resolved

- [x] Q: Which per-change statuses should roadmap milestone planned changes
  support?
  Context: The format must be constrained enough to prevent AI-generated status
  drift while still showing whether a planned change is unfinished or done.
  A: Support only `planned` and `complete`.

- [x] Q: Should roadmap-aware tooling reconcile per-change declared statuses from
  repository evidence?
  Context: Archived changes should not depend on a manual milestone edit before
  appearing complete in roadmap files.
  A: Yes. Archived changes may be auto-reconciled to `complete`.
