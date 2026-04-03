# Delta: Skills Roadmap

## MODIFIED Requirements

### Requirement: roadmap-plan-builds-or-restructures-milestones
Previously: `roadmap-plan` MUST help the user create or restructure the roadmap
into milestone files with explicit phase goals, milestone boundaries, and
planned changes. Before writing or rewriting roadmap assets, it MUST read
`.spec-driven/config.yaml`, any existing roadmap files, relevant specs, and the
currently active or archived changes needed to understand the repository's
present state.

When a planned change is complex enough that one summary line would leave the
handoff underspecified, `roadmap-plan` SHOULD add indented continuation lines
under that planned change entry to capture milestone-local detail.

`roadmap-plan` MUST help the user create or restructure the roadmap
into milestone files with explicit phase goals, milestone boundaries, and
planned changes. Before writing or rewriting roadmap assets, it MUST read
`.spec-driven/config.yaml`, any existing roadmap files, relevant specs, and the
currently active or archived changes needed to understand the repository's
present state.

When existing milestone files use an older structure, such as an extra
`## Candidate Ideas` section, a combined `## Dependencies / Risks` section, or
missing `## In Scope`, `## Out of Scope`, or `## Notes` sections,
`roadmap-plan` MAY migrate them into the canonical milestone format during
restructuring. It MUST preserve clearly recoverable content, rewrite the file
into the current standard section set, and avoid silently inventing ambiguous
content.

When the legacy source supports a confident mapping, `roadmap-plan` MUST map
that content into the canonical sections conservatively. When no canonical
section is an exact fit but the content is still worth preserving,
`roadmap-plan` MAY preserve that context in `## Notes` instead of dropping it.

When the legacy source does not support a confident split into the new milestone
sections, `roadmap-plan` MUST surface that ambiguity in the planning discussion
instead of pretending the migration is exact.

### Requirement: roadmap-milestone-refines-one-milestone-without-collapsing-the-roadmap
Previously: `roadmap-milestone` MUST focus on one milestone at a time. It MUST
refine that milestone's goal, done criteria, planned changes, dependencies, and
risks without collapsing multiple milestones into one oversized document.

When a planned change needs more than the canonical first line to capture useful
planning context, `roadmap-milestone` SHOULD add indented continuation lines
that stay attached to that planned change entry.

`roadmap-milestone` MUST focus on one milestone at a time. It MUST
refine that milestone's goal, done criteria, planned changes, dependencies, and
risks without collapsing multiple milestones into one oversized document.

When the user wants to migrate only one legacy milestone instead of
restructuring the wider roadmap, `roadmap-milestone` MAY be used as a narrower
fallback path. When used that way, it MUST preserve clearly recoverable content
and surface ambiguity instead of pretending the migrated structure is exact.

#### Scenario: roadmap-plan-migrates-legacy-milestone-during-restructure
- GIVEN a roadmap contains a milestone file that uses an older section shape
- WHEN `roadmap-plan` restructures the roadmap
- THEN it may rewrite that milestone into the canonical milestone format
- AND it preserves clearly recoverable intent from the legacy file

#### Scenario: roadmap-plan-surfaces-legacy-migration-ambiguity
- GIVEN a legacy milestone does not clearly distinguish scope, risks, or notes
- WHEN `roadmap-plan` prepares the migrated roadmap shape
- THEN it surfaces that ambiguity in the planning discussion
- AND it does not silently claim an exact migration

#### Scenario: roadmap-plan-preserves-unmapped-legacy-context-in-notes
- GIVEN a legacy milestone contains context that does not cleanly map to another
  canonical section
- WHEN `roadmap-plan` rewrites that milestone into the canonical format
- THEN it preserves that context in `## Notes`
- AND it does not silently drop the information
