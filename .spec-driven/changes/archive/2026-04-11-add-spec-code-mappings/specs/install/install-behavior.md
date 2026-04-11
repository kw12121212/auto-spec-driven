---
mapping:
  implementation:
    - install.sh
    - scripts/spec-driven.ts
    - skills/spec-driven-resync-code-mapping/SKILL.md
  tests:
    - test/run.js
---

## ADDED Requirements

### Requirement: install-includes-resync-code-mapping-skill
The installer MUST copy the shipped `spec-driven-resync-code-mapping` skill into the
agent store and create the same CLI symlinks for it as for the other bundled
`spec-driven-*` skills.

#### Scenario: resync-code-mapping-skill-installed-for-codex
- GIVEN the installer runs for the Codex CLI target
- WHEN installation completes successfully
- THEN the `spec-driven-resync-code-mapping` skill exists in the agent store
- AND the Codex skills directory links to that installed skill
