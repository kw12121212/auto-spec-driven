---
skill_id: spec_driven_remap_specs
name: spec-driven-remap-specs
description: Retrofit or repair spec frontmatter mappings between specs, implementation files, and test files.
author: auto-spec-driven
type: agent_skill
version: 1.0.0
---

You are helping the user retrofit or repair spec-code mapping frontmatter in
`.spec-driven/specs/` files.

## Prerequisites

The `.spec-driven/` directory must exist at the **project root**. Before
proceeding, verify:
```
ls .spec-driven/
```
If this fails, the project is not initialized. Run `/spec-driven-init` first.

## Steps

1. **Choose the remapping scope** — determine whether the user wants to remap:
   - all main spec files
   - one spec category or file
   - only specs reported by `verify-spec-mappings` as malformed or stale

   If the user already gave a scope, use it. If not, ask which scope to repair.

2. **Read spec context first** — before proposing mapping edits, read:
   - `.spec-driven/config.yaml`
   - `.spec-driven/specs/INDEX.md`
   - every main spec file in the selected scope
   - any existing mapping frontmatter in those spec files

3. **Run mapping validation** — run:
   ```
   node {{SKILL_DIR}}/scripts/spec-driven.js verify-spec-mappings
   ```
   Use the JSON result to identify missing frontmatter, malformed mapping
   fields, non-string entries, and missing mapped files.

4. **Inspect repository evidence** — read relevant implementation, tests, skill
   prompts, scripts, and documentation needed to determine current file-level
   mappings. Keep implementation files separate from test files.

5. **Classify findings** — sort findings into:
   - missing mapping frontmatter that can be confidently added
   - malformed mapping frontmatter that can be repaired without changing
     requirement behavior
   - stale paths that can be replaced with current implementation or test files
   - behavior/spec drift that requires `/spec-driven-sync-specs`,
     `/spec-driven-spec-edit`, or a normal change workflow
   - ambiguous mappings that require human input

6. **Present proposed mapping edits** — before editing any file, show the user:
   - each spec file whose frontmatter will change
   - the proposed `mapping.implementation` paths
   - the proposed `mapping.tests` paths
   - any behavior/spec drift or ambiguous mapping that will not be edited by
     this skill

   Wait for explicit confirmation before writing files.

7. **Apply confirmed mapping repairs** — after confirmation, edit only mapping
   frontmatter in the selected main spec files. Do not change implementation
   files. Do not rewrite requirement bodies unless the user switches to
   `/spec-driven-sync-specs`, `/spec-driven-spec-edit`, or a normal change
   workflow.

8. **Validate after editing** — rerun:
   ```
   node {{SKILL_DIR}}/scripts/spec-driven.js verify-spec-mappings
   ```
   Fix safe frontmatter format issues immediately and rerun validation. If any
   remaining error needs human judgment, report it clearly.

9. **Report final result** — summarize:
   - which spec files had mapping frontmatter added or repaired
   - which stale paths were replaced
   - whether mapping validation now passes
   - any behavior/spec drift or ambiguity left for another workflow

## Rules

- This is a planning/documentation skill only — do not change implementation
  code or tests
- Do not create, modify, archive, or cancel entries under `.spec-driven/changes/`
- Do not rewrite requirement behavior while repairing mappings
- Keep `mapping.implementation` and `mapping.tests` separate
- Use repo-relative file paths only
- Keep mappings at file granularity; do not use line numbers, ranges, or symbols
- Always run `verify-spec-mappings` before and after confirmed edits
- Get explicit user confirmation before editing any spec file
- If mapping repair reveals behavior/spec drift, recommend the appropriate
  spec synchronization or change workflow instead of silently changing
  requirements
