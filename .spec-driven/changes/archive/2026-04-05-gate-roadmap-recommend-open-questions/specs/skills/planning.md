# Delta: Skills Planning

## MODIFIED Requirements

### Requirement: roadmap-recommend-confirms-before-scaffolding
Previously: `roadmap-recommend` MUST recommend a candidate change name and explain the
reasoning, summarize the intended roadmap-backed change, and wait for the user
to accept or modify the recommendation before it scaffolds proposal artifacts.

`roadmap-recommend` MUST recommend a candidate change name and explain the
reasoning, summarize the intended roadmap-backed change, and wait for the user
to accept or modify the recommendation before it scaffolds proposal artifacts.

If the recommendation discussion reveals one or more open questions that affect
scope, behavior, or other proposal-shaping decisions, `roadmap-recommend` MUST
surface those questions and obtain explicit user answers or confirmation before
it scaffolds proposal artifacts.

`roadmap-recommend` MAY recommend a preferred answer, but it MUST present that
recommendation as a suggestion only. It MUST NOT treat its own recommendation as
the resolved answer or continue to scaffolding until the user has explicitly
confirmed the resolution.
