# add-roadmap-milestones

## What

Add a formal `.spec-driven/roadmap/` asset for long-horizon planning and split
that roadmap into milestone files rather than a single large document. The
change introduces three planning-only skills for roadmap work:
`spec-driven-roadmap-plan`, `spec-driven-roadmap-milestone`, and
`spec-driven-roadmap-sync`. It also extends `spec-driven-init` so new or
repaired projects always receive the roadmap scaffold alongside `specs/` and
`changes/`.

## Why

The current framework is strong at managing one concrete change at a time, but
it has no persistent layer for tracking multi-step product direction across
phases. That leaves users with two poor options: keep roadmap thinking only in
chat, where it is easy to lose, or create one oversized roadmap document that
mixes distant ideas, near-term execution, and stage goals in a way that becomes
hard to maintain. A milestone-based roadmap asset gives the workflow a durable
planning layer with explicit phase boundaries and clear forward targets while
preserving `changes/` as the unit of execution.

## Scope

In scope:
- Add a formal `.spec-driven/roadmap/` scaffold containing `INDEX.md` and a
  `milestones/` directory
- Define milestone files as the primary roadmap unit, with explicit separation
  between `Candidate Ideas` and `Planned Changes`
- Define milestone completion as derived from archive state of the listed
  planned changes, not manual toggles
- Add `spec-driven-roadmap-plan` to create or restructure a roadmap by
  milestone
- Add `spec-driven-roadmap-milestone` to refine one milestone's scope, goals,
  dependencies, and planned work
- Add `spec-driven-roadmap-sync` to reconcile roadmap status against active and
  archived changes
- Update roadmap-, planning-, workflow-, script-, install-, and documentation
  specs to describe the new behavior
- Update installer inventory, `init` scaffolding, template assets, and user docs
  so the roadmap layer is shipped and discoverable

Out of scope:
- New general-purpose roadmap CLI subcommands beyond the `init` scaffold changes
- Replacing the five change artifacts (`proposal.md`, `design.md`, `tasks.md`,
  `questions.md`, delta specs) with roadmap documents
- Manual milestone completion overrides
- Automatic implementation work triggered directly from roadmap files

## Unchanged Behavior

Behaviors that must not change as a result of this change (leave blank if nothing is at risk):
- `changes/` remains the unit of implementation, verification, and archive
- `spec-driven-propose`, `spec-driven-apply`, `spec-driven-verify`, and
  `spec-driven-archive` remain the core execution flow for approved work
- Roadmap skills remain planning/documentation skills only and must not edit
  product code
- Main specs continue to change through delta specs plus archive rather than
  direct edits from roadmap work
