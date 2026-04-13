# Quick Start

[中文](QUICKSTART.zh.md)

### 1. Install

**Option A: via [skills.sh](https://skills.sh) (recommended — no extra files in your project)**

```bash
npx skills add kw12121212/auto-spec-driven
```

When prompted, select the AI tools you actually use. Prefer the shared/global scope to avoid duplicating skill files in each project.

**Option B: from source (for development or live-edit)**

```bash
git clone https://github.com/kw12121212/auto-spec-driven ~/Code/auto-spec-driven
cd ~/Code/auto-spec-driven
npm install && npm run build
bash install.sh          # global, all CLIs
```

For CLI-specific install, see [README.md](README.md#quick-start).

### 2. Initialize Your Project

```bash
cd /path/to/your/project
/spec-driven-init
```

This creates `.spec-driven/` with `config.yaml`, `roadmap/`, `specs/`, and `changes/`.

Fill in `config.yaml` with your project context — this is injected into every skill prompt.

### 3. Start Your First Change

**For small, well-scoped changes (one-shot):**

```bash
/spec-driven-auto add user login feature
```

This runs the full workflow automatically: propose → apply → verify → review → archive.

**For regular tickets with defined requirements:**

```bash
/spec-driven-propose add user login feature    # scaffold change artifacts
/spec-driven-apply                              # implement tasks one by one
/spec-driven-verify                             # check completion & spec alignment
/spec-driven-review                             # code quality review
/spec-driven-archive                            # merge delta specs → archive
```

**For quick fixes without a formal change:**

```bash
/spec-driven-simple-task fix typo in README.md
```

### 4. What Happens Next

| Step | What Gets Created |
|------|-------------------|
| `propose` | `.spec-driven/changes/<name>/` with `proposal.md`, `specs/`, `design.md`, `tasks.md`, `questions.md` |
| `apply` | Tasks implemented, delta specs updated, tasks marked `[x]` |
| `verify` | Validates artifact format, task completion, spec alignment |
| `archive` | Delta specs merged into main `specs/`, change moved to `archive/YYYY-MM-DD-<name>/` |

### 5. Common Commands Reference

| Command | Use When |
|---------|----------|
| `/spec-driven-auto <task>` | Small, clear-scope change — one command does everything |
| `/spec-driven-propose` | Start a formal change with full artifacts |
| `/spec-driven-apply` | Implement tasks in a proposed change |
| `/spec-driven-verify` | Check if a change is complete and correct |
| `/spec-driven-review` | Review code quality before archiving |
| `/spec-driven-archive` | Merge specs and archive a completed change |
| `/spec-driven-simple-task <task>` | Quick fix, debug, doc tweak — no formal change |
| `/spec-driven-brainstorm <idea>` | Fuzzy concept that needs discussion first |
| `/spec-driven-sync-specs` | Code has drifted ahead of specs — catch them up |
| `/spec-driven-init` | First time setup in a new project |
| `/roadmap-plan` | Create milestone-based long-term planning |
| `/roadmap-recommend` | Get the next roadmap-backed change recommendation |
