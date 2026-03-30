# Questions: add-scheduled-maintenance-workflow

## Open

<!-- No open questions -->

## Resolved

- [x] Q: Should scheduled maintenance run only from GitHub Actions and create PRs there?
  Context: This decides the execution environment, installation surface, and
  whether the workflow depends on hosted CI automation.
  A: No. Scheduled maintenance should run locally from cron, and the installer
  should install the cron scheduling entry locally instead of generating GitHub
  Actions assets.
