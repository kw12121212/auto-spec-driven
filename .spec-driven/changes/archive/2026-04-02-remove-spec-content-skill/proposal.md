# remove-spec-content-skill

## What

全面删除 `spec-driven-spec-content` 技能。`spec-driven-modify` 已能编辑变更内的 delta spec 文件，`spec-driven-spec-edit` 已能直接编辑主 spec 文件。`spec-content` 的功能完全被这两个技能覆盖，不再有独立存在的价值。

同时补齐 `spec-driven-spec-edit` 的相关文档引用，并为 `spec-driven-modify` 增加编辑后验证步骤。

## Why

`spec-driven-spec-content` 是 `spec-driven-modify` 的功能子集——专门针对 delta spec 的路由工具。现在 `spec-driven-modify` 已能编辑 delta spec，`spec-driven-spec-edit` 能直接编辑主 spec，`spec-content` 成为冗余技能。保留它只会增加维护负担和使用时的选择困惑。

## Scope

**In scope:**
- 删除 `skills/spec-driven-spec-content/` 目录
- 从 `install.sh` SKILLS 数组中移除
- 从 `planning.md` 中移除 3 条 `spec-content-*` 需求规格
- 从 `workflow.md` 中移除对 `spec-content` 的引用
- 更新 `config.yaml` 中的技能数量和列表
- 更新 `CLAUDE.md`（技能数量 16→15，补充 `spec-edit` 到工作流列表）
- 更新 `README.md` 中所有 `spec-content` 引用
- 更新 `README.zh.md` 中所有 `spec-content` 引用
- 为 `spec-driven-modify` SKILL.md 增加验证步骤
- 在 `planning.md` 中为 `spec-driven-modify` 增加 `modify-validates-after-editing` 需求规格
- 更新 `test/run.sh` 中 `spec-content` 相关的安装测试

**Out of scope:**
- 修改 CLI 脚本
- 修改其他技能的逻辑
- 修改归档变更中的历史记录

## Unchanged Behavior

- `spec-driven-modify` 编辑 delta spec 的核心能力不变
- `spec-driven-spec-edit` 直接编辑主 spec 的能力不变
- `spec-driven-sync-specs` 创建变更同步代码与 spec 的能力不变
- 所有 CLI 子命令不变
