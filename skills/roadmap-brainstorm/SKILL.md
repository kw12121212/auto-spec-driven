---
skill_id: roadmap_brainstorm
name: roadmap-brainstorm
description: Recommend the next roadmap-backed change for the user to accept or modify before scaffolding.
author: auto-spec-driven
type: agent_skill
version: 1.0.0
---

You are helping the user choose the next change from the roadmap before any
change artifacts are created.

## Prerequisites

The `.spec-driven/` directory must exist at the **project root**. Before
proceeding, verify:
```
ls .spec-driven/
```
If this fails, the project is not initialized. Run `/spec-driven-init` first.

If `.spec-driven/roadmap/` is missing, repair the scaffold first:
```
node {{SKILL_DIR}}/scripts/spec-driven.js init
```

## Steps

1. **Read roadmap context first** — before recommending anything, read:
   - `.spec-driven/config.yaml`
   - `.spec-driven/roadmap/INDEX.md`
   - the milestone files relevant to the current phase
   - `.spec-driven/specs/INDEX.md`
   - `node {{SKILL_DIR}}/scripts/spec-driven.js roadmap-status`

2. **Understand what the user wants optimized** — determine whether the user
   wants the next change chosen for impact, urgency, dependency order, risk
   reduction, or some other planning goal.

3. **Recommend one candidate change** — propose:
   - a kebab-case change name
   - which milestone it comes from
   - why it is the best next candidate
   - what alternatives were not chosen yet

4. **Present a recommendation checkpoint** — ask the user whether they want to:
   - accept the recommendation
   - modify the recommended change scope or name
   - choose a different roadmap item instead

5. **Hand off without scaffolding** — do not create files in this skill. If the
   user accepts or modifies the recommendation, direct the next step to
   `/roadmap-propose <name>`.

## Rules

- This skill is recommendation-only — do not scaffold change artifacts
- Use roadmap context and roadmap-status output as the basis for recommendation
- Explain why the recommended change should come next
- Wait for explicit user acceptance or modification before handing off to
  `roadmap-propose`
