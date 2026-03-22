# Install Behavior

### Requirement: global-install-destination
The installer MUST copy skills to `~/.slim-spec-driven/skills/<name>/` by default.
Each skill directory contains `SKILL.md` and a `scripts/` directory.

### Requirement: cli-symlinks
The installer MUST create symlinks from CLI-specific directories into the agent store:
- `~/.claude/skills/<name>` → `~/.slim-spec-driven/skills/<name>` for Claude Code
- `~/.config/opencode/skills/<name>` → `~/.slim-spec-driven/skills/<name>` for OpenCode

### Requirement: cli-targeting
The `--cli` flag restricts which CLI symlinks are created.
- `--cli claude`: only `~/.claude/skills/`
- `--cli opencode`: only `~/.config/opencode/skills/`
- Default (no flag): both CLIs

### Requirement: project-install
With `--project [path]`, skills MUST install to `.agent/skills/` under the given path,
with symlinks in `.claude/skills/` and `.opencode/skills/` within the same path.
Running with `--project` on a directory without `.spec-driven/` initializes it automatically.

### Requirement: uninstall
The `--uninstall` flag MUST remove all CLI symlinks created by the installer.
Copied agent store directories are only removed if they contain no unexpected files.
