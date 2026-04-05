# clarify-roadmap-status-enums

## What

Clarify roadmap status enums in the planning workflow and validation output.

This change updates the roadmap-related planning specs so roadmap skills state
the legal milestone and planned change statuses directly in their instructions.
It also updates roadmap validation expectations so `verify-roadmap` returns the
supported status enums in structured output and includes those allowed values in
unsupported-status errors.

## Why

Roadmap status rules already exist in the main specs, but today an AI often has
to infer them by reading multiple spec files or by reverse-engineering a terse
validation failure. That makes early roadmap authoring less reliable and slows
down correction when a milestone or planned change uses an invalid status.

Making the enums explicit in the roadmap skill instructions gives the AI the
legal values before it writes milestone content. Making `verify-roadmap` report
the same enums in both JSON and error text gives the AI and the user a direct
repair path after validation.

## Scope

In scope:
- Update roadmap skill expectations so `roadmap-plan`, `roadmap-milestone`,
  `roadmap-sync`, `roadmap-propose`, and `roadmap-recommend` explicitly state
  the legal milestone status enum: `proposed`, `active`, `blocked`, `complete`
- Update roadmap skill expectations so the same skills explicitly state the
  legal planned change status enum: `planned`, `complete`
- Update `verify-roadmap` expectations so the command returns the allowed
  milestone and planned change status enums in structured JSON output
- Update `verify-roadmap` expectations so unsupported-status errors include the
  allowed values directly in the message

Out of scope:
- Adding new milestone or planned change status values
- Changing how derived roadmap status is computed
- Changing archive, sync, or propose workflow semantics beyond clearer status
  guidance and validation output

## Unchanged Behavior

Behaviors that must not change as a result of this change (leave blank if nothing is at risk):
- Milestone declared statuses remain limited to `proposed`, `active`,
  `blocked`, and `complete`
- Planned change declared statuses remain limited to `planned` and `complete`
- Roadmap skills remain planning-only workflows and do not implement product
  code
- `verify-roadmap` continues to validate the canonical milestone structure and
  fail invalid status values
