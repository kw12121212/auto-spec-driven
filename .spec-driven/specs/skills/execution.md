---
mapping:
  implementation:
    - skills/spec-driven-apply/SKILL.md
    - skills/spec-driven-verify/SKILL.md
    - skills/spec-driven-review/SKILL.md
    - skills/spec-driven-auto/SKILL.md
  tests:
    - test/run.js
    - test/validate-skills.ts
---

# Skills Execution

### Requirement: apply-rebuilds-context-from-artifacts-and-specs
`spec-driven-apply` MUST treat the current change artifacts, relevant main specs, and
repository state as authoritative. Before implementation, it MUST load all five
artifacts for the change plus `.spec-driven/config.yaml`, `.spec-driven/specs/INDEX.md`,
and each relevant main spec file.

### Requirement: apply-blocks-on-open-questions-before-implementation
`spec-driven-apply` MUST check `questions.md` for open questions before
implementing. If any open `- [ ] Q:` entries exist, it MUST stop and wait for
explicit user resolution before editing implementation files.

Before it asks the user to resolve those questions, `spec-driven-apply` MUST
present each one in a structured user-facing block with the fields `Question`,
`Explanation`, `Impact`, and `Recommendation`.

`Explanation` MUST clarify why the question remains unresolved after consulting
the current change artifacts, relevant main specs, unchanged-behavior
constraints, task wording, and repository state. `Impact` MUST describe what
implementation choice, task, behavior, or unchanged-behavior guarantee depends
on the answer. `Recommendation` MAY suggest a preferred answer, but it MUST be
presented as a suggestion only.

`spec-driven-apply` MUST NOT treat its own recommendation as the resolved
answer, MUST NOT edit implementation files, and MUST NOT continue task
execution until the user has explicitly resolved every open question in
`questions.md`.

#### Scenario: apply-stops-on-open-question-with-structured-guidance
- GIVEN `questions.md` contains an open implementation question
- WHEN `spec-driven-apply` inspects the change before coding
- THEN it presents `Question`, `Explanation`, `Impact`, and `Recommendation`
  for that unresolved question
- AND it asks the user to resolve the question
- AND it does not edit implementation files or continue to the next task until
  the user explicitly resolves the question

### Requirement: apply-implements-tasks-in-order
`spec-driven-apply` MUST work through incomplete tasks in order, read relevant code
before changing it, verify unchanged behavior constraints, and mark each task complete
immediately after the corresponding work is done.

### Requirement: apply-runs-testing-tasks
When `spec-driven-apply` reaches tasks under `## Testing`, it MUST actually run the
relevant tests and confirm they pass before marking those tasks complete.

### Requirement: apply-syncs-delta-specs-with-implementation
After implementation, `spec-driven-apply` MUST re-read the change delta specs and
update them so they describe what was actually built rather than the original plan.

### Requirement: apply-uses-spec-mappings-as-code-context
`spec-driven-apply` MUST inspect mapping frontmatter from relevant main spec
files and change delta spec files before implementation. It MUST use mapped
implementation and test paths as starting context when deciding which files to
read or modify.

The mappings guide context loading but do not replace repository inspection.
`spec-driven-apply` MUST still read existing code before modifying it.

#### Scenario: apply-loads-mapped-files-before-editing
- GIVEN a relevant spec file maps implementation and test paths
- WHEN `spec-driven-apply` prepares to implement a task for that spec area
- THEN it reads the mapped implementation and test files as part of its initial
  code context

### Requirement: apply-updates-spec-mappings-after-implementation
After implementation, `spec-driven-apply` MUST update the relevant delta spec
mapping frontmatter to reflect the actual implementation and test files changed
or relied on for the completed behavior.

If the implementation changes behavior covered by a spec file but no matching
mapping exists, `spec-driven-apply` MUST add or update the mapping metadata
before verification.

#### Scenario: apply-adds-mapping-for-new-test-coverage
- GIVEN implementation adds a new test file for a changed spec
- WHEN `spec-driven-apply` finishes the implementation task
- THEN the relevant delta spec mapping lists that file under `mapping.tests`

### Requirement: verify-produces-tiered-findings
`spec-driven-verify` MUST output a tiered report using CRITICAL, WARNING, and
SUGGESTION findings. CRITICAL findings block archive.

### Requirement: verify-checks-artifact-and-testing-readiness
`spec-driven-verify` MUST run the CLI `verify` check, report artifact format problems,
and promote testing-readiness problems in `tasks.md` to CRITICAL issues.

At minimum, `spec-driven-verify` MUST treat each of the following as CRITICAL:
- a missing `## Testing` section
- a `## Testing` section that does not contain a lint or validation task
- a `## Testing` section that does not contain a unit test task
- testing tasks that do not identify explicit runnable commands when the command
  is knowable from repository context

When the command is not knowable from repository context,
`spec-driven-verify` MUST expect that ambiguity to be captured as an open or
resolved question rather than silently accepted inside `tasks.md`.

### Requirement: verify-checks-task-completion-and-open-questions
`spec-driven-verify` MUST run the CLI `apply` summary to identify incomplete tasks and
MUST inspect `questions.md` for open questions. Incomplete tasks and open questions are
CRITICAL issues.

### Requirement: verify-checks-implementation-and-spec-alignment
`spec-driven-verify` MUST compare completed tasks, implementation evidence, proposal
scope, unchanged behavior, and delta specs. Empty delta specs alongside real behavior
changes, mismatched spec paths, and non-conforming delta format are CRITICAL issues.

### Requirement: verify-checks-spec-mapping-readiness
`spec-driven-verify` MUST run the CLI spec mapping validation command and report
any malformed mapping frontmatter, missing required mapping fields, or missing
mapped files as CRITICAL findings.

`spec-driven-verify` MUST also compare the mapping metadata against completed
tasks, changed files, proposal scope, and delta specs. If a touched spec file
lacks mappings for the implementation or test files that provide the behavior,
that mismatch is a CRITICAL issue.

To do this consistently, `spec-driven-verify` MUST first build a change-local
mapping evidence set from the completed tasks, implementation files changed for
the change, test files changed for the change, and files explicitly relied on to
provide the completed behavior. It MUST then compare each touched delta spec's
`mapping.implementation` and `mapping.tests` entries against that evidence set,
using the CLI audit command when available.

When evidence clearly shows that a touched spec's completed behavior depends on
an implementation file or directly verifying test file that is missing from the
mapping, `spec-driven-verify` MUST report that omission as CRITICAL. It SHOULD
prefer the smallest confident evidence set and report ambiguity instead of
inventing semantic coverage.

Repo-wide structural mapping errors found outside the change scope MUST still be
reported, but `spec-driven-verify` SHOULD distinguish between change-local
mapping blockers and unrelated pre-existing repository mapping debt.

#### Scenario: verify-blocks-missing-mapped-test
- GIVEN a change adds behavior and tests for a spec file
- AND the relevant mapping omits the test file
- WHEN `spec-driven-verify` checks the change
- THEN it reports the missing mapped test evidence as a CRITICAL issue

#### Scenario: verify-distinguishes-unrelated-repo-mapping-debt
- GIVEN `verify-spec-mappings` finds a malformed mapping in a main spec file not
  touched by the change
- WHEN `spec-driven-verify` reports its findings
- THEN it identifies that problem separately from change-local mapping omissions
- AND it does not describe the unrelated problem as evidence that the current
  change's own mapping is complete or incomplete

### Requirement: review-loads-code-and-spec-context
`spec-driven-review` MUST read the change proposal, delta specs, design, tasks,
questions, config, and every changed file before issuing review findings.

### Requirement: review-focuses-on-code-and-test-quality
`spec-driven-review` MUST evaluate readability, security, error handling, performance,
best practices, and whether tests cover the key scenarios described by the delta specs.

### Requirement: review-uses-mustfix-shouldfix-nits
`spec-driven-review` MUST report findings using MUST FIX, SHOULD FIX, and NITS, and it
MUST treat MUST FIX issues as blockers to archive.

### Requirement: review-loads-mapped-implementation-and-test-files
`spec-driven-review` MUST read mapped implementation and test files for the
relevant spec files before issuing review findings. Review findings SHOULD call
out stale or misleading mappings when they would make future verification or
maintenance unreliable.

`spec-driven-review` SHOULD also perform a lightweight mapping audit for touched
spec files: compare the mapping frontmatter against the change's primary
implementation and directly verifying test files, using the smallest confident
evidence set available from changed files, delta specs, and completed tasks,
using the CLI audit command when available.

If review finds that a mapping would mislead a future maintainer about where the
behavior is implemented or verified, it SHOULD report that as at least a SHOULD
FIX finding, and as MUST FIX when the mismatch would materially undermine later
verification or archive readiness.

#### Scenario: review-flags-stale-mapping
- GIVEN a spec maps a file that no longer contains relevant implementation
  evidence
- WHEN `spec-driven-review` evaluates the change
- THEN it reports the stale mapping as a review finding

#### Scenario: review-flags-misleading-mapped-test-selection
- GIVEN a touched spec maps only an indirect helper test while the change added a
  direct behavior-verifying test file
- WHEN `spec-driven-review` evaluates the change
- THEN it reports the misleading mapped test selection as a review finding
