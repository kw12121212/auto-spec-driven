# Tasks: improve-roadmap-planned-change-handoff

## Implementation

- [x] Update roadmap and planning delta specs so roadmap handoff skills must use multiline planned change details as planning input
- [x] Update `roadmap-propose` so it reads and uses the selected planned change detail block when drafting artifacts
- [x] Update `roadmap-recommend` so recommendation summaries and accepted handoffs use planned change detail blocks
- [x] Update roadmap authoring guidance in `roadmap-plan` and `roadmap-milestone` so complex planned work is encouraged to include useful detail lines

## Testing

- [x] Validate updated skill files remain schema-valid in the test suite
- [x] `npm run build` passes
- [x] `bash test/run.sh` passes

## Verification

- [x] Run `node dist/scripts/spec-driven.js verify improve-roadmap-planned-change-handoff`
- [x] Re-read updated roadmap skill files to confirm the multiline detail handoff guidance is consistent end to end
