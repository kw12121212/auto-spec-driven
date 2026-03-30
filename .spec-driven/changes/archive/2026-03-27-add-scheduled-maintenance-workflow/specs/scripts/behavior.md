# Delta: Scripts Behavior

## ADDED Requirements

### Requirement: install-maintenance-scaffolds-local-cron-assets
`spec-driven.js install-maintenance [path]` MUST create or update the managed
cron assets needed to enable scheduled maintenance in the target repository. The
generated assets MUST include a managed local cron installation for the
maintenance flow.

### Requirement: run-maintenance-executes-local-maintenance-flow
`spec-driven.js run-maintenance [path]` MUST execute the configured local
maintenance flow for the target repository. It MUST report whether the run was
clean, skipped, unfixable, blocked, or repaired.

### Requirement: install-maintenance-protects-unmanaged-files
If the target repository already contains a conflicting managed helper asset or a
conflicting cron entry that is not marked as managed by auto-spec-driven,
`install-maintenance` MUST exit with an error instead of overwriting it.

#### Scenario: unmanaged-cron-conflict
- GIVEN the target repository already has a conflicting helper file or cron entry
  that is not managed by auto-spec-driven
- WHEN `install-maintenance` is run
- THEN the command exits with an error and leaves the existing file unchanged

### Requirement: install-maintenance-seeds-maintenance-cron-defaults
When scheduled maintenance configuration required by the generated cron workflow is
missing, `install-maintenance` MUST create or update the managed project assets so
the repository has a default daily maintenance schedule that the user can review
and adjust.

### Requirement: install-maintenance-preserves-managed-config
When the target repository already has a managed maintenance config file,
`install-maintenance` MUST preserve user-edited schedule and check values while
filling in any missing managed defaults.
