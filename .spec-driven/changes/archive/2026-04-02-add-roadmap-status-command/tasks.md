# Tasks: add-roadmap-status-command

## Implementation

- [x] Add a `roadmap-status` CLI command that reports milestone and planned change states
- [x] Update roadmap-sync skill text, specs, and docs to use the new command as script assistance
- [x] Add tests that verify roadmap-status output for archived, active, and missing planned changes

## Testing

- [x] Run `npm run build`
- [x] Run `bash test/run.sh`

## Verification

- [x] Run `node dist/scripts/spec-driven.js verify add-roadmap-status-command`
