# Tasks: remove-spec-content-skill

## Implementation

- [x] Delete `skills/spec-driven-spec-content/` directory
- [x] Remove `spec-driven-spec-content` from `install.sh` SKILLS array
- [x] Remove 3 `spec-content-*` requirements from `.spec-driven/specs/skills/planning.md`
- [x] Remove `spec-content` references from `.spec-driven/specs/skills/workflow.md`
- [x] Update `.spec-driven/config.yaml` — remove spec-content from skill list, update count 14→13
- [x] Update `CLAUDE.md` — skill count 16→15, add `spec-edit` to workflow list
- [x] Update `README.md` — replace all `spec-content` references with `modify`/`spec-edit`
- [x] Update `README.zh.md` — replace all `spec-content` references with `modify`/`spec-edit`
- [x] Add verification step to `spec-driven-modify` SKILL.md and add `modify-validates-after-editing` requirement to planning.md
- [x] Update `test/run.sh` — replace `spec-content` install tests with `spec-edit` install tests

## Testing

- [x] Run `bash test/run.sh` to confirm all tests pass

## Verification

- [x] Verify implementation matches proposal scope
