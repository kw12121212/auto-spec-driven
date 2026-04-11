---
mapping:
  implementation:
    - skills/spec-driven-maintenance/SKILL.md
    - scripts/spec-driven.ts
  tests:
    - test/run.js
    - test/validate-skills.ts
---

# Skills Maintenance

### Requirement: manual-maintenance-uses-configured-checks
The manual maintenance workflow MUST load repository-defined maintenance checks
and allowed auto-fix commands before it starts. It MUST only run checks and
fixes that the repository has explicitly configured.

### Requirement: manual-maintenance-skips-when-maintenance-work-is-active
If an equivalent maintenance change is already active, the manual maintenance
workflow MUST exit without creating another change or branch.

#### Scenario: duplicate-maintenance-work-is-open
- GIVEN a previous manual maintenance run already has an active maintenance change
- WHEN the next manual maintenance run starts
- THEN the run exits without creating a duplicate maintenance branch or change

### Requirement: manual-maintenance-creates-separate-change-for-safe-repairs
When configured checks fail in ways that can be safely auto-fixed, the manual
maintenance workflow MUST create a new maintenance change and perform the repair
work on a dedicated maintenance branch. It MUST NOT attach unrelated maintenance
fixes to an existing user-driven change.

### Requirement: manual-maintenance-skips-dirty-repositories
If the repository has uncommitted changes when the manual maintenance workflow
starts, it MUST exit without creating a maintenance change or branch.

### Requirement: manual-maintenance-noops-when-clean-or-unfixable
If the configured checks already pass, or if failures are detected but none can be
safely auto-fixed, the manual maintenance workflow MUST finish without creating a
maintenance change. When failures are unfixable, it MUST report that outcome in
the workflow result.

#### Scenario: repository-is-clean
- GIVEN all configured maintenance checks pass
- WHEN the manual maintenance workflow runs
- THEN it completes without creating a maintenance change or branch

### Requirement: manual-maintenance-archives-on-success
When a manual maintenance change completes successfully, the workflow MUST
archive the maintenance change automatically before it exits successfully.

### Requirement: manual-maintenance-commits-on-maintenance-branch
After a successful maintenance run archives its change, the workflow MUST commit
the maintenance result on the dedicated maintenance branch. If it knows the
original branch, it MUST switch back to that branch after the maintenance commit
is created.

### Requirement: manual-maintenance-does-not-require-scheduler
The manual maintenance workflow MUST NOT require GitHub pull request creation,
hosted CI scheduling, or a local background scheduler in order to run.

### Requirement: manual-maintenance-reports-unfixable-failures-without-guessing
When configured checks fail but the workflow cannot safely determine a repair, it
MUST stop short of speculative code changes and surface the failed checks in the
workflow result for human follow-up.

### Requirement: manual-maintenance-reports-blocked-runs
If a configured fix command, archive step, commit step, or branch-restore step
fails after the maintenance branch has been created, the workflow MUST report a
blocked result instead of pretending the maintenance run completed successfully.
