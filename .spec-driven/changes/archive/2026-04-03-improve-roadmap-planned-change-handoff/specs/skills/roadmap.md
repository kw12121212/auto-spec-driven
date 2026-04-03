# Delta: Skills Roadmap

## MODIFIED Requirements

### Requirement: roadmap-propose-promotes-planned-changes-into-normal-changes
Previously: `roadmap-propose` MUST turn a milestone `Planned Changes` item into a normal
change scaffold under `.spec-driven/changes/<name>/`. It MUST require the target
work item to already appear under a milestone `## Planned Changes` section
before scaffolding.

`roadmap-propose` MUST turn a milestone `Planned Changes` item into a normal
change scaffold under `.spec-driven/changes/<name>/`. It MUST require the target
work item to already appear under a milestone `## Planned Changes` section
before scaffolding.

When the selected planned change entry includes indented continuation lines,
`roadmap-propose` MUST read that attached detail block and use it as planning
input while drafting the change proposal artifacts.

### Requirement: roadmap-recommend-recommends-the-next-change-from-roadmap-context
Previously: `roadmap-recommend` MUST analyze roadmap milestone context and recommend a next
change candidate for the user to consider. The recommendation MUST identify the
proposed change name, the milestone it comes from, and why it is a good next
step. The recommended candidate MUST already exist under a milestone
`## Planned Changes` section.

`roadmap-recommend` MUST analyze roadmap milestone context and recommend a next
change candidate for the user to consider. The recommendation MUST identify the
proposed change name, the milestone it comes from, and why it is a good next
step. The recommended candidate MUST already exist under a milestone
`## Planned Changes` section.

When the recommended planned change entry includes indented continuation lines,
`roadmap-recommend` MUST use that attached detail block while explaining the
recommendation and while summarizing the proposed roadmap-backed change before
scaffolding.

### Requirement: roadmap-plan-builds-or-restructures-milestones
Previously: `roadmap-plan` MUST help the user create or restructure the roadmap
into milestone files with explicit phase goals, milestone boundaries, and
planned changes. Before writing or rewriting roadmap assets, it MUST read
`.spec-driven/config.yaml`, any existing roadmap files, relevant specs, and the
currently active or archived changes needed to understand the repository's
present state.

`roadmap-plan` MUST help the user create or restructure the roadmap
into milestone files with explicit phase goals, milestone boundaries, and
planned changes. Before writing or rewriting roadmap assets, it MUST read
`.spec-driven/config.yaml`, any existing roadmap files, relevant specs, and the
currently active or archived changes needed to understand the repository's
present state.

When a planned change is complex enough that one summary line would leave the
handoff underspecified, `roadmap-plan` SHOULD add indented continuation lines
under that planned change entry to capture milestone-local detail.

### Requirement: roadmap-milestone-refines-one-milestone-without-collapsing-the-roadmap
Previously: `roadmap-milestone` MUST focus on one milestone at a time. It MUST
refine that milestone's goal, done criteria, planned changes, dependencies, and
risks without collapsing multiple milestones into one oversized document.

`roadmap-milestone` MUST focus on one milestone at a time. It MUST
refine that milestone's goal, done criteria, planned changes, dependencies, and
risks without collapsing multiple milestones into one oversized document.

When a planned change needs more than the canonical first line to capture useful
planning context, `roadmap-milestone` SHOULD add indented continuation lines
that stay attached to that planned change entry.

#### Scenario: roadmap-propose-uses-planned-change-detail-block
- GIVEN a milestone planned change entry has a canonical first line plus
  indented detail lines
- WHEN `roadmap-propose` scaffolds that change
- THEN it uses the detail block as planning input for the generated proposal
  artifacts

#### Scenario: roadmap-recommend-uses-planned-change-detail-block
- GIVEN a recommended roadmap item has a canonical first line plus indented
  detail lines
- WHEN `roadmap-recommend` explains why it should come next
- THEN the recommendation summary uses that detail block as supporting context
