# Tasks: define-subagent-delegation-boundaries

## Implementation

- [x] Update `.spec-driven/specs/skills/workflow.md` with a workflow-level
  delegation rule that permits bounded sub-agent use while keeping workflow
  gates, state writes, and final user-facing decisions in the parent agent.
- [x] Update `.spec-driven/specs/skills/planning.md` so
  `roadmap-plan`, `roadmap-milestone`, `roadmap-recommend`, and
  `spec-driven-propose` may delegate analysis-only subtasks but must keep
  confirmation and proposal-writing ownership in the parent agent.
- [x] Update `.spec-driven/specs/skills/execution.md` so
  `spec-driven-review` and `spec-driven-verify` may delegate evidence gathering
  or draft findings but must keep the final blocking report in the parent
  agent.
- [x] Update the affected skill prompts under `skills/` to match the new
  delegation contract.
- [x] Update README guidance if needed so user-facing workflow docs do not
  imply a stricter single-agent model than the specs now require.

## Testing

- [x] Run `npm run validate-skills -- skills/roadmap-plan/SKILL.md skills/roadmap-milestone/SKILL.md skills/roadmap-recommend/SKILL.md skills/spec-driven-propose/SKILL.md skills/spec-driven-review/SKILL.md skills/spec-driven-verify/SKILL.md`.
- [x] Run unit tests with `npm test`.

## Verification

- [x] Run `node dist/scripts/spec-driven.js verify define-subagent-delegation-boundaries`.
- [x] Verify the final skill wording keeps confirmation, scaffolding, and final
  review or verification verdicts in the parent agent even when sub-agents are
  used for analysis.
