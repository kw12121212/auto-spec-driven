# gate-roadmap-recommend-open-questions

## What

Tighten `roadmap-recommend` so unresolved planning questions are handled before
the skill scaffolds a change.

When the recommendation discussion reveals one or more open questions that
affect the proposed roadmap-backed change, the skill must stop and ask the user
for exact answers before it runs `propose <name>`. The skill may offer a
preferred answer, but only as a suggestion; it may not treat that suggestion as
resolved, record it as though it were confirmed, or continue to scaffolding
until the user explicitly answers or confirms the decision.

## Why

The current workflow already treats open questions as blockers for
implementation, but `roadmap-recommend` still allows ambiguity to pass through
the recommendation stage and only surface later in the change lifecycle.

That leaves the workflow in an awkward state: the skill can recommend the next
change and generate proposal artifacts even when a key scope or behavior choice
is still undecided. For roadmap-backed planning, that ambiguity should be
settled before the normal change scaffold is created so the proposal starts from
confirmed requirements instead of carrying forward known gaps.

## Scope

**In scope:**
- Refine the `roadmap-recommend` planning contract so it must surface open
  questions before scaffolding
- Require the skill to ask for explicit user answers or confirmation before it
  creates `.spec-driven/changes/<name>/`
- Allow recommended answers, while making clear they are suggestions only and
  do not resolve the question by themselves
- Update the `skills/roadmap-recommend/SKILL.md` instructions to match the
  refined contract

**Out of scope:**
- Changing `roadmap-propose` or other planning skills
- Changing `spec-driven-apply`, `spec-driven-auto`, or execution-stage question
  gates
- Redesigning `questions.md` format or the CLI scaffold/verify mechanics

## Unchanged Behavior

Behaviors that must not change as a result of this change (leave blank if nothing is at risk):
- `roadmap-recommend` still recommends only work that already appears under a
  milestone `## Planned Changes` section
- The skill still recommends a single next candidate and still requires an
  explicit checkpoint before any scaffolding occurs
- The change continues to be planning-only and does not implement product code
