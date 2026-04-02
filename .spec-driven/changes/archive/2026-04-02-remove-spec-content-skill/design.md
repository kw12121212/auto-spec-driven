# Design: remove-spec-content-skill

## Approach

1. 删除 `spec-driven-spec-content` 技能目录
2. 从所有活跃文档和规格中移除引用
3. 增强 `spec-driven-modify`：在编辑完成后增加验证步骤，确保制品格式正确
4. 补齐 `spec-driven-spec-edit` 在 CLAUDE.md、README 等文档中的引用

## Key Decisions

- **不迁移功能**：`spec-content` 的功能已被 `modify`（delta spec）和 `spec-edit`（主 spec）完全覆盖，无需迁移
- **modify 增加验证**：参照 `spec-content` 原有的验证步骤（编辑后跑 verify），给 `modify` 也加上同样的验证，确保编辑后制品格式正确
- **测试替换**：将 `test/run.sh` 中 `spec-content` 的安装测试替换为 `spec-edit` 的安装测试
- **归档变更不修改**：`.spec-driven/changes/archive/` 中的历史记录保持原样

## Alternatives Considered

- **保留 spec-content 但标记为废弃**：不推荐，废弃技能仍然增加认知负担
- **合并 spec-content 到 modify 中作为子模式**：不需要，modify 已经能编辑 delta spec
