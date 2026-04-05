# Tasks: clarify-roadmap-status-enums

## Implementation

- [x] Update roadmap skill specs so all roadmap skills explicitly list the legal milestone and planned change status enums
- [x] Update script behavior specs so `verify-roadmap` returns allowed status enums in structured JSON output
- [x] Update script behavior specs so unsupported roadmap status errors include the allowed values directly

## Testing

- [x] Run `node dist/scripts/spec-driven.js verify clarify-roadmap-status-enums`
- [x] Confirm validation succeeds without artifact format errors

## Verification

- [x] Confirm the proposal artifacts describe explicit roadmap status guidance and validation output changes only
