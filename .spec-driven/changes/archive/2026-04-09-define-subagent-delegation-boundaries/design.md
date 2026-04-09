# Design: define-subagent-delegation-boundaries

## Approach

Model delegation as a workflow constraint first, then refine it by skill
family.

1. Add a workflow-level requirement that skills MAY delegate bounded subtasks
   to sub-agents, but the parent agent MUST retain ownership of workflow gates,
   state-changing writes, and final user-facing judgments.
2. Extend planning requirements so analysis-heavy planning skills may offload
   context gathering, candidate comparison, likely spec-path identification, or
   question drafting while keeping confirmation checkpoints and proposal writes
   in the parent agent.
3. Extend execution-stage review/verification requirements so those skills may
   offload evidence gathering or preliminary findings while keeping the final
   blocking report in the parent agent.
4. Update the concrete skill prompts to reflect those boundaries explicitly so
   the prompt contract and main specs stay aligned.

## Key Decisions

- **Delegation is optional, not mandatory**
  The framework should permit delegation where it helps, but should not require
  it for every run or every environment.
- **Read-heavy analysis is the main target**
  The first slice should cover work that benefits from parallel analysis
  without creating ownership ambiguity: planning synthesis, review evidence
  gathering, and verification checks.
- **Parent agent retains all workflow transitions**
  Anything that advances the workflow or commits to a user-facing decision
  remains with the parent agent: confirmation gates, scaffolding, final review
  verdicts, final verification tiers, and any `.spec-driven/` writes that move
  the workflow forward.
- **Execution-path implementation delegation stays out of scope**
  `apply` and `auto` can benefit from narrower delegation later, but those
  flows have more complicated task-state and code-edit ownership concerns and
  should be addressed separately.

## Alternatives Considered

1. **Keep delegation entirely unspecified**
   Rejected because the repo now has enough analysis-heavy skills that agents
   will either underuse delegation or use it inconsistently.
2. **Let whole skills run inside a sub-agent**
   Rejected because recommendation checkpoints, scaffolding, and final reports
   should stay attached to the parent agent that owns the user interaction.
3. **Add delegation rules for every skill in one change**
   Rejected because the highest-risk workflows (`apply`, `auto`, `archive`) need
   a separate design pass instead of being bundled into a broad first policy.
