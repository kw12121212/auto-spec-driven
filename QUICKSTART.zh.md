# 快速开始

[English](QUICKSTART.md) | 中文

### 1. 安装

**方式 A：通过 [skills.sh](https://skills.sh) 安装（推荐 — 不在项目中产生额外文件）**

```bash
npx skills add kw12121212/auto-spec-driven
```

按提示选择你实际使用的 AI 工具即可。安装范围建议选择公共/全局安装，避免在每个项目里重复生成 skills 文件。

**方式 B：从源码安装（用于开发或实时编辑）**

```bash
git clone https://github.com/kw12121212/auto-spec-driven ~/Code/auto-spec-driven
cd ~/Code/auto-spec-driven
npm install && npm run build
bash install.sh          # 全局，所有 CLI
```

按 CLI 安装的详细说明，见 [README.zh.md](README.zh.md#快速开始)。

### 2. 初始化项目

```bash
cd /path/to/your/project
/spec-driven-init
```

这会在项目根目录创建 `.spec-driven/`，包含 `config.yaml`、`roadmap/`、`specs/` 和 `changes/`。

填写 `config.yaml` 中的项目上下文信息——这段内容会被注入到每个 skill 提示词中。

### 3. 开始第一个变更

**小型、范围清晰的改动（一键完成）：**

```bash
/spec-driven-auto 添加用户登录功能
```

自动执行完整流程：propose → apply → verify → review → archive。

**需求明确的普通 ticket：**

```bash
/spec-driven-propose 添加用户登录功能    # 生成变更 artifacts
/spec-driven-apply                        # 逐任务实现
/spec-driven-verify                       # 检查完成度与规格对齐
/spec-driven-review                       # 代码质量审查
/spec-driven-archive                      # 合并规格并归档
```

**无需正式变更的快速修复：**

```bash
/spec-driven-simple-task 修复 README 里的拼写错误
```

### 4. 流程说明

| 步骤 | 产生的结果 |
|------|-----------|
| `propose` | 在 `.spec-driven/changes/<name>/` 下创建 `proposal.md`、`specs/`、`design.md`、`tasks.md`、`questions.md` |
| `apply` | 任务被实现，delta specs 被更新，任务标记为 `[x]` |
| `verify` | 验证产物格式、任务完成情况、规格对齐状态 |
| `archive` | delta specs 合并回主 `specs/`，变更移入 `archive/YYYY-MM-DD-<name>/` |

### 5. 常用命令速查

| 命令 | 使用场景 |
|------|---------|
| `/spec-driven-auto <任务>` | 小型、范围清晰——一条命令搞定全部流程 |
| `/spec-driven-propose` | 启动一个带完整产物的正式变更 |
| `/spec-driven-apply` | 实现已提议变更中的任务 |
| `/spec-driven-verify` | 检查变更是否完整且正确 |
| `/spec-driven-review` | 归档前的代码质量审查 |
| `/spec-driven-archive` | 合并规格并归档已完成变更 |
| `/spec-driven-simple-task <任务>` | 快速修复、调试、文档调整——不走正式变更流程 |
| `/spec-driven-brainstorm <想法>` | 模糊概念，需要先讨论再确定范围 |
| `/spec-driven-sync-specs` | 代码已经领先于规格——补齐规格 |
| `/spec-driven-init` | 在新项目中首次初始化 |
| `/roadmap-plan` | 创建基于里程碑的长期规划 |
| `/roadmap-recommend` | 获取下一个 roadmap 推荐变更 |
