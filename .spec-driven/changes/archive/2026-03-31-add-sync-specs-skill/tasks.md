# Tasks: add-sync-specs-skill

## Implementation

- [x] Add delta specs describing the new `spec-driven-sync-specs` planning behavior,
  including scoped scans, drift classification, spec-only change creation, and
  in-chat reporting
- [x] Create `skills/spec-driven-sync-specs/SKILL.md` with repository/spec scan
  instructions, scope selection, dedicated change scaffolding, questions
  handling, and final verify/report steps
- [x] Update installer and repository documentation to include the new skill and
  explain when to use it for initialization or post-manual-work spec catch-up

## Testing

- [x] Run `node dist/scripts/spec-driven.js verify add-sync-specs-skill`
- [x] Run an installer smoke check that confirms `spec-driven-sync-specs` is
  installed into a target skill directory

## Verification

- [x] Verify the new skill creates or updates only workflow artifacts, not
  product code, and reports findings in chat without writing a separate report
  file
