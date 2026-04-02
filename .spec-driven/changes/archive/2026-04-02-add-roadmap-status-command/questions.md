# Questions: add-roadmap-status-command

## Open

## Resolved

- [x] Q: Should the first script-assisted roadmap sync command write files automatically?
  Context: The main design choice is whether to ship a reporting command or a mutating sync command first.
  A: No. Start with a read-only reporting command and leave roadmap edits to the skill.
