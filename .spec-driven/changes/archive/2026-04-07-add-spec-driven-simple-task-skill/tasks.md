# Tasks: add-spec-driven-simple-task-skill

## Implementation

- [x] Create `skills/spec-driven-simple-task/SKILL.md` with YAML frontmatter and full prompt content implementing the two-phase model (entry gate → execute → assess → log)
- [x] Add spec requirements to `.spec-driven/specs/skills/simple-task.md` by creating the new spec file
- [x] Update `.spec-driven/specs/skills/workflow.md` to add the `simple-task-operates-outside-change-lifecycle` requirement
- [x] Update `.spec-driven/specs/INDEX.md` to include the new `skills/simple-task.md` entry
- [x] Update `CLAUDE.md` skills list and directory structure to reflect the new skill (16th skill)
- [x] Update `install.sh` to include the new skill directory in its copy logic (verify it picks up all `skills/*/SKILL.md`)

## Testing

- [x] Run `npm run build` to confirm TypeScript compilation still passes
- [x] Run `npm test` to confirm all existing unit tests still pass
- [x] Run `node dist/scripts/spec-driven.js verify add-spec-driven-simple-task-skill` to validate the change artifacts

## Verification

- [x] Verify the SKILL.md frontmatter has correct `name` and `description` fields
- [x] Verify the SKILL.md prompt content covers entry gate, two-phase model, spec impact assessment, and logging
- [x] Verify the delta specs follow the standard requirement format with section markers
- [x] Verify `.spec-driven/specs/INDEX.md` lists the new spec file after update
