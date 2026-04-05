# Tasks: gate-roadmap-recommend-open-questions

## Implementation

- [x] Update `.spec-driven/specs/skills/planning.md` to require
  `roadmap-recommend` to stop on open questions before scaffolding and wait for
  explicit user answers.
- [x] Update `.spec-driven/specs/skills/roadmap.md` to require
  `roadmap-recommend` to surface pre-scaffolding open questions, allow
  recommended answers as suggestions only, and continue only after explicit
  user confirmation.
- [x] Update `skills/roadmap-recommend/SKILL.md` so its step-by-step prompt
  matches the stricter pre-scaffolding question gate.

## Testing

- [x] Run `npm run build`.
- [x] Run `npm run validate-skills -- skills/roadmap-recommend/SKILL.md`.

## Verification

- [x] Run `node dist/scripts/spec-driven.js verify gate-roadmap-recommend-open-questions`.
- [x] Verify the final wording makes unresolved roadmap recommendation questions
  block scaffolding until the user explicitly answers or confirms them.
