# Design: improve-roadmap-planned-change-handoff

## Approach

Update the roadmap skill contracts and prompts so the handoff from roadmap
planning into normal change proposals explicitly includes the extra context
available in multiline planned change entries.

The skills will still identify planned work by the canonical first line,
`- \`<change-name>\` - <summary>`, but they must read any indented continuation
lines attached to that entry and treat them as milestone-local planning input.
That input should shape recommendation rationale, proposal scope summaries, and
the generated proposal/design/tasks content when relevant.

This change stays in the planning layer only. It updates specs and skill prompts
without changing the CLI behavior that validates or resolves milestone entries.

## Key Decisions

- Keep the richer handoff behavior in skills instead of adding new CLI parsing
  commands. The detail already exists in Markdown and the main change needed is
  authoring/usage guidance.
- Continue to treat only the canonical first line as the change identifier. This
  preserves compatibility with `roadmap-propose`, `roadmap-recommend`, and
  archive/status behavior.
- Require the handoff skills to use detail lines as input, but not to mirror
  them mechanically into every artifact. The generated proposal should distill
  useful context rather than copy roadmap prose blindly.
- Strengthen `roadmap-plan` and `roadmap-milestone` guidance so maintainers know
  when richer detail is worth writing in the first place.

## Alternatives Considered

- Do nothing beyond the milestone format change. Rejected because multiline
  detail lines would remain underused during the actual proposal handoff.
- Add a dedicated CLI extraction command for planned change detail blocks.
  Rejected because this is unnecessary for a prompt-level behavior improvement.
- Force every planned change to contain a fixed detail schema. Rejected because
  that would make milestone authoring heavier before there is evidence it is
  needed.
