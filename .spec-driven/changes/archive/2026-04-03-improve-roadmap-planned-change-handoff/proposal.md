# improve-roadmap-planned-change-handoff

## What

Improve the roadmap-to-change handoff so `roadmap-propose` and
`roadmap-recommend` do not treat a milestone planned item as only a change name
plus one short summary. When a planned change includes indented detail lines,
the roadmap skills should read and use that richer context while drafting the
proposal artifacts and recommendation summary.

## Why

Milestone files now support multiline planned change details, but the roadmap
handoff skills still describe the handoff at a much thinner level. That wastes
the extra context maintainers can record in roadmap milestones and weakens the
bridge between long-horizon planning and concrete change proposals. The handoff
skills should explicitly treat those detail lines as usable planning input so
the milestone format improvement has practical value during proposal generation
and recommendation.

## Scope

In scope:
- Define that `roadmap-propose` reads the selected planned change entry together
  with its attached detail lines before drafting proposal artifacts
- Define that `roadmap-recommend` uses planned change detail lines when
  explaining why a candidate should come next and when summarizing the proposed
  change after confirmation
- Tighten `roadmap-plan` and `roadmap-milestone` guidance so complex planned
  work is encouraged to include meaningful indented detail lines
- Update skill prompts so proposal artifacts, recommendation summaries, and
  milestone authoring guidance all use the richer planned change context

Out of scope:
- Changing the CLI roadmap parsing contract again
- Adding a new script command to extract planned change detail blocks
- Replacing milestone detail lines with YAML or a new structured data format
- Automatically rewriting existing roadmap milestones to add more detail

## Unchanged Behavior

Behaviors that must not change as a result of this change (leave blank if nothing is at risk):
- `roadmap-propose` still scaffolds the standard five change artifacts only
- `roadmap-recommend` still waits for explicit user confirmation before
  scaffolding
- `Planned Changes` still remain the milestone's only work list
- CLI roadmap validation and status matching still rely on the canonical first
  line of each planned change entry
