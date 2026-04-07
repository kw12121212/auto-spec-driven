## MODIFIED Requirements

### Requirement: sync-specs-edits-specs-directly
`spec-driven-sync-specs` MUST directly edit `.spec-driven/specs/` files to
synchronize them with existing repository behavior. It MUST NOT create a
spec-driven change or use the change lifecycle. It MUST report detected drift
in chat, get user confirmation, then edit spec files and refresh
`.spec-driven/specs/INDEX.md`.

#### Scenario: sync-specs-detects-and-fixes-drift
- GIVEN a spec file under `.spec-driven/specs/` is outdated relative to current
  code behavior
- WHEN `spec-driven-sync-specs` is run
- THEN it reports the drift in chat
- AND after user confirmation, directly edits the spec file
- AND runs `init` to refresh INDEX.md
