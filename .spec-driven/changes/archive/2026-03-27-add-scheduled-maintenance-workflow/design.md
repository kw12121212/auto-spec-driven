# Design: add-scheduled-maintenance-workflow

## Approach

Introduce a dedicated maintenance automation path instead of stretching the
interactive `spec-driven-auto` contract to cover unattended runs.

The implementation is expected to add:
- A maintenance-oriented skill or workflow entrypoint that can run noninteractively
  on a local machine
- Repository configuration for the checks and auto-fix commands that the
  scheduled run is allowed to execute
- A CLI installer command that writes the managed cron entry and helper assets
  for this maintenance feature into a target repository

At runtime, the scheduled workflow should:
1. Confirm it is running from the supported local scheduled entrypoint or a local
   manual invocation
2. Load repository maintenance configuration and check whether a maintenance run
   is already in flight
3. Run the configured checks and collect failures
4. Exit without creating artifacts when the repository is clean or nothing is
   safely auto-fixable
5. Create a dedicated maintenance change and branch when safe repairs are needed
6. Execute the repair flow end-to-end, including verification and archive
7. Stop with a report instead of guessing when failures are not safely repairable

## Key Decisions

- Keep scheduled maintenance separate from normal feature changes so unrelated
  repository cleanup does not leak into user-driven change scopes
- Support local cron only in the first version to keep the execution environment
  narrow and to avoid coupling the feature to a hosted CI provider
- Archive the maintenance change as part of a successful unattended local run so
  the repository state and spec history remain synchronized
- Skip runs when an equivalent maintenance change or PR already exists to avoid
  stacking duplicate repair branches
- Treat workflow installation as a managed asset generation problem handled by a
  dedicated CLI command rather than by `install.sh`, which is focused on skill
  distribution
- Keep auto-fix scope limited to deterministic repairs; ambiguous failures are
  reported and left for humans

## Alternatives Considered

1. Extend `spec-driven-auto` directly for unattended scheduled runs
   - Rejected because the current `auto` contract explicitly includes interactive
     checkpoints and blocker confirmations.

2. Fold unrelated lint/test repairs into the current active change
   - Rejected because it mixes maintenance work with user scope and weakens the
     audit trail.

3. Run a hosted CI workflow such as GitHub Actions
   - Rejected for this change because the desired scope is local-only scheduled
     execution managed through cron.

4. Put cron installation into `install.sh`
   - Rejected because the current installer is about local/project skill
     installation, not project-specific maintenance scheduling assets.
