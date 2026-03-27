# spec-driven

A lightweight spec-driven development framework: 11 agent skills + thin TypeScript scaffolding.

## How It Helps AI Programming

AI coding agents are capable but tend to drift — they lose track of existing behavior, expand scope, make inconsistent decisions, and leave no record of why things were built a certain way. spec-driven addresses this with three layers of structure.

### Layer 1: `specs/` — the system's long-term memory

Instead of reading the entire codebase to understand what the system does, the AI reads `specs/`:

- `INDEX.md` navigates the full spec collection at a glance
- Each spec file describes observable behavior using RFC 2119 format (`### Requirement:`, GIVEN/WHEN/THEN scenarios)
- `brainstorm`, `propose`, `apply`, and `spec-content` are required to read INDEX.md and the relevant spec files before generating anything

This prevents the AI from introducing conflicting or duplicate behavior — it knows what already exists.

### Layer 2: change artifacts — structured context per change

Every change is a folder with five files, each serving a distinct purpose:

| File | Content | Effect on AI |
|------|---------|--------------|
| `proposal.md` | What & Why | Constrains the AI to the stated goal |
| `specs/` | Delta (ADDED/MODIFIED/REMOVED) | Makes spec intent explicit, not implicit |
| `design.md` | How — approach and decisions | Prevents the AI from reinventing the approach mid-task |
| `tasks.md` | `- [ ]` checklist | Controls pace — one task at a time, marked complete immediately |
| `questions.md` | Open/resolved Q&A | Centralizes ambiguities; open questions block apply and archive |

### Layer 3: 11 skills — explicit constraints on AI behavior

Each skill is a precise prompt that specifies:
- Exactly which files to read (no vague "read the codebase")
- What to do and what not to do (`propose` does not touch code; `apply` marks tasks complete one at a time)
- Hard rules enforced by the verify script (spec format violations block archive)

The TypeScript CLI handles all filesystem operations; the AI handles content and judgment.

### Problems solved

| Problem | Solution |
|---------|----------|
| AI doesn't know existing system behavior | `specs/` with INDEX.md gives structured, navigable system state |
| AI expands scope | `proposal.md` defines explicit scope; `tasks.md` controls steps |
| AI does too much at once | `apply` enforces one task at a time, marked immediately |
| Specs drift from code over time | Delta specs travel with each change; archive force-merges them back |
| Past decisions are lost | `design.md` records rationale; `archive/` preserves the full change history |
| Spec quality is inconsistent | RFC 2119 + Requirement/Scenario format enforced; violations are errors, not warnings |

---

## vs. OpenSpec

[OpenSpec](https://github.com/Fission-AI/OpenSpec/) is the most prominent project in this space (33K stars). The core idea is the same: a change folder with proposal, specs, design, and tasks. The differences are in enforcement and philosophy.

| | spec-driven | OpenSpec |
|--|-------------|----------|
| Spec format | RFC 2119 enforced — `### Requirement:` + MUST/SHOULD/MAY + GIVEN/WHEN/THEN; violations are script errors | No required format |
| AI reads existing specs | Explicit: `brainstorm`, `propose`, `apply`, and `spec-content` must read INDEX.md then every relevant spec file before generating anything | "Searches existing specs" (vague) |
| Delta spec structure | Mirrors `specs/` by path — `changes/<name>/specs/auth/login.md` maps to `specs/auth/login.md` | Not path-bound |
| Archive spec merge | Hard gate: merge each delta file by path into main `specs/` using ADDED/MODIFIED/REMOVED markers before moving | File organization only |
| Runtime dependencies | Node.js stdlib only — one ~640-line TypeScript file | Global npm package (`npm install -g`, Node 20.19+) |
| Project-level AI rules | `config.yaml` rules injected into every skill prompt | None |
| Philosophy | Enforcement over flexibility — constraints are the point | "Fluid not rigid" |
| Tool support | Claude Code, OpenCode | 30+ AI tools |

**When to use spec-driven**: you want the AI constrained by a spec standard it cannot silently ignore, and you're working in Claude Code or OpenCode.

**When to use OpenSpec**: you use multiple AI tools, prefer minimal process friction, or want a larger community.

---

## Quick Start

**Install via [skills.sh](https://skills.sh) (recommended — no extra files in your project):**
```bash
npx skills add kw12121212/slim-spec-driven
```

When prompted by `skills`, select the AI tools you actually use. For installation scope, prefer the shared/global option so you avoid duplicating skill files inside each project.

**From source (for development or live-edit):**
```bash
git clone https://github.com/kw12121212/slim-spec-driven ~/Code/slim-spec-driven
cd ~/Code/slim-spec-driven
npm install && npm run build

bash install.sh                                  # global, all CLIs
bash install.sh --cli claude                     # global, Claude Code only (~/.claude/skills/)
bash install.sh --cli opencode                   # global, OpenCode only (~/.config/opencode/skills/)
bash install.sh --cli trae                       # global, Trae only (~/.trae/skills/)
bash install.sh --cli codex                      # global, Codex via ~/.agents/skills/
bash install.sh --cli gemini                     # global, Gemini CLI via ~/.agents/skills/
bash install.sh --project                        # project-local in CWD
bash install.sh --project /path/to/project       # project-local at specified path
```

**CLI install targets:**

| `--cli` | Global | Project-local |
|---------|--------|---------------|
| `all` (default) | `~/.claude/skills/` + `~/.config/opencode/skills/` + `~/.trae/skills/` + `~/.agents/skills/` | `.claude/skills/` + `.opencode/skills/` + `.trae/skills/` + `.codex/skills/` + `.gemini/skills/` + `.agents/skills/` |
| `claude` | `~/.claude/skills/` | `.claude/skills/` |
| `opencode` | `~/.config/opencode/skills/` | `.opencode/skills/` |
| `trae` | `~/.trae/skills/` | `.trae/skills/` |
| `codex` | `~/.agents/skills/` | `.codex/skills/` |
| `gemini` | `~/.agents/skills/` | `.gemini/skills/` |

## Three Workflows

Choose based on the nature of your task:

| Scenario | Workflow | Command |
|----------|----------|---------|
| Small issue, clear scope | **auto** (one-shot) | `/spec-driven-auto add user avatar` |
| Regular ticket, defined requirements | **propose → apply → verify → archive** | `/spec-driven-propose` → `/spec-driven-apply` → ... |
| Fuzzy concept, needs exploration | **brainstorm → propose → apply → ...** | `/spec-driven-brainstorm` → confirm → `/spec-driven-apply` → ... |

### 1. Auto Workflow (Small Issues)

For small, well-scoped changes — single feature, few files, no cross-cutting concerns:

```bash
/spec-driven-auto add user avatar upload
```

Runs propose → apply → verify → review → archive with one confirmation checkpoint. Falls back to step-by-step if scope is too large or vague.

### 2. Standard Workflow (Regular Tickets)

For typical tasks with clear requirements but non-trivial implementation:

```
/spec-driven-propose add order tracking
/spec-driven-apply
/spec-driven-verify
/spec-driven-archive
```

Use `/spec-driven-modify` to adjust artifacts mid-flight, `/spec-driven-spec-content` to place spec content correctly.

### 3. Brainstorm Workflow (Fuzzy Concepts)

For exploratory work where scope, approach, or even the problem itself is unclear:

```
/spec-driven-brainstorm improve task planning for large changes
```

This enters a discussion phase — reads context, helps narrow scope and tradeoffs, proposes a change name. After explicit confirmation, it generates the same five artifacts as `/spec-driven-propose`, then you proceed with the standard workflow.

---

## Full Workflow Reference

```
init → [brainstorm] → propose → apply → verify → archive
```

1. **init** — create `.spec-driven/` with config.yaml, specs/INDEX.md, and specs/
2. **brainstorm** — discuss a rough idea, converge on scope, and confirm a proposed change name before scaffolding
3. **propose** — read existing specs, scaffold all five artifacts, populate delta specs
4. **apply** — implement tasks one by one; update delta specs to match what was built
5. **verify** — check task completion, implementation evidence, spec format, and alignment
6. **archive** — merge delta specs into `specs/` by file path, update INDEX.md, move to archive/

Use **modify** to refine any artifact mid-flight. Use **spec-content** when the content is clear but the correct spec category/file is not. Use **cancel** to abandon a change.

## Skills

| Skill | What it does |
|-------|-------------|
| `/spec-driven-brainstorm` | Discuss a rough idea, converge on scope and a change name, then generate the full five-artifact proposal after confirmation |
| `/spec-driven-init` | Initialize `.spec-driven/` in a project and fill config.yaml |
| `/spec-driven-propose` | Read existing specs, scaffold a new change with all five artifacts |
| `/spec-driven-modify` | Edit an existing change artifact |
| `/spec-driven-spec-content` | Read `specs/INDEX.md`, classify spec content, and place it in the correct delta spec file |
| `/spec-driven-apply` | Implement tasks one by one, update delta specs when done |
| `/spec-driven-verify` | Check completion, implementation evidence, and spec alignment |
| `/spec-driven-review` | Review a completed change for code quality before archive |
| `/spec-driven-archive` | Merge delta specs into specs/, update INDEX.md, move to archive/ |
| `/spec-driven-cancel` | Permanently delete an in-progress change (with confirmation) |
| `/spec-driven-auto` | Run full workflow automatically (propose → apply → verify → review → archive) with one confirmation checkpoint. Best for small, well-scoped changes. |

### Auto Workflow

`/spec-driven-auto` is a convenience for small, well-defined changes:

```bash
/spec-driven-auto add user avatar upload
```

**Suitable when:**
- Change touches ≤3 modules and ≤10 files
- No database migrations, auth/payments, or cross-service coordination
- Scope is specific and bounded

**Rejects and falls back to step-by-step when:**
- Scope is vague ("refactor the codebase")
- Change is large or cross-cutting
- High-risk areas (auth, payments, multi-repo)

The only mandatory checkpoint is after the proposal — everything else runs automatically unless blocked.

### Brainstorm Workflow

`/spec-driven-brainstorm` is the discussion-first entrypoint for fuzzy requests:

```bash
/spec-driven-brainstorm improve task planning for large changes
```

It reads project context and relevant specs, helps narrow scope and tradeoffs,
proposes a kebab-case change name, and waits for explicit confirmation before it
creates the same five proposal artifacts as `/spec-driven-propose`.

## Project Structure

```
.spec-driven/
├── config.yaml              # Project context and rules (injected into every skill)
├── specs/
│   ├── INDEX.md             # Top-level index of all spec files
│   ├── README.md            # Spec format and conventions
│   └── <category>/          # One directory per domain area
│       └── <topic>.md       # Requirements in RFC 2119 format
└── changes/
    ├── <change-name>/
    │   ├── proposal.md      # What & why
    │   ├── specs/           # Delta specs mirroring specs/ structure
    │   │   └── <category>/
    │   │       └── <topic>.md  # ADDED / MODIFIED / REMOVED Requirements
    │   ├── design.md        # How (approach, decisions, alternatives)
    │   ├── tasks.md         # Implementation checklist
    │   └── questions.md     # Open questions and resolved Q&A
    └── archive/             # Completed changes (YYYY-MM-DD-<name>/)
```

## Spec Format

```markdown
### Requirement: <name>
The system MUST/SHOULD/MAY <observable behavior>.

#### Scenario: <name>
- GIVEN <precondition>
- WHEN <action>
- THEN <expected outcome>
```

**Keywords**: MUST = required, SHOULD = recommended, MAY = optional (RFC 2119).

Delta specs use `## ADDED Requirements`, `## MODIFIED Requirements`, `## REMOVED Requirements`. At archive time each delta file is merged into its corresponding main spec file by matching `### Requirement: <name>`.

## Scripts

Scripts handle filesystem mechanics only — skills handle intelligent content.

```bash
node dist/scripts/spec-driven.js propose <name>  # Create change scaffold
node dist/scripts/spec-driven.js modify [name]   # List changes or show artifact paths
node dist/scripts/spec-driven.js apply <name>    # Parse tasks.md → JSON status
node dist/scripts/spec-driven.js verify <name>   # Validate artifact format → JSON
node dist/scripts/spec-driven.js archive <name>  # Move to archive/YYYY-MM-DD-<name>/
node dist/scripts/spec-driven.js cancel <name>   # Delete change (no archive)
node dist/scripts/spec-driven.js init [path]     # Bootstrap .spec-driven/ scaffold
node dist/scripts/spec-driven.js migrate [path]  # Migrate openspec/ artifacts
node dist/scripts/spec-driven.js list            # List all changes (active + archived)
```

---

## 中文说明

一个轻量级的规范驱动开发框架：11 个 AI 技能 + 精简的 TypeScript 脚手架。

### 它如何帮助 AI 编程

AI 编程助手虽然强大，但容易失控——忘记已有行为、随意扩展范围、做出不一致的决定，且不留决策记录。spec-driven 通过三层结构解决这个问题。

#### 第一层：`specs/` — 系统的长期记忆

AI 不需要阅读整个代码库来理解系统行为，只需阅读 `specs/`：

- `INDEX.md` 一目了然地导航所有规范
- 每个规范文件使用 RFC 2119 格式（`### Requirement:`、GIVEN/WHEN/THEN 场景）描述可观测行为
- `brainstorm`、`propose`、`apply` 和 `spec-content` 必须先阅读 INDEX.md 和相关规范文件，然后才能生成任何内容

这防止 AI 引入冲突或重复的行为。

#### 第二层：变更产物 — 每个变更的结构化上下文

每个变更是一个包含五个文件的文件夹，各司其职：

| 文件 | 内容 | 对 AI 的作用 |
|------|------|-------------|
| `proposal.md` | 做什么 & 为什么 | 将 AI 约束在声明的目标内 |
| `specs/` | 增量规范（ADDED/MODIFIED/REMOVED） | 让规范意图显式化 |
| `design.md` | 怎么做——方案和决策 | 防止 AI 在执行中途偏离方案 |
| `tasks.md` | `- [ ]` 清单 | 控制节奏——一次一个任务，完成后立即标记 |
| `questions.md` | 待解决/已解决的问答 | 集中管理疑点；未解决的问题会阻止 apply 和 archive |

#### 第三层：11 个技能 — 对 AI 行为的显式约束

每个技能是一个精确的提示词，指定：
- 精确读取哪些文件（不使用模糊的"阅读代码库"）
- 做什么和不能做什么（`propose` 不碰代码；`apply` 逐个完成任务）
- 由验证脚本强制执行的硬性规则（规范格式违规会阻止归档）

TypeScript CLI 处理所有文件系统操作；AI 负责内容和判断。

### 解决的问题

| 问题 | 解决方案 |
|------|---------|
| AI 不了解已有系统行为 | `specs/` + INDEX.md 提供结构化、可导航的系统状态 |
| AI 随意扩展范围 | `proposal.md` 定义明确范围；`tasks.md` 控制步骤 |
| AI 一次做太多事 | `apply` 强制逐个任务执行，完成后立即标记 |
| 规范与代码逐渐脱节 | 增量规范随变更走；归档时强制合并回主规范 |
| 过去的决策丢失 | `design.md` 记录决策理由；`archive/` 保留完整变更历史 |
| 规范质量不一致 | RFC 2119 + Requirement/Scenario 格式强制执行；违规是错误而非警告 |

---

### 快速开始

**通过 [skills.sh](https://skills.sh) 安装（推荐——项目中不产生额外文件）：**
```bash
npx skills add kw12121212/slim-spec-driven
```

**从源码安装（用于开发或实时编辑）：**
```bash
git clone https://github.com/kw12121212/slim-spec-driven ~/Code/slim-spec-driven
cd ~/Code/slim-spec-driven
npm install && npm run build
bash install.sh                    # 全局安装到所有 CLI
bash install.sh --cli claude       # 仅安装到 Claude Code
bash install.sh --project          # 项目本地安装
```

### 三种工作流

| 场景 | 工作流 | 命令 |
|------|--------|------|
| 小问题，范围明确 | **自动**（一键完成） | `/spec-driven-auto 添加用户头像` |
| 常规任务，需求明确 | **标准**（逐步推进） | `/spec-driven-propose` → `/spec-driven-apply` → ... |
| 模糊概念，需要探索 | **头脑风暴**（先讨论再执行） | `/spec-driven-brainstorm` → 确认 → `/spec-driven-apply` → ... |

### 完整工作流

```
init → [brainstorm] → propose → apply → verify → archive
```

1. **init** — 创建 `.spec-driven/`，包含 config.yaml、specs/INDEX.md 和 specs/
2. **brainstorm** — 讨论粗略想法，收敛范围，确认变更名称后再生成产物
3. **propose** — 阅读已有规范，生成所有五个产物
4. **apply** — 逐个实现任务；完成后更新增量规范
5. **verify** — 检查任务完成情况、实现证据和规范一致性
6. **archive** — 将增量规范合并到 `specs/`，更新 INDEX.md，移动到 archive/

使用 **modify** 在执行过程中修改产物。使用 **spec-content** 将规范内容放入正确的文件。使用 **cancel** 放弃变更。

## License

[Apache License 2.0](LICENSE)
