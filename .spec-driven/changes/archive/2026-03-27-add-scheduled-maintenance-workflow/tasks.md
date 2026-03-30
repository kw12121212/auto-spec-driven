# Tasks: add-scheduled-maintenance-workflow

## Implementation

- [x] Define the scheduled maintenance workflow behavior in specs, including
  local cron execution, duplicate-run skipping, separate maintenance changes,
  archive behavior, and no-op/unfixable-failure outcomes
- [x] Add the maintenance automation skill/workflow and supporting repository
  configuration needed to run scheduled checks and safe auto-fixes noninteractively
- [x] Add a CLI installer/generator command that writes the managed local cron
  entry and helper assets for scheduled maintenance into a target repository
- [x] Document setup requirements, cron installation/update behavior, and
  managed-asset ownership/conflict behavior

## Testing

- [x] Add tests for the installer command covering workflow generation, managed
  cron conflicts, and any seeded configuration or helper assets
- [x] Add tests for scheduled maintenance behavior covering clean no-op runs,
  duplicate-run skipping, creation of a maintenance change, archive on success,
  and reporting of unfixable failures
- [x] Run `npm run build`
- [x] Run `bash test/run.sh`

## Verification

- [x] Verify the generated installer only targets local cron and does not depend
  on GitHub Actions
- [x] Verify maintenance repairs are isolated into a separate change and do not
  modify unrelated active changes
- [x] Verify successful maintenance runs archive automatically after completion
