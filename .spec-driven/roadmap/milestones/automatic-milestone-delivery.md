# Automatic Milestone Delivery

## Goal
Create a skill that can take one roadmap milestone and drive it through the full spec-driven lifecycle automatically, from selecting or scaffolding the needed changes through implementation, verification, review, archive, and roadmap reconciliation.

## In Scope
- Define the operator experience for triggering full milestone delivery from a roadmap milestone.
- Specify how the skill sequences recommendation, proposal, implementation, verification, review, archive, and roadmap sync work without repeated manual handoffs.
- Keep the first version scoped to milestones whose planned changes can be executed serially inside the existing spec-driven workflow.

## Out of Scope
- Replacing the normal single-change workflow for users who want manual control.
- Automatically resolving ambiguous roadmap prose or conflicting repository state without surfacing those issues.
- Expanding the first rollout to parallel multi-agent milestone execution across unrelated changes.

## Done Criteria
- The repository defines a milestone-oriented skill contract that explains how one milestone is selected, interpreted, and advanced through the existing change lifecycle.
- The automated flow specifies where it must stop for ambiguity, validation failures, or blocked changes instead of silently guessing.
- Roadmap updates after each completed planned change are defined clearly enough that milestone status stays synchronized with archived change history.

## Planned Changes
- `design-milestone-auto-flow` - Declared: planned - define the end-to-end workflow for taking a milestone from roadmap planning state through change execution, including how planned changes are ordered and how progress is resumed.
- `implement-milestone-auto-skill` - Declared: planned - add the milestone-oriented skill and any supporting script behavior needed to run the existing propose, apply, verify, review, archive, and roadmap sync steps as one guided flow.
- `document-milestone-auto-operator-rules` - Declared: planned - document how maintainers should invoke the skill, what prerequisites a milestone must satisfy, and which ambiguity cases still require human decisions.

## Dependencies
- The milestone automation should build on the current roadmap and spec-driven commands rather than creating a second parallel workflow.

## Risks
- A fully automatic milestone flow can become brittle if milestone scope is too ambiguous or if planned changes are not decomposed cleanly enough for deterministic execution.
- If archive and roadmap sync behavior are not explicit, the skill could leave milestone status partially updated after a mid-run failure.

## Status
- Declared: proposed

## Notes
- The first version should optimize for a single milestone completed in sequence with clear stop conditions, not maximum automation across every roadmap shape.
