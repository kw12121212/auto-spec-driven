# Design: sync-specs-direct-edit

## Approach

Replace the change-lifecycle flow in `spec-driven-sync-specs` with a direct-edit
flow:

1. **Scan scope** — user chooses repo-wide or scoped scan (unchanged)
2. **Read spec context** — config.yaml, INDEX.md, relevant main specs (unchanged)
3. **Read code evidence** — inspect code, tests, docs in scope (unchanged)
4. **Classify drift** — missing specs, outdated specs, ambiguous, no drift (unchanged)
5. **Report drift in chat** — present findings before editing (unchanged)
6. **Get confirmation** — ask user to confirm before writing (new explicit step)
7. **Edit specs directly** — write to `.spec-driven/specs/` files (replaces delta specs)
8. **Refresh INDEX.md** — run `init` to regenerate the spec index (new step)
9. **Report changes** — summarize what was added/modified/removed (unchanged)

## Key Decisions

- **Direct edit vs change lifecycle:** Direct edit. Sync is doc maintenance, not
  a product change. Git tracks the diff.
- **Confirmation before writing:** Yes. Even though it's just docs, the user
  should approve the drift fixes before they land.
- **INDEX.md refresh:** Use `init` command since it already regenerates INDEX.md
  from the current file state. No new script logic needed.

## Alternatives Considered

- **Keep change lifecycle but skip testing:** Would leave an inconsistent
  artifact (tasks.md with no meaningful testing tasks). Rejected.
- **Use `spec-driven-spec-edit` for each file:** That skill is manual and
  single-file. Sync-specs needs batch scanning + drift detection, which is a
  different interaction pattern. Kept as a separate skill.
- **Write a new script subcommand:** Not needed. The skill just needs to call
  `init` to refresh INDEX.md. All other operations are file reads/writes that
  the AI agent handles directly.
