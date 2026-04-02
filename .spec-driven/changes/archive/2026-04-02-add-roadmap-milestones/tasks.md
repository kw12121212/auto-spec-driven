# Tasks: add-roadmap-milestones

## Implementation

- [x] Add roadmap delta specs covering persistent roadmap assets, milestone
      structure, roadmap skill behaviors, and archive-derived completion rules
- [x] Extend script and workflow specs so `init` scaffolds roadmap assets and
      roadmap skills are treated as planning-only
- [x] Update `scripts/spec-driven.ts` and `template/` to create
      `.spec-driven/roadmap/INDEX.md` plus `roadmap/milestones/`
- [x] Add `spec-driven-roadmap-plan`, `spec-driven-roadmap-milestone`, and
      `spec-driven-roadmap-sync` under `skills/`
- [x] Update `install.sh`, README, and any shipped inventory/docs to distribute
      and describe the roadmap layer

## Testing

- [x] `npm run build` passes after script changes
- [x] `bash test/run.sh` passes
- [x] Verify `init` creates missing roadmap scaffold without overwriting
      existing roadmap files
- [x] Verify roadmap sync behavior derives milestone completion from archive
      state rather than manual flags

## Verification

- [x] Run `node dist/scripts/spec-driven.js verify add-roadmap-milestones`
- [x] Confirm README, installer inventory, template assets, and shipped skills
      reflect the same roadmap model and names
