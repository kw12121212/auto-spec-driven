---
mapping:
  implementation:
    - skills/spec-driven-propose/SKILL.md
    - skills/spec-driven-brainstorm/SKILL.md
    - skills/spec-driven-modify/SKILL.md
    - skills/roadmap-propose/SKILL.md
    - skills/roadmap-recommend/SKILL.md
    - .spec-driven/specs/README.md
  tests:
    - test/run.js
    - test/validate-skills.ts
---

## ADDED Requirements

### Requirement: proposal-authoring-skills-embed-canonical-tasks-example
When `spec-driven-propose`, `spec-driven-brainstorm`, `spec-driven-modify`,
`roadmap-propose`, or `roadmap-recommend` instruct the agent to write or edit
`tasks.md`, they MUST include a copyable canonical tasks.md sample directly in
the skill instructions.

That sample MUST show:
- `## Implementation`, `## Testing`, and `## Verification` section headings
- checkbox tasks (`- [ ]`) under each section
- a `## Testing` section with at least one lint or validation task and one
  unit test task, each naming an explicit runnable command in backticks
- an annotation listing the exact keywords the verify script matches for each
  task category:
  - lint/validation keywords: `lint`, `validate`, `validation`, `typecheck`,
    `type-check`, `build`
  - unit test keywords: `unit test`, `unit tests`
  - runnable command requirement: backtick-wrapped command or a known runner
    keyword (npm, pnpm, yarn, bun, node, bash, sh, pytest, jest, vitest, go,
    cargo, make, uv, poetry)

The skill instructions MUST also tell the agent that the testing task text
MUST contain one of the listed keywords to pass verification, and that
paraphrasing the keywords (e.g. writing "run tests" instead of "run unit tests")
will cause verify to fail.

#### Scenario: proposal-skill-includes-copyable-tasks-example
- GIVEN a planning skill is about to direct the agent to write tasks.md
- WHEN the skill describes the required tasks format
- THEN it includes a copyable example showing the canonical section structure
- AND the example includes an annotation listing the lint/validation keywords
- AND the example includes an annotation listing the unit test keywords
- AND the example shows explicit runnable commands in backticks

### Requirement: spec-authoring-readme-documents-canonical-tasks-format
The repository's `.spec-driven/specs/README.md` MUST document the canonical
tasks.md format so humans and agents can reference the same example outside the
skill prompts.

That README guidance MUST include:
- when `tasks.md` is used under `.spec-driven/changes/<name>/`
- a copyable sample file showing the three required sections
- the list of keywords that the verify script matches for lint/validation tasks
  and unit test tasks
- a note that each testing task must name an explicit runnable command

#### Scenario: readme-shows-tasks-format-example
- GIVEN a user or agent opens `.spec-driven/specs/README.md`
- WHEN they look for tasks format guidance
- THEN they can find a dedicated tasks format section with a copyable example
- AND the example lists the required keywords for each task category
