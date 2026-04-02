# add-roadmap-propose-skill

## What

- Add a dedicated `roadmap-propose` skill that turns a milestone `Planned Changes`
  item into a normal spec-driven change scaffold.
- Update docs, installer behavior, and roadmap skill specs so roadmap users have
  a first-class handoff from milestone planning into change execution.

## Why

- After users create roadmap milestones, the next step of turning a planned item
  into a real change is common enough to deserve its own roadmap-prefixed entry point.
- Requiring users to switch mentally from roadmap skills to `spec-driven-propose`
  makes the roadmap workflow feel incomplete.

## Scope

- In scope:
  - add a new bundled `roadmap-propose` skill
  - install and document the new skill alongside other roadmap skills
  - specify that it only promotes milestone `Planned Changes`, not `Candidate Ideas`
- Out of scope:
  - changing the underlying `spec-driven.js propose` command
  - automatically implementing the proposed change
  - moving items between roadmap sections automatically

## Unchanged Behavior

Behaviors that must not change as a result of this change (leave blank if nothing is at risk):
- roadmap assets remain separate from change execution artifacts
- `spec-driven-propose` remains available as the generic direct entry point for new changes
- `roadmap-propose` still creates the same five change artifacts under `.spec-driven/changes/<name>/`
