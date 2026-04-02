## REMOVED Requirements

- `spec-content-classifies-spec-targets-from-index` — removed because `spec-driven-spec-content` skill is deleted; its routing function is covered by `spec-driven-modify` (for delta specs within changes) and `spec-driven-spec-edit` (for main specs directly).
- `spec-content-loads-relevant-main-specs-before-editing` — removed because `spec-driven-spec-content` skill is deleted; `spec-driven-modify` already requires reading main spec context via `modify-loads-main-spec-context-for-spec-edits`.
- `spec-content-validates-and-names-removals` — removed because `spec-driven-spec-content` skill is deleted; `spec-driven-modify` now validates after editing via `modify-validates-after-editing`.

## ADDED Requirements

### Requirement: modify-validates-after-editing
After modifying any change artifact, `spec-driven-modify` MUST run the
workflow verification step via the CLI `verify` command. It MUST fix any
safe-to-repair format issues immediately and rerun `verify`. If a verify
result contains only non-format workflow blockers such as open questions,
the skill MUST surface them separately and MUST NOT misreport them as
spec-format failures. If a request removes spec behavior, the skill MUST
name the exact `### Requirement:` heading or headings being removed and
place them under `## REMOVED Requirements` with a reason; it MUST NOT
describe removals vaguely.
