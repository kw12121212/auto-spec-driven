# Design: require-explicit-script-command-references

## Approach

Add a skills-workflow requirement that concrete CLI invocations must be named at
the point where the skill asks the agent to run them. Then update the affected
skill prompts, starting with mapping-related skills, so each validator or audit
step includes the exact `node {{SKILL_DIR}}/scripts/spec-driven.js <subcommand>`
form instead of relying on shorthand labels.

## Key Decisions

- Treat this as a prompt-quality and workflow-contract change, not a CLI change.
- Scope the requirement to repository CLI commands mentioned inside skills.
- Preserve existing command behavior; only make the references explicit.

## Alternatives Considered

- Rely on earlier command examples in the same skill.
  Rejected because later shorthand references are easy for agents to lose.
- Document the command paths only in README.
  Rejected because the failure happens inside the skill prompt, where the command
  must be actionable without outside inference.
