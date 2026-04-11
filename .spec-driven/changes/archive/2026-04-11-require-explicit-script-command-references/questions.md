# Questions: require-explicit-script-command-references

## Open

<!-- Add open questions here using the format below -->
<!-- - [ ] Q: <question text> -->
<!--   Context: <why this matters / what depends on the answer> -->

## Resolved

<!-- Resolved questions are moved here with their answers -->
<!-- - [x] Q: <question text> -->
<!--   Context: <why this matters> -->
<!--   A: <answer from human> -->

- [x] Q: Does this change need new CLI behavior?
  Context: The issue is that skills sometimes refer to validators or audits without naming the concrete script command.
  A: No. This change only requires explicit command references in skill prompts and validation coverage where practical.
