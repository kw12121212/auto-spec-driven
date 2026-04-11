# Design: add-spec-code-mappings

## Approach

Represent spec-code relationships as YAML frontmatter at the top of each main
spec file:

```yaml
---
mapping:
  implementation:
    - scripts/spec-driven.ts
    - skills/spec-driven-apply/SKILL.md
  tests:
    - test/run.js
---
```

The mapping is file-level and many-to-many: a spec file may list multiple
implementation and test files, and the same repository file may appear in
multiple spec files. Requirement text remains unchanged and continues to focus
on observable behavior.

Add a `verify-spec-mappings [path]` CLI command that scans
`.spec-driven/specs/**/*.md`, excluding `INDEX.md` and `README.md`, parses
frontmatter, and outputs JSON. The command should validate structure and path
existence only. It should not attempt to decide whether a file semantically
implements or tests a requirement.

Add a `spec-driven-resync-code-mapping` skill for migration and repair. The skill should
operate outside the normal change lifecycle, similar to direct spec maintenance:
it reads `.spec-driven/config.yaml`, `.spec-driven/specs/INDEX.md`, all target
spec files, runs `verify-spec-mappings`, inspects likely related code and test
files, then presents proposed mapping changes before editing. After
confirmation, it updates only spec frontmatter and reruns the mapping validator.
If it discovers behavior/spec drift beyond mapping metadata, it should recommend
`spec-driven-sync-specs`, `spec-driven-spec-edit`, or a normal change workflow
instead of silently changing requirement behavior.

Skill instructions should be updated so:
- proposal-producing and spec-editing workflows preserve or draft mapping
  frontmatter when they create or update spec files
- `spec-driven-apply` updates mapping metadata after implementation to reflect
  the actual implementation and test files touched
- `spec-driven-verify` runs the CLI validation and checks semantic alignment
  against tasks, delta specs, and changed files
- `spec-driven-review` reads mapped implementation and test files before
  issuing findings
- `spec-driven-archive` preserves and merges mapping metadata when delta specs
  are accepted into main specs
- `spec-driven-sync-specs` updates mapping metadata when it directly edits main
  specs to resolve drift

## Key Decisions

- Store mappings in spec frontmatter instead of an external traceability file.
  This makes relationships visible at the point where agents already read spec
  context and avoids another global artifact.
- Separate implementation and tests. This prevents a mapped test file from being
  mistaken for implementation evidence and vice versa.
- Validate mappings with the CLI but keep semantic judgment in skills. Path and
  schema validation are deterministic filesystem mechanics; behavior alignment
  requires AI judgment.
- Provide a dedicated remapping skill instead of overloading
  `spec-driven-sync-specs`. Remapping old specs and repairing mapping metadata
  is narrower than synchronizing behavior specs with code drift.
- Use repo-relative file paths and file-level granularity. This is stable across
  small edits and works across scripts, skills, tests, docs, and shell files.
- Require touched spec files to maintain mappings, but do not make the first
  version a full historical coverage gate.

## Alternatives Considered

- External `.spec-driven/traceability.json`: rejected because the user prefers
  local, explicit mappings at the top of each spec file and no separate mapping
  artifact.
- Requirement-level edge tables: rejected for the first version because the
  requested model is file-name mappings in spec frontmatter, and file-level
  mapping is less brittle.
- Symbol or line-range mappings: rejected because they are fragile without a
  language-aware indexer and would add complexity outside the current lightweight
  CLI contract.
- Extending only AI prompts without CLI validation: rejected because malformed
  metadata should produce structured JSON errors that agents can act on.
- Making `spec-driven-sync-specs` handle all remapping work: rejected because
  mapping repair can be necessary even when requirement behavior is already
  correct, and it should have a focused workflow.
