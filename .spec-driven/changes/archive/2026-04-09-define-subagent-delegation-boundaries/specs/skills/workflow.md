# Delta: Skills Workflow

## ADDED Requirements

### Requirement: parent-agent-retains-workflow-ownership-when-delegating
Spec-driven skills MAY delegate a bounded subtask to a sub-agent when that
subtask is concrete, materially useful, and does not require the sub-agent to
own the workflow state for the overall skill run.

When delegation is used, the parent agent MUST retain ownership of:
- user-facing confirmation or question-resolution checkpoints
- writes that create, resolve, archive, cancel, or otherwise advance
  `.spec-driven/` workflow state
- the final user-facing recommendation, review, or verification verdict
- the decision to accept, reject, or integrate delegated output

Delegated output MAY inform the skill, but it MUST NOT replace the parent
agent's responsibility to interpret current change artifacts, main specs, and
repository state before taking those workflow actions.

#### Scenario: delegated-analysis-does-not-bypass-parent-workflow-gates
- GIVEN a skill delegates bounded analysis work to a sub-agent
- WHEN the overall workflow reaches a user confirmation or workflow-state
  transition
- THEN the parent agent remains responsible for that interaction or state write
- AND the sub-agent does not complete the transition on its own
