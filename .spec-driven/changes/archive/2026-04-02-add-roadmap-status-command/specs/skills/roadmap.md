# Delta: Skills Roadmap

## MODIFIED Requirements

### Requirement: roadmap-sync-reconciles-roadmap-state-with-change-history
`roadmap-sync` MUST use script assistance to reconcile roadmap state before it
edits roadmap files. It MUST read roadmap milestone files together with
`.spec-driven/changes/` and `.spec-driven/changes/archive/`, and it MUST run
`node {{SKILL_DIR}}/scripts/spec-driven.js roadmap-status` to obtain structured
milestone and planned change state before it decides what roadmap updates to
make. It MUST update roadmap status based on repository evidence rather than
preserving stale manual labels.

Previously: This requirement required roadmap-sync to read roadmap milestones,
active changes, and archived changes itself, but did not require script
assistance.
