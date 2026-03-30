# add-scheduled-maintenance-workflow

## What

Add a scheduled maintenance workflow that runs locally from `cron`,
periodically checks repository health, creates a dedicated maintenance change for
safe auto-fixable failures, runs that change through an automated spec-driven
execution flow on its own branch, and archives the completed change locally.

Add a scriptable installer command that generates and installs the local cron
entry and managed helper assets required to enable this maintenance flow in a
target repository.

## Why

Repositories often accumulate failing lint, test, or typecheck results that are
not caused by the current feature change. Those failures create drag during normal
development, but they also do not belong inside unrelated product changes.

This project currently supports interactive spec-driven execution and review, but
it does not define a periodic local maintenance path that can detect existing
failures, repair the subset that is safe to repair mechanically, and route those
repairs through an auditable spec-driven change workflow without depending on a
hosted CI platform.

## Scope

In scope:
- A local cron-based scheduled maintenance workflow
- Periodic execution that runs repository-defined maintenance checks
- Detection of failures that can be safely auto-fixed without guessing product
  behavior
- Creation of a separate maintenance change rather than modifying an unrelated
  active change
- Automatic branch creation/switching for the maintenance run
- Automatic archive after the maintenance change completes successfully
- Duplicate-run protection: skip when an equivalent active maintenance change
  already exists
- No-op runs when checks are already clean or nothing is safely fixable
- A generator/installer command that writes the managed cron entry and any helper
  assets needed to enable the scheduled maintenance flow
- A default daily cron schedule that the user can later adjust

Out of scope:
- Hosted CI schedulers or PR automation providers
- Automatic repair of semantically ambiguous test failures
- Reusing the current business change for unrelated maintenance fixes
- Overwriting unmanaged user-authored cron entries or helper files without an
  explicit managed-asset contract

## Unchanged Behavior

Behaviors that must not change as a result of this change (leave blank if nothing is at risk):
- The existing interactive `spec-driven-auto` workflow keeps its current
  confirmation and blocker semantics for normal user-invoked changes
- Regular `spec-driven-apply`, `verify`, `review`, and `archive` flows for
  user-created changes remain unchanged
- The maintenance workflow still does not guess at ambiguous product behavior
