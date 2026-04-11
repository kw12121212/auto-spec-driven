---
mapping:
  implementation:
    - install.sh
    - scripts/spec-driven.ts
    - skills/spec-driven-remap-specs/SKILL.md
  tests:
    - test/run.js
---

## ADDED Requirements

### Requirement: install-includes-remap-specs-skill
The installer MUST copy the shipped `spec-driven-remap-specs` skill into the
agent store and create the same CLI symlinks for it as for the other bundled
`spec-driven-*` skills.

#### Scenario: remap-specs-skill-installed-for-codex
- GIVEN the installer runs for the Codex CLI target
- WHEN installation completes successfully
- THEN the `spec-driven-remap-specs` skill exists in the agent store
- AND the Codex skills directory links to that installed skill
