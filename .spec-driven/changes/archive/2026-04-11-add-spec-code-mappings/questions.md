# Questions: add-spec-code-mappings

## Open

<!-- No open questions -->

## Resolved

- [x] Q: Should spec-code relationships be many-to-many?
  A: Yes. A spec file may map to multiple implementation and test files, and a
  repository file may be mapped by multiple spec files.
- [x] Q: Where should mapping data live?
  A: In YAML frontmatter at the top of each spec file, not in an external
  traceability artifact.
- [x] Q: Should implementation code and tests be separated?
  A: Yes. The mapping uses separate `mapping.implementation` and
  `mapping.tests` arrays.
- [x] Q: Should the CLI validate mapping format?
  A: Yes. It should return JSON errors that identify what is wrong.
- [x] Q: What granularity should mappings use?
  A: File-level paths only; symbol, range, and line-level mappings are out of
  scope for the first version.
- [x] Q: Is a dedicated skill needed for old spec remapping and mapping repair?
  A: Yes. Add `spec-driven-remap-specs` to retrofit legacy specs, correct stale
  mappings, and fix frontmatter format errors without changing implementation
  behavior.
