## ADDED Requirements

### Requirement: simple-task-operates-outside-change-lifecycle
`spec-driven-simple-task` operates as an ad-hoc task execution skill outside
the normal change lifecycle. It MAY implement product code changes directly
but MUST NOT create, modify, or archive any entries under
`.spec-driven/changes/`. When its work reveals spec drift or a real change
need, it MUST suggest the appropriate existing skill rather than entering
the change workflow itself.
