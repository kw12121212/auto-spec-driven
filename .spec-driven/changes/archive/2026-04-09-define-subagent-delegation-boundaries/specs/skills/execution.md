# Delta: Skills Execution

## ADDED Requirements

### Requirement: review-and-verify-may-delegate-evidence-gathering
`spec-driven-review` and `spec-driven-verify` MAY delegate bounded evidence
gathering or preliminary findings work to a sub-agent when that helps reduce
context load.

Allowed delegated work includes:
- identifying likely changed files or tests that need inspection
- collecting implementation evidence for completed tasks
- drafting candidate findings with file references and rationale

Those skills MUST keep the following work in the parent agent:
- deciding the final blocking tiers or review severities to report
- producing the final user-facing `CRITICAL/WARNING/SUGGESTION` or
  `MUST FIX/SHOULD FIX/NITS` report
- deciding whether the change is ready for the next workflow step

Delegated findings MAY inform the result, but the parent agent MUST review the
relevant repository evidence before presenting them as final findings.

#### Scenario: verify-uses-sidecar-evidence-with-parent-owned-verdict
- GIVEN `spec-driven-verify` delegates task-to-file evidence gathering
- WHEN it prepares the final verification report
- THEN the parent agent decides which items are `CRITICAL`, `WARNING`, or
  `SUGGESTION`
- AND it does not treat the delegated draft as the final verdict by itself

#### Scenario: review-uses-sidecar-findings-with-parent-owned-severity
- GIVEN `spec-driven-review` delegates an initial pass over changed files
- WHEN it issues the final review report
- THEN the parent agent decides which findings are `MUST FIX`,
  `SHOULD FIX`, or `NITS`
- AND it remains responsible for the final archive recommendation
