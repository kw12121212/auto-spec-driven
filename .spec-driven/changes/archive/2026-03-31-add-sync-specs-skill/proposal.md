# add-sync-specs-skill

## What

Add a new `spec-driven-sync-specs` skill that scans current repository behavior
against existing `.spec-driven/specs/`, identifies code-to-spec drift, and
creates a dedicated spec-only change to synchronize the specs with what already
exists in the codebase. The skill supports whole-repository scans and scoped
scans for a specific directory, module, or feature area. It finishes by
presenting a concise drift report in chat rather than writing a separate report
file.

## Why

The current workflow assumes specs are authored before implementation and then
kept up to date during `/spec-driven-apply`. That breaks down in two common
cases: bootstrapping specs for an existing codebase, and catching up after a
period of manual work outside the workflow. In those cases, the repository may
contain real behavior that is missing from the specs, but there is no dedicated
skill that inspects the code, turns the drift into delta specs, and hands the
user a reviewable change plus a clear summary of what was found.

## Scope

In scope:
- Add `skills/spec-driven-sync-specs/SKILL.md`
- Define that the skill reads `.spec-driven/config.yaml`, `INDEX.md`, relevant
  main specs, and the selected code/test/doc files before deciding what drift
  exists
- Define that the skill supports either repository-wide scans or user-limited
  scoped scans
- Define that the skill creates a dedicated change with proposal, design, tasks,
  questions, and delta specs rather than editing main specs directly
- Define that the skill reports confirmed gaps, proposed spec updates, scanned
  scope, and unresolved ambiguities in chat
- Update installer and repository documentation to include the new skill

Out of scope:
- New CLI subcommands or script behavior
- Automatic code changes or speculative repairs
- Writing a standalone `report.md` artifact
- Direct edits to `.spec-driven/specs/` main specs outside the normal archive flow

## Unchanged Behavior

Behaviors that must not change as a result of this change (leave blank if nothing is at risk):
- Existing `spec-driven-propose`, `spec-driven-modify`, `spec-driven-spec-content`,
  `spec-driven-apply`, and `spec-driven-verify` workflows remain available and
  unchanged in purpose
- The TypeScript CLI remains filesystem-only and unchanged
- Main specs still change through delta specs plus archive, not direct edits
- `questions.md` remains the single place for unresolved ambiguity; the drift
  summary in chat does not replace workflow artifacts
