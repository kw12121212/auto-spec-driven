# specialize-review-checklists

## What

Enhance `spec-driven-review` so it routes review through change-type-specific
checklists for security-sensitive, UI, DX, migration, API, and maintenance
changes while keeping one review skill and the existing MUST FIX / SHOULD FIX /
NITS report format.

## Why

The current review contract checks broad quality categories for every completed
change. That is useful, but different change types carry different risks: a
security-sensitive change needs sharper input-validation and secret-handling
checks, a migration needs rollback and data-safety checks, and a DX change needs
command and documentation usability checks. Adding targeted checklist routing
improves review quality before the roadmap later introduces any ship behavior.

## Scope

In scope:
- Define that `spec-driven-review` identifies relevant change types from the
  proposal, delta specs, tasks, changed files, mappings, and repository context.
- Add review checklist expectations for security-sensitive, UI, DX, migration,
  API, and maintenance changes.
- Allow a change to match multiple checklists when its risk profile spans
  multiple categories.
- Require review findings from specialized checklists to use the existing MUST
  FIX, SHOULD FIX, and NITS severity model.
- Update the review skill prompt and tests so the new checklist routing remains
  schema-valid and covered by repository validation.

Out of scope:
- Splitting `spec-driven-review` into multiple specialized skills.
- Adding commit, push, PR, deployment, release, canary, or ship behavior.
- Changing archive mechanics or roadmap status reconciliation.
- Replacing the existing baseline readability, security, error handling,
  performance, best-practices, test-quality, and mapping review checks.

## Unchanged Behavior

Behaviors that must not change as a result of this change (leave blank if nothing is at risk):
- `spec-driven-review` remains the single review entry point.
- Review still requires completed tasks before it proceeds.
- Review still reads the change artifacts, mapped implementation files, and
  mapped test files before issuing findings.
- MUST FIX findings still block archive.
- SHOULD FIX and NITS keep their current meaning.
- Mapping-quality review remains part of the review contract.
