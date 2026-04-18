# Design: add-canonical-tasks-example

## Approach

Mirror the pattern used by the existing delta spec canonical example (`add-delta-spec-format-samples`): embed a copyable tasks.md sample directly in each affected skill prompt, listing the exact keywords the verify script matches against. Add matching documentation to the specs README. Add a planning spec requirement so future skill edits preserve this pattern.

## Key Decisions

- Annotate the canonical sample with the required keywords rather than just showing a bare example — this tells the agent *why* certain words must appear, reducing the chance it paraphrases them away.
- Include the canonical sample in `spec-driven-modify` as well as the proposal-authoring skills, because modify can edit `tasks.md` and needs the same keyword awareness.

## Alternatives Considered

- **Add config.yaml rule**: rules are constraints, not demonstrations. A canonical example is more effective at preventing the specific keyword omission problem.
- **Improve verify error messages only**: helps after failure but doesn't prevent the error from occurring in the first place.
