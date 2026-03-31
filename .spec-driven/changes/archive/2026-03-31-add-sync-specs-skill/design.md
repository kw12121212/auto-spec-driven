# Design: add-sync-specs-skill

## Approach

Add `spec-driven-sync-specs` as a standalone planning skill under `skills/`.
Its workflow will reverse the normal direction of the spec-driven process
without changing the underlying artifact model:

1. Confirm `.spec-driven/` exists and determine whether the user wants a
   repository-wide scan or a scoped scan for a specific path or module
2. Read `.spec-driven/config.yaml`, `.spec-driven/specs/INDEX.md`, and the
   relevant main specs before making any drift judgment
3. Read the selected code, tests, and supporting docs in the scan scope to infer
   observable current behavior
4. Compare repository behavior to existing specs and classify findings into:
   - confirmed spec gaps or outdated requirements
   - candidate spec files that should be added or modified
   - ambiguities that require human confirmation
5. Propose a dedicated sync change name, scaffold it, and populate the normal
   five artifacts plus aligned delta spec files
6. Run workflow verification and then present a concise in-chat summary of the
   scan scope, confirmed gaps, delta targets, and open questions

The skill stays in the planning layer. It does not change product code and does
not write a standalone report artifact.

## Key Decisions

- Create a dedicated spec-only change instead of editing main specs directly.
  This preserves reviewability and keeps sync work inside the existing archive
  flow.
- Support partial scans as a first-class behavior. Large repositories often need
  spec synchronization for one subsystem at a time, and the skill should not
  imply drift outside the requested scope.
- Treat code, tests, and nearby docs as evidence, but only write observable spec
  behavior. Internal implementation details should not become requirements.
- Keep the report in chat only. The durable record should be the standard change
  artifacts and delta specs, not a sixth required file.
- Record uncertainty in `questions.md` instead of guessing when code behavior is
  unclear or when a spec target is ambiguous.

## Alternatives Considered

- Extend `spec-driven-verify` to generate drift sync changes. Rejected because
  verify is a validation step for an existing change, not a repository
  discovery-and-proposal workflow.
- Extend `spec-driven-spec-content` to read code directly. Rejected because spec
  routing is narrower than repository drift analysis and should stay focused on
  placing user-supplied spec content.
- Write findings straight into `.spec-driven/specs/`. Rejected because it would
  bypass proposal, review, and archive history for sync work.
