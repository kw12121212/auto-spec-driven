# Delta: Skills Roadmap

## ADDED Requirements

### Requirement: roadmap-brainstorm-recommends-the-next-change-from-roadmap-context
`roadmap-brainstorm` MUST analyze roadmap milestone context and recommend a next
change candidate for the user to consider. The recommendation MUST identify the
proposed change name, the milestone it comes from, and why it is a good next
step.

#### Scenario: recommend-a-planned-change
- GIVEN a milestone contains multiple `Planned Changes`
- WHEN `roadmap-brainstorm` is used
- THEN it recommends one candidate change and explains the recommendation before
  any scaffolding occurs

### Requirement: roadmap-brainstorm-hands-off-to-roadmap-propose
After the user accepts or revises the recommendation, `roadmap-brainstorm`
MUST direct the workflow toward `roadmap-propose` for actual change scaffolding
rather than creating the change itself.
