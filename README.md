# spec-driven

A lightweight spec-driven development framework: 7 Claude skills + thin TypeScript scaffolding.

## Quick Start

**One-line install (curl):**
```bash
# Global — works for both Claude Code and OpenCode
curl -fsSL https://raw.githubusercontent.com/kw12121212/slim-spec-driven/main/install.sh | bash

# Project-local (.claude/skills/ — works for both CLIs)
curl -fsSL https://raw.githubusercontent.com/kw12121212/slim-spec-driven/main/install.sh | bash -s -- --project

# Target a specific CLI or path
curl -fsSL .../install.sh | bash -s -- --cli claude
curl -fsSL .../install.sh | bash -s -- --cli opencode
curl -fsSL .../install.sh | bash -s -- --project /path/to/project
```

**From source (for development or live-edit):**
```bash
git clone https://github.com/kw12121212/slim-spec-driven ~/Code/slim-spec-driven
cd ~/Code/slim-spec-driven
npm install && npm run build

bash install.sh                                  # global, both CLIs (~/.claude/skills/)
bash install.sh --cli claude                     # global, Claude Code only
bash install.sh --cli opencode                   # global, OpenCode only (~/.config/opencode/skills/)
bash install.sh --project                        # project-local in CWD (.claude/skills/)
bash install.sh --project /path/to/project       # project-local at specified path
```

**CLI install targets:**

| `--cli` | Global | Project-local |
|---------|--------|---------------|
| `all` (default) | `~/.claude/skills/` | `.claude/skills/` |
| `claude` | `~/.claude/skills/` | `.claude/skills/` |
| `opencode` | `~/.config/opencode/skills/` | `.opencode/skills/` |

> `~/.claude/skills/` is read by both Claude Code and OpenCode, so `--cli all` installs once and works everywhere.

## Skills

| Skill | What it does |
|-------|-------------|
| `/spec-driven-init` | Initialize `.spec-driven/` in a project and fill config.yaml |
| `/spec-driven-propose` | Scaffold a new change: proposal.md, specs/delta.md, design.md, tasks.md |
| `/spec-driven-modify` | Edit an existing change artifact |
| `/spec-driven-apply` | Implement tasks one by one, marking each complete; update delta spec |
| `/spec-driven-verify` | Check completion, implementation evidence, and spec alignment |
| `/spec-driven-archive` | Merge delta specs into specs/, then move change to archive/ |
| `/spec-driven-cancel` | Permanently delete an in-progress change (with confirmation) |

## Workflow

```
init → propose → modify → apply → verify → archive
```

1. **init** a project to create `.spec-driven/` with config.yaml and specs/
2. **propose** a change to scaffold all four artifacts
3. **modify** artifacts to refine the plan
4. **apply** to implement tasks (marks `- [x]` as each completes; keeps delta spec accurate)
5. **verify** to check implementation matches the proposal and specs
6. **archive** to merge delta specs into `specs/` and move the change to `changes/archive/YYYY-MM-DD-<name>/`

## Project Structure

After running `/spec-driven-propose` in a project, you get:

```
.spec-driven/
├── config.yaml          # Project context and rules
├── specs/               # Current-state specs (what the system does)
└── changes/
    ├── <change-name>/
    │   ├── proposal.md      # What & why
    │   ├── specs/
    │   │   └── delta.md     # Spec changes (ADDED/MODIFIED/REMOVED Requirements)
    │   ├── design.md        # How (approach, decisions)
    │   └── tasks.md         # Implementation checklist
    └── archive/             # Completed changes
```

## Spec Format

Specs use a structured format with RFC 2119 keywords:

```markdown
### Requirement: <name>
The system MUST/SHOULD/MAY <observable behavior>.

#### Scenario: <name>
- GIVEN <precondition>
- WHEN <action>
- THEN <expected outcome>
```

Delta specs (`specs/delta.md`) use `## ADDED Requirements`, `## MODIFIED Requirements`, and `## REMOVED Requirements` sections. At archive time, these are merged into the main `specs/` collection.

## Scripts

Scripts handle filesystem mechanics only — skills handle intelligent content.
All subcommands run as `node dist/scripts/spec-driven.js <cmd>` from the project root.

```bash
node dist/scripts/spec-driven.js propose <name>  # Create change scaffold
node dist/scripts/spec-driven.js modify [name]   # List changes or show artifact paths
node dist/scripts/spec-driven.js apply <name>    # Parse tasks.md → JSON status
node dist/scripts/spec-driven.js verify <name>   # Validate artifact format → JSON
node dist/scripts/spec-driven.js archive <name>  # Move to archive/YYYY-MM-DD-<name>/
node dist/scripts/spec-driven.js cancel <name>   # Delete change (no archive)
node dist/scripts/spec-driven.js init [path]     # Bootstrap .spec-driven/ scaffold
```

## Initialize a Project

```bash
/spec-driven-init
```

Or directly:

```bash
node dist/scripts/spec-driven.js init /your/project
# Then edit /your/project/.spec-driven/config.yaml to add project context
```
