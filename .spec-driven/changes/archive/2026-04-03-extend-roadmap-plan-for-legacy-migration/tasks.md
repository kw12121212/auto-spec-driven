# Tasks: extend-roadmap-plan-for-legacy-migration

## Implementation

- [x] Update roadmap and planning delta specs so `roadmap-plan` can migrate legacy milestone formats conservatively during roadmap restructuring
- [x] Update `roadmap-plan` to detect old milestone structure, rewrite it into the canonical format, and surface ambiguity instead of guessing silently
- [x] Update `roadmap-milestone` guidance so single-milestone migration can be used as a narrower fallback when needed

## Testing

- [x] Validate updated roadmap skill files remain schema-valid in the test suite
- [x] `npm run build` passes
- [x] `bash test/run.sh` passes

## Verification

- [x] Run `node dist/scripts/spec-driven.js verify extend-roadmap-plan-for-legacy-migration`
- [x] Re-read updated roadmap migration guidance to confirm legacy migration, ambiguity handling, and `verify-roadmap` usage are consistent end to end
