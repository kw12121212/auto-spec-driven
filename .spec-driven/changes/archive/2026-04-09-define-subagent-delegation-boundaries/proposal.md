# define-subagent-delegation-boundaries

## What

Define when spec-driven skills may use sub-agents and where delegation must
stop.

This change introduces an explicit workflow contract for bounded sub-agent
delegation, then applies that contract to the highest-value analysis-heavy
skills:
- `roadmap-plan`
- `roadmap-milestone`
- `roadmap-recommend`
- `spec-driven-propose`
- `spec-driven-review`
- `spec-driven-verify`

The parent agent may delegate narrow analysis work such as candidate
comparison, context synthesis, changed-file inventory, evidence gathering, or
draft findings. The parent agent must still own any user-facing confirmation
gate, proposal scaffolding, workflow-state edits, and final recommendation or
verdict.

## Why

The current framework says a lot about what each skill must read, when it must
stop for the user, and which files it may write, but it says nothing about
delegation. That leaves two failure modes:

- agents may avoid delegation entirely even when a skill is dominated by heavy
  read-only analysis
- agents may over-delegate and let a sub-agent cross boundaries that should
  stay with the parent agent, such as confirmation checkpoints or final
  workflow decisions

The repository now has several skills where sub-agents would be useful, but
only for bounded sidecar work. The framework needs a clear contract so the
benefit is available without weakening source-of-truth, confirmation, or
artifact integrity rules.

## Scope

**In scope:**
- Add a workflow-level rule describing when a skill may delegate work to a
  sub-agent and which responsibilities must remain with the parent agent
- Define planning-skill delegation boundaries for `roadmap-plan`,
  `roadmap-milestone`, `roadmap-recommend`, and `spec-driven-propose`
- Define review/verification delegation boundaries for
  `spec-driven-review` and `spec-driven-verify`
- Update the affected skill prompts so their concrete instructions match the
  new delegation rules
- Document the intended delegation pattern in README guidance if the user-facing
  workflow description currently implies all work stays inside one agent

**Out of scope:**
- Changing CLI script behavior or adding any new script subcommands
- Allowing sub-agents to bypass user confirmation, scaffold changes on their
  own, archive changes, or mutate workflow state without parent-agent review
- Defining general sub-agent behavior for `spec-driven-apply`,
  `spec-driven-auto`, `spec-driven-archive`, or `spec-driven-cancel`
- Redesigning the existing change, spec, or roadmap artifact formats

## Unchanged Behavior

Behaviors that must not change as a result of this change (leave blank if nothing is at risk):
- Current user confirmation gates remain mandatory wherever the workflow
  already requires them
- The current change artifacts, main specs, and repository state remain the
  source of truth rather than delegated chat output
- Planning skills still do planning only; they do not implement product code
- `spec-driven-review` and `spec-driven-verify` still produce the same final
  user-facing report shapes and archive blockers
