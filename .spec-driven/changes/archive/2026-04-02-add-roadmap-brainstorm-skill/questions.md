# Questions: add-roadmap-brainstorm-skill

## Open


## Resolved

- [x] Q: Should roadmap change recommendation be a separate skill before scaffolding?
  Context: The key design choice is whether recommendation should live inside `roadmap-propose` or exist as its own step.
  A: Yes. Add a standalone `roadmap-brainstorm` skill that recommends a change and waits for user acceptance or modification.
