---
mapping:
  implementation:
    - skills/spec-driven-resync-code-mapping/SKILL.md
    - skills/spec-driven-verify/SKILL.md
    - skills/spec-driven-review/SKILL.md
    - skills/spec-driven-auto/SKILL.md
    - test/validate-skills.ts
  tests:
    - test/run.js
    - test/validate-skills.ts
---

# Skills Workflow

## ADDED Requirements

### Requirement: skills-use-explicit-script-command-references
When a skill instructs the agent to run a repository CLI command, the skill MUST
name the concrete command invocation rather than referring only to a generic
validator, audit command, script, or CLI step.

If the command is expected to run through the shared spec-driven CLI, the skill
MUST reference the concrete script path and subcommand, such as
`node {{SKILL_DIR}}/scripts/spec-driven.js verify-spec-mappings`, instead of a
generic phrase like "rerun the CLI mapping validator".

#### Scenario: skill-names-concrete-mapping-validator-command
- GIVEN a skill instructs the agent to validate spec mappings
- WHEN it describes that step in the skill prompt
- THEN it names the concrete command invocation
- AND it does not rely only on a generic phrase such as "run the validator"

#### Scenario: skill-names-concrete-audit-command
- GIVEN a skill instructs the agent to compare evidence against mappings
- WHEN it describes that step in the skill prompt
- THEN it names the concrete audit command invocation
- AND it does not rely only on a generic phrase such as "use the audit output"
