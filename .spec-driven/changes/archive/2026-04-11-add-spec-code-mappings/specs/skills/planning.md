---
mapping:
  implementation:
    - skills/spec-driven-init/SKILL.md
    - skills/spec-driven-propose/SKILL.md
    - skills/spec-driven-brainstorm/SKILL.md
    - skills/spec-driven-modify/SKILL.md
    - skills/spec-driven-spec-edit/SKILL.md
    - skills/spec-driven-sync-specs/SKILL.md
    - skills/spec-driven-resync-code-mapping/SKILL.md
    - skills/roadmap-plan/SKILL.md
    - skills/roadmap-milestone/SKILL.md
    - skills/roadmap-recommend/SKILL.md
    - skills/roadmap-propose/SKILL.md
    - skills/roadmap-sync/SKILL.md
    - scripts/spec-driven.ts
  tests:
    - test/run.js
    - test/validate-skills.ts
---

## ADDED Requirements

### Requirement: planning-skills-preserve-spec-mapping-frontmatter
When planning skills create or modify spec delta files for existing spec paths,
they MUST preserve relevant mapping frontmatter when known. If the expected
implementation or test files are clear from repository context, planning skills
SHOULD include them in `mapping.implementation` and `mapping.tests`.

If the expected mappings are unclear at proposal time, planning skills MAY leave
mapping completion to `spec-driven-apply`, but they MUST NOT invent file paths.

#### Scenario: proposal-includes-known-mapped-files
- GIVEN a proposal clearly affects an existing script and test runner
- WHEN a planning skill writes the delta spec file
- THEN it includes mapping frontmatter for the known implementation and test
  files

### Requirement: sync-specs-maintains-main-spec-mappings
`spec-driven-sync-specs` and direct spec editing workflows MUST update mapping
frontmatter when they edit spec files. If sync detects that code behavior has
moved to a different implementation or test file, the mapping must be updated
with the spec change.

#### Scenario: sync-specs-updates-moved-implementation-path
- GIVEN current code behavior moved from one implementation file to another
- WHEN `spec-driven-sync-specs` updates the affected spec artifact
- THEN the spec mapping points to the current implementation file

### Requirement: resync-code-mapping-repairs-existing-spec-mappings
`spec-driven-resync-code-mapping` MUST retrofit and repair mapping frontmatter for
existing main spec files without entering the normal change lifecycle. It MUST
read `.spec-driven/config.yaml`, `.spec-driven/specs/INDEX.md`, and the target
main spec files, then run the CLI mapping validator before deciding what mapping
repairs to propose.

The skill MUST inspect relevant repository files before proposing mapping
changes. It MUST separate implementation mappings from test mappings, present
the proposed frontmatter changes to the user, and wait for explicit
confirmation before editing spec files.

After confirmation, it MAY edit mapping frontmatter and mapping format only. It
MUST NOT change implementation files or rewrite requirement behavior. If it
detects behavior/spec drift that requires requirement changes, it MUST recommend
`spec-driven-sync-specs`, `spec-driven-spec-edit`, or the normal change
workflow instead of silently changing requirements.

#### Scenario: resync-code-mapping-fixes-legacy-spec-without-frontmatter
- GIVEN an existing main spec file has no mapping frontmatter
- WHEN `spec-driven-resync-code-mapping` runs and the user confirms the proposed mapping
- THEN the skill adds `mapping.implementation` and `mapping.tests` frontmatter
- AND it does not change requirement bodies or implementation files

#### Scenario: resync-code-mapping-corrects-stale-mapping
- GIVEN a spec file maps a path that no longer exists or is no longer relevant
- WHEN `spec-driven-resync-code-mapping` confirms a replacement mapping with the user
- THEN it updates the mapping frontmatter to current implementation and test paths
- AND reruns the CLI mapping validator

#### Scenario: resync-code-mapping-defers-behavior-drift
- GIVEN mapping repair reveals that the current requirement behavior is stale
  relative to code
- WHEN `spec-driven-resync-code-mapping` reports its findings
- THEN it recommends the appropriate spec synchronization or change workflow
- AND it does not rewrite requirement behavior as part of mapping repair
