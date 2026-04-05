# Design: gate-roadmap-recommend-open-questions

## Approach

Update the roadmap planning contract in two layers:

1. Refine the `roadmap-recommend` requirements in
   `.spec-driven/specs/skills/planning.md` and
   `.spec-driven/specs/skills/roadmap.md` so recommendation-stage open questions
   become an explicit pre-scaffolding gate rather than something merely
   recorded for later.
2. Align `skills/roadmap-recommend/SKILL.md` with that contract by inserting a
   decision step after the recommendation summary: if any open questions remain,
   list them, ask the user to answer or confirm the needed decision, optionally
   suggest a preferred answer, and wait before running
   `node {{SKILL_DIR}}/scripts/spec-driven.js propose <name>`.

The change stays in the planning layer only. It adjusts the skill prompt and
spec expectations so future proposals are scaffolded only after the relevant
planning ambiguity has been explicitly resolved.

## Key Decisions

- **Gate before scaffolding**
  The stop point belongs before `.spec-driven/changes/<name>/` is created. That
  keeps roadmap-backed proposals from being generated around known unresolved
  decisions.
- **Recommendations remain allowed**
  The skill may still suggest the likely best answer to keep planning efficient,
  but the recommendation must remain advisory until the user confirms it.
- **Limit this change to `roadmap-recommend`**
  Other skills already have their own question-gate behavior or are outside the
  requested scope. This change should stay minimal and targeted.

## Alternatives Considered

1. **Allow scaffolding first, but block before apply**
   Rejected because the user explicitly wants the ambiguity handled earlier, and
   the resulting proposal should be based on confirmed planning inputs.
2. **Auto-resolve open questions using the recommended answer**
   Rejected because that would collapse a suggestion into a user decision and
   undermine the purpose of a question gate.
3. **Apply the same tightening to all planning skills now**
   Rejected for this change because it expands scope beyond the requested
   `roadmap-recommend`-only update.
