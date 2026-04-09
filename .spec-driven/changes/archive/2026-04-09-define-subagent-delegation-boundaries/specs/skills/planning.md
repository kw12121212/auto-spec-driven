# Delta: Skills Planning

## ADDED Requirements

### Requirement: planning-skills-may-delegate-analysis-only-subtasks
`roadmap-plan`, `roadmap-milestone`, `roadmap-recommend`, and
`spec-driven-propose` MAY delegate bounded analysis-only subtasks to a
sub-agent after the parent agent has identified the concrete question that
needs sidecar help.

Allowed delegated work includes:
- summarizing roadmap, spec, or repository context
- comparing candidate changes or milestone structures
- identifying likely affected spec paths or repository files
- drafting candidate open questions or alternative options for the parent agent
  to evaluate

Those skills MUST keep the following work in the parent agent:
- any user-facing confirmation checkpoint
- selecting the final recommended change, milestone structure, or proposal
  scope presented as the skill result
- scaffolding `.spec-driven/changes/<name>/`
- writing or updating the final proposal artifacts under `.spec-driven/`

#### Scenario: roadmap-recommend-uses-sidecar-analysis-but-keeps-scaffolding-local
- GIVEN `roadmap-recommend` wants help comparing planned change candidates
- WHEN it delegates that comparison to a sub-agent
- THEN the parent agent still chooses what recommendation to present
- AND it still waits for explicit user confirmation before scaffolding

#### Scenario: propose-keeps-artifact-writes-in-parent-agent
- GIVEN `spec-driven-propose` delegates relevant-spec discovery to a sub-agent
- WHEN it creates the proposal artifacts
- THEN the parent agent writes the final proposal, design, tasks, questions,
  and delta specs
- AND it does not treat delegated draft text as authoritative by itself
