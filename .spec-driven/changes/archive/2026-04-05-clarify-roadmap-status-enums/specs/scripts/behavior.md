## MODIFIED Requirements

### Requirement: verify-roadmap-enforces-standard-milestone-sections
For each roadmap milestone file, `verify-roadmap` MUST require the standard
sections needed for scriptable roadmap validation:
- `## Goal`
- `## In Scope`
- `## Out of Scope`
- `## Done Criteria`
- `## Planned Changes`
- `## Dependencies`
- `## Risks`
- `## Status`
- `## Notes`

If a required section is missing, the command MUST report an error for that
milestone.

`verify-roadmap` MUST also require the `## Status` section to contain exactly
one bullet in the form `- Declared: <status>`, where `<status>` is one of:
- `proposed`
- `active`
- `blocked`
- `complete`

The command's structured JSON output MUST include the allowed milestone declared
status enum so AI consumers can see the legal values directly from the
validation result.

If the status bullet is missing, repeated, malformed, or uses an unsupported
status value, the command MUST report the milestone as invalid.
When the failure is caused by an unsupported status value, the error MUST list
the allowed milestone declared status values directly.

### Requirement: verify-roadmap-validates-planned-change-entry-format
For each bullet under `## Planned Changes`, `verify-roadmap` MUST require the
canonical entry format
`- \`<change-name>\` - Declared: <status> - <summary>`.

`<change-name>` MUST match the change naming rule
`^[a-z0-9]+(-[a-z0-9]+)*$`. `<status>` MUST be either `planned` or `complete`.
`<summary>` MUST be present, non-empty, and fully contained on the same line as
the planned change bullet.

The command's structured JSON output MUST include the allowed planned change
declared status enum so AI consumers can see the legal values directly from the
validation result.

If a planned change bullet omits the declared status, uses an unsupported status
value, omits the summary, uses a malformed change name, does not follow the
canonical format, or is followed by attached indented continuation lines, the
command MUST report the milestone as invalid.

When the failure is caused by an unsupported planned change status value, the
error MUST list the allowed planned change declared status values directly.
