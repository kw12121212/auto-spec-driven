## ADDED Requirements

### Requirement: sync-specs-reads-spec-context-before-judging-drift
`spec-driven-sync-specs` MUST read `.spec-driven/config.yaml`,
`.spec-driven/specs/INDEX.md`, and each relevant main spec file before deciding
that repository behavior has drifted from the specs.

### Requirement: sync-specs-supports-repository-or-scoped-scans
`spec-driven-sync-specs` MUST support either a repository-wide scan or a
user-limited scoped scan for a specific directory, module, or feature area. When
the user chooses a scoped scan, the skill MUST limit its findings and proposed
spec updates to that declared scope and MUST NOT imply repository-wide coverage.

### Requirement: sync-specs-creates-a-dedicated-spec-only-change
When `spec-driven-sync-specs` finds confirmed code-to-spec drift, it MUST create
or update a dedicated change containing `proposal.md`, `design.md`, `tasks.md`,
`questions.md`, and delta spec files aligned with `.spec-driven/specs/`. It MUST
NOT edit `.spec-driven/specs/` main spec files directly.

### Requirement: sync-specs-turns-evidence-into-delta-specs-and-questions
`spec-driven-sync-specs` MUST read the selected code, tests, and nearby
documentation as evidence of current observable behavior, then translate
confirmed gaps into delta spec files. If the behavior or target spec path is
ambiguous, it MUST record that ambiguity in `questions.md` instead of guessing.

### Requirement: sync-specs-reports-findings-in-chat
After preparing the sync change and running workflow verification,
`spec-driven-sync-specs` MUST present a concise in-chat summary that identifies
the scan scope, confirmed gaps, affected delta spec files, and unresolved
questions. It MUST NOT require or create a standalone report artifact.
