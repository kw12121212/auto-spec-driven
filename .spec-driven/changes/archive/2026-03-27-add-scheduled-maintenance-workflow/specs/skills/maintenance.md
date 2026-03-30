# Delta: Skills Maintenance

## ADDED Requirements

### Requirement: scheduled-maintenance-runs-only-from-local-cron
The scheduled maintenance workflow MUST support local execution only. Its managed
scheduled mode MUST run from a locally installed cron entry rather than from a
hosted CI scheduler.

### Requirement: scheduled-maintenance-uses-configured-checks
The scheduled maintenance workflow MUST load repository-defined maintenance checks
and allowed auto-fix commands before it starts. It MUST only run checks and fixes
that the repository has explicitly configured for scheduled maintenance.

### Requirement: scheduled-maintenance-skips-when-maintenance-work-is-active
If an equivalent maintenance change is already active, the scheduled maintenance
workflow MUST exit without creating another change or branch.

#### Scenario: duplicate-maintenance-work-is-open
- GIVEN a previous scheduled maintenance run already has an active maintenance change
- WHEN the next scheduled run starts
- THEN the run exits without creating a duplicate maintenance branch or change

### Requirement: scheduled-maintenance-creates-separate-change-for-safe-repairs
When configured checks fail in ways that can be safely auto-fixed, the scheduled
maintenance workflow MUST create a new maintenance change and perform the repair
work on a dedicated maintenance branch. It MUST NOT attach unrelated maintenance
fixes to an existing user-driven change.

### Requirement: scheduled-maintenance-skips-dirty-repositories
If the repository has uncommitted changes when the scheduled maintenance workflow
starts, it MUST exit without creating a maintenance change or branch.

### Requirement: scheduled-maintenance-noops-when-clean-or-unfixable
If the configured checks already pass, or if failures are detected but none can be
safely auto-fixed, the scheduled maintenance workflow MUST finish without creating
a maintenance change. When failures are unfixable, it MUST report that
outcome in the workflow result.

#### Scenario: repository-is-clean
- GIVEN all configured maintenance checks pass
- WHEN the scheduled maintenance workflow runs
- THEN it completes without creating a maintenance change or branch

### Requirement: scheduled-maintenance-archives-on-success
When a scheduled maintenance change completes successfully, the workflow MUST
archive the maintenance change automatically before it exits successfully.

### Requirement: scheduled-maintenance-commits-on-maintenance-branch
After a successful maintenance run archives its change, the workflow MUST commit
the maintenance result on the dedicated maintenance branch. If it knows the
original branch, it MUST switch back to that branch after the maintenance commit
is created.

### Requirement: scheduled-maintenance-does-not-require-hosted-ci
The scheduled maintenance workflow MUST NOT depend on GitHub pull request
creation or any hosted CI-specific merge mechanism.

### Requirement: scheduled-maintenance-reports-unfixable-failures-without-guessing
When configured checks fail but the workflow cannot safely determine a repair, it
MUST stop short of speculative code changes and surface the failed checks in the
workflow result for human follow-up.

### Requirement: scheduled-maintenance-reports-blocked-runs
If a configured fix command, archive step, commit step, or branch-restore step
fails after the maintenance branch has been created, the workflow MUST report a
blocked result instead of pretending the maintenance run completed successfully.
