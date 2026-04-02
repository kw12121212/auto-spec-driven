# Delta: Scripts Behavior

## MODIFIED Requirements

### Requirement: init-bootstraps-project
`spec-driven.js init [path]` MUST create or repair `.spec-driven/` at the given
path (or CWD). If `.spec-driven/` does not exist, it creates all scaffold files
from scratch, including `.spec-driven/roadmap/INDEX.md` and
`.spec-driven/roadmap/milestones/`. If `.spec-driven/` already exists, it
creates any missing files/directories without overwriting existing ones. In both
cases, it regenerates `specs/INDEX.md` to list all `.md` files currently present
under `specs/` (excluding `INDEX.md` itself and `README.md`), and exits 0.

Previously: `init` only required `config.yaml`, `specs/`, and `changes/`
scaffold files/directories.
