# Skills Workflow

### Requirement: planning-skills-do-not-implement-code
`spec-driven-init`, `spec-driven-propose`, `spec-driven-modify`,
`spec-driven-spec-edit`, `spec-driven-sync-specs`, `roadmap-plan`,
`roadmap-milestone`, and `roadmap-sync` MUST stay in the
planning/documentation layer. They
MAY create or edit workflow artifacts under `.spec-driven/`, but they MUST NOT
implement product code changes.

### Requirement: execution-and-lifecycle-skills-follow-artifacts-as-source-of-truth
`spec-driven-apply`, `spec-driven-verify`, `spec-driven-review`, `spec-driven-archive`,
and `spec-driven-auto` MUST treat the current change artifacts, relevant main specs,
and repository state as the source of truth rather than stale chat context.

### Requirement: explicitly-opted-in-skills-retain-parent-workflow-ownership-when-delegating
Spec-driven skills MUST NOT delegate work to a sub-agent unless that skill's
own main spec requirements and concrete skill instructions explicitly allow the
delegation pattern.

When delegation is explicitly allowed, the delegated subtask MUST be concrete,
materially useful, and MUST NOT require the sub-agent to own the workflow state
for the overall skill run.

When delegation is used, the parent agent MUST retain ownership of:
- user-facing confirmation or question-resolution checkpoints
- writes that create, resolve, archive, cancel, or otherwise advance
  `.spec-driven/` workflow state
- the final user-facing recommendation, review, or verification verdict
- the decision to accept, reject, or integrate delegated output

Delegated output MAY inform the skill, but it MUST NOT replace the parent
agent's responsibility to interpret current change artifacts, main specs, and
repository state before taking those workflow actions.

#### Scenario: delegated-analysis-does-not-bypass-parent-workflow-gates
- GIVEN a skill delegates bounded analysis work to a sub-agent
- WHEN the overall workflow reaches a user confirmation or workflow-state
  transition
- THEN the parent agent remains responsible for that interaction or state write
- AND the sub-agent does not complete the transition on its own

### Requirement: questions-control-workflow-transitions
Ambiguities MUST be tracked in `questions.md`, not inline in other artifacts.
Open questions MAY remain at proposal handoff time, but each execution skill
MUST follow its own contract for handling them before the workflow advances.
Any open questions that remain unresolved by the time verification or archive
is attempted are blockers.

### Requirement: task-state-and-spec-state-stay-synchronized
When work is implemented, completed tasks MUST be marked immediately and delta specs
MUST be updated to reflect what was actually built before verification, review, or archive.

### Requirement: archive-preserves-history-after-merge
Archiving MUST merge accepted delta specs into `.spec-driven/specs/` first, then move
the change directory into `changes/archive/` so the full proposal, task history, and
resolved questions remain preserved.

#### Scenario: empty-delta-on-archive
- GIVEN `changes/<name>/specs/` directory is empty
- WHEN archive is run
- THEN the user is asked to confirm no spec impact before proceeding

### Requirement: simple-task-operates-outside-change-lifecycle
`spec-driven-simple-task` operates as an ad-hoc task execution skill outside
the normal change lifecycle. It MAY implement product code changes directly
but MUST NOT create, modify, or archive any entries under
`.spec-driven/changes/`. When its work reveals spec drift or a real change
need, it MUST suggest the appropriate existing skill rather than entering
the change workflow itself.

### Requirement: sync-specs-edits-specs-directly
`spec-driven-sync-specs` MUST directly edit `.spec-driven/specs/` files to
synchronize them with existing repository behavior. It MUST NOT create a
spec-driven change or use the change lifecycle. It MUST report detected drift
in chat, get user confirmation, then edit spec files and refresh
`.spec-driven/specs/INDEX.md`.

#### Scenario: sync-specs-detects-and-fixes-drift
- GIVEN a spec file under `.spec-driven/specs/` is outdated relative to current
  code behavior
- WHEN `spec-driven-sync-specs` is run
- THEN it reports the drift in chat
- AND after user confirmation, directly edits the spec file
- AND runs `init` to refresh INDEX.md
