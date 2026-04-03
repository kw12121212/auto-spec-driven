# Tasks: refine-milestone-format

## Implementation

- [x] Update roadmap delta specs to require the refined milestone sections and planned-change entry format
- [x] Update script behavior delta specs so `verify-roadmap` and `roadmap-status` validate and parse the refined milestone format
- [x] Update roadmap template/example files in this repository to use the new milestone structure
- [x] Extend planned change entries to allow optional indented detail lines beneath the canonical first line

## Testing

- [x] Add or update automated coverage for milestone validation and planned change parsing using the refined format
- [x] `npm run build` passes after any script changes
- [x] `bash test/run.sh` passes after any script or template changes
- [x] Add or update automated coverage for multiline planned change details

## Verification

- [x] Run `node dist/scripts/spec-driven.js verify refine-milestone-format`
- [x] Run `node dist/scripts/spec-driven.js verify-roadmap <temp-dir>` against a milestone using the new section layout and planned-change entry shape
- [x] Re-run `node dist/scripts/spec-driven.js verify-roadmap <temp-dir>` against a milestone that includes indented planned change detail lines
