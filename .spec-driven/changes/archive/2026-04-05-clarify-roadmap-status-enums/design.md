# Design: clarify-roadmap-status-enums

## Approach

Update the roadmap-facing specs in two layers.

First, tighten the roadmap skill requirements so the roadmap skills themselves
must present the legal milestone and planned change status enums directly in
their instructions. This makes the legal values part of the first-pass planning
context instead of an implicit rule the AI may only notice later.

Second, tighten the script behavior requirements for `verify-roadmap` so the
command returns the legal enums in machine-readable JSON and repeats them in any
unsupported-status validation error. This lets both skills and users repair
invalid roadmap files without re-reading the main specs first.

## Key Decisions

- Keep the existing enums unchanged. The problem is discoverability, not the
  status model itself.
- Require explicit enum wording across all roadmap skills, not only milestone
  authoring skills, because recommendation, propose, and sync workflows also
  read and interpret roadmap statuses.
- Expose the legal values in both JSON output and human-readable errors so the
  validation result works for automated consumers and direct terminal reading.

## Alternatives Considered

- Only updating skill wording. Rejected because post-write validation would
  still force AI or users to rediscover the legal values from elsewhere.
- Only updating `verify-roadmap` errors. Rejected because the AI would still not
  see the enums early enough during roadmap authoring.
- Adding new helper docs outside the specs. Rejected because the legal values
  are part of workflow behavior and should remain governed by the main specs.
