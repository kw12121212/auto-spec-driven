# spec-driven

轻量级规范驱动开发框架：7 个 Claude 技能 + 少量 TypeScript 脚手架。

## 快速开始

**一行安装（curl）：**
```bash
# 全局安装 — 同时支持 Claude Code 和 OpenCode
curl -fsSL https://raw.githubusercontent.com/kw12121212/slim-spec-driven/main/install.sh | bash

# 项目本地安装（.claude/skills/ — 两个 CLI 均支持）
curl -fsSL https://raw.githubusercontent.com/kw12121212/slim-spec-driven/main/install.sh | bash -s -- --project

# 指定 CLI 或路径
curl -fsSL .../install.sh | bash -s -- --cli claude
curl -fsSL .../install.sh | bash -s -- --cli opencode
curl -fsSL .../install.sh | bash -s -- --project /path/to/project
```

**从源码安装（用于开发或实时编辑）：**
```bash
git clone https://github.com/kw12121212/slim-spec-driven ~/Code/slim-spec-driven
cd ~/Code/slim-spec-driven
npm install && npm run build

bash install.sh                                  # 全局，两个 CLI（~/.claude/skills/）
bash install.sh --cli claude                     # 全局，仅 Claude Code
bash install.sh --cli opencode                   # 全局，仅 OpenCode（~/.config/opencode/skills/）
bash install.sh --project                        # 项目本地，当前目录（.claude/skills/）
bash install.sh --project /path/to/project       # 项目本地，指定路径
```

**卸载：**
```bash
npm run uninstall-skills           # 全局卸载
npm run uninstall-skills:project   # 项目本地卸载
```

**安装目标说明：**

| `--cli` | 全局路径 | 项目本地路径 |
|---------|---------|------------|
| `all`（默认） | `~/.claude/skills/` | `.claude/skills/` |
| `claude` | `~/.claude/skills/` | `.claude/skills/` |
| `opencode` | `~/.config/opencode/skills/` | `.opencode/skills/` |

> `~/.claude/skills/` 同时被 Claude Code 和 OpenCode 读取，因此 `--cli all` 安装一次即可在两处生效。

## 技能列表

| 技能 | 功能 |
|------|------|
| `/spec-driven-init` | 在项目中初始化 `.spec-driven/` 目录，创建 config.yaml |
| `/spec-driven-propose` | 为新变更生成 proposal.md、design.md、tasks.md 脚手架 |
| `/spec-driven-modify` | 编辑现有变更的某个 artifact |
| `/spec-driven-apply` | 逐一实现任务，完成后立即标记 |
| `/spec-driven-verify` | 检查实现完整性和 spec 对齐情况 |
| `/spec-driven-archive` | 将已完成的变更移至 archive/ |
| `/spec-driven-cancel` | 永久删除一个进行中的变更（需确认） |

## 工作流

```
init → propose → modify → apply → verify → archive
```

1. **init** — 在项目中初始化 `.spec-driven/` 并填写项目上下文
2. **propose** — 生成变更 artifacts 脚手架
3. **modify** — 调整计划内容
4. **apply** — 实现各任务（完成一个标记一个 `- [x]`）
5. **verify** — 验证实现是否符合提案
6. **archive** — 将变更移至 `changes/archive/YYYY-MM-DD-<name>/`

如需放弃进行中的变更，使用 **cancel**（不可恢复）。

## 项目结构

运行 `/spec-driven-init` 后，项目会生成：

```
.spec-driven/
├── config.yaml          # 项目上下文与规则
├── specs/               # 当前状态规格（系统现在做什么）
└── changes/
    ├── <change-name>/
    │   ├── proposal.md  # 什么 & 为什么
    │   ├── design.md    # 如何实现（方案、决策）
    │   └── tasks.md     # 实现清单
    └── archive/         # 已完成的变更
```

## 脚本参考

脚本只负责文件系统操作，智能内容由技能生成。

```bash
node dist/scripts/init.js [path]      # 初始化 .spec-driven/ 目录
node dist/scripts/propose.js <name>   # 创建变更脚手架
node dist/scripts/modify.js [name]    # 列出变更或显示 artifact 路径
node dist/scripts/apply.js <name>     # 解析 tasks.md → JSON 状态
node dist/scripts/verify.js <name>    # 验证 artifact 格式 → JSON
node dist/scripts/archive.js <name>   # 移至 archive/YYYY-MM-DD-<name>/
node dist/scripts/cancel.js <name>    # 永久删除变更目录
```
