# Design: refine-milestone-format

## Approach

Update the roadmap specs so milestone files move from a minimal validation-only
shape to a richer bounded-phase contract while staying Markdown-first. The new
contract adds explicit scope sections, separates dependency tracking from risk
tracking, and gives maintainers a standard notes section for explanatory
context.

Planned change entries will adopt a canonical bullet format,
`- \`<change-name>\` - <summary>`, where the backticked change name remains the
canonical identifier and the trailing summary provides human-readable context.
Script-facing requirements will be updated so `verify-roadmap` validates the
refined section list and planned-change entry shape, while `roadmap-status`
continues to resolve change state from the extracted change name.

To make planned work more informative without giving up predictable parsing,
each planned change may also include optional indented continuation lines below
that canonical first line. The parser will treat only top-level planned change
bullets as change entries, while attached indented lines remain milestone-local
detail for the preceding entry.

The change will also update roadmap examples/templates in this repository so
newly authored milestones follow the refined format by default.

## Key Decisions

- Keep milestone files Markdown-first instead of introducing YAML or frontmatter.
  This preserves low-friction authoring and keeps the change incremental.
- Keep `## Status` rigid and machine-oriented. Human explanation moves to
  `## Notes` so status parsing stays simple.
- Add both `## In Scope` and `## Out of Scope` so milestone boundaries are
  explicit instead of inferred from the goal alone.
- Split `## Dependencies` from `## Risks` because sequencing constraints and
  uncertainty should not compete in the same list.
- Keep planned changes parseable with a canonical bullet prefix instead of using
  nested prose or tables.
- Allow richer planned-change detail, but keep the first line authoritative for
  parsing so status matching and archive reconciliation stay simple.

## Alternatives Considered

- Add YAML or frontmatter metadata for milestone fields. Rejected because it
  would raise authoring overhead and turn a format refinement into a format
  migration.
- Leave the current milestone shape alone and rely on stronger prompt wording.
  Rejected because that preserves the structural ambiguity the change is trying
  to remove.
- Allow freeform explanatory bullets inside `## Status`. Rejected because it
  muddies the single machine-validated status field and makes parsing less
  stable.
- Use Markdown tables for planned changes, dependencies, or risks. Rejected
  because tables are brittle in AI-authored documents and harder to validate
  consistently than bullet lists.
- Allow completely freeform planned-change prose with no canonical first line.
  Rejected because it would make roadmap parsing fragile again.
