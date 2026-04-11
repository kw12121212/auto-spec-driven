# Design: specialize-review-checklists

## Approach

Update the review contract in specs and the `spec-driven-review` prompt so
review starts by identifying the change's relevant checklist categories. The
classification should be evidence-based: proposal scope, delta specs, tasks,
changed file paths, mapped files, and repository context can all indicate which
checklists apply.

The specialized checklists should be additive. Every review still performs the
existing baseline quality, test, and mapping checks. When one or more change
types apply, review adds targeted checks for the risks that are specific to
those types and reports any findings through the existing MUST FIX, SHOULD FIX,
and NITS sections.

## Key Decisions

- Keep checklist routing inside `spec-driven-review`. This preserves one review
  entry point and avoids forcing users to choose the correct review skill.
- Make checklist selection multi-label. A change can be both API and
  security-sensitive, or DX and maintenance, and review should cover both risk
  profiles when evidence supports it.
- Treat the category checklist as additive, not a replacement for baseline
  review. Broad readability, security, error handling, performance, test, and
  mapping checks still run for every change.
- Keep the current severity model. Specialized findings should become MUST FIX,
  SHOULD FIX, or NITS based on impact, not based only on which checklist found
  them.
- Defer ship behavior to `add-basic-ship-step`. This change strengthens the
  quality gate that should exist before any commit-and-push automation is added.

## Alternatives Considered

- Split review into separate skills such as `security-review` and `ui-review`.
  Rejected because the roadmap item explicitly avoids splitting review into
  many separate skills.
- Require the user to declare the change type manually. Rejected as the primary
  mechanism because the review skill can infer likely categories from artifacts
  and files, while still surfacing ambiguity when needed.
- Add only a security checklist. Rejected because the roadmap calls out several
  recurring change types with different review risks.
- Add ship behavior in the same change. Rejected because shipping is a separate
  planned change and should follow stronger review coverage.
