# Design: add-spec-edit-skill

## Approach

Create a new planning-layer skill `spec-driven-spec-edit` that edits `.spec-driven/specs/` main spec files directly. The skill:

1. Reads `.spec-driven/specs/INDEX.md` to understand the current spec structure
2. Accepts a user request to create, modify, or remove spec content
3. Routes the request to the correct spec file (existing or new)
4. Edits the main spec file directly (not through a change)
5. Updates `INDEX.md` if new files or categories were created
6. Validates the edited spec files conform to the standard requirement format

## Key Decisions

- **Confirmation before write**: The skill must present the planned changes (which files, what content) and wait for explicit user confirmation before writing anything to disk. No silent modifications.
- **Direct main-spec editing**: Unlike `spec-driven-spec-content` (which edits delta specs within a change), this skill edits `.spec-driven/specs/` directly. This is intentional — the skill is for lightweight corrections, not tracked changes.
- **No change workflow**: This skill does not create or interact with `.spec-driven/changes/` at all. It operates entirely within `.spec-driven/specs/`.
- **Planning-layer skill**: Like `spec-driven-init` and `spec-driven-spec-content`, this is a planning/documentation skill that does not implement product code.
- **Validation after edit**: After editing, the skill runs a format check on the edited file to ensure it still conforms to the standard `### Requirement:` heading format.

## Alternatives Considered

- **Extending `spec-driven-spec-content`**: Could add a "direct edit" mode, but `spec-driven-spec-content` is tightly coupled to the change workflow (it requires selecting a change and edits delta files). A separate skill keeps concerns clean.
- **Using `spec-driven-sync-specs`**: That skill creates a full change for drift, which is overkill for a simple spec correction.
- **Adding a script subcommand**: No new script is needed — the skill reads and edits spec files using AI file operations. Validation could use existing `verify` on a temporary change, but a simpler inline format check is more appropriate for this lightweight use case.
