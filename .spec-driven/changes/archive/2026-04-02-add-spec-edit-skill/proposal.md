# add-spec-edit-skill

## What

Add a new skill `spec-driven-spec-edit` that allows creating or modifying individual main spec files under `.spec-driven/specs/` directly, without going through the change workflow. This is for quick corrections — fixing typos, correcting inaccurate requirements, or adding missing spec entries that were accidentally omitted.

## Why

Currently, modifying a main spec file always requires going through the full change workflow (propose → apply → verify → review → archive). For simple corrections like fixing a typo in a requirement, correcting an inaccurate description, or adding a missing spec entry, this overhead is excessive. The existing `spec-driven-spec-content` skill only edits delta specs within a change, and `spec-driven-sync-specs` creates a full change for code-to-spec drift. Neither provides a lightweight path for direct spec fixes.

## Scope

**In scope:**
- New skill file `skills/spec-driven-spec-edit/SKILL.md`
- Update `skills/planning.md` spec to add requirements for the new skill
- Update `install.sh` to include the new skill in the SKILLS array
- Update `config.yaml` context to mention the new skill count
- Update `.spec-driven/specs/INDEX.md` if needed

**Out of scope:**
- Changes to any existing skills
- Changes to CLI scripts (this skill has no new script subcommands)
- Changes to the change workflow itself

## Key Decisions

- **修改前必须确认**：技能在展示将要做的具体修改内容后，必须等待用户明确确认才会真实写入文件。不允许静默修改。
- **直接编辑主 spec**：与 `spec-driven-spec-content`（编辑变更内的 delta spec）不同，本技能直接编辑 `.spec-driven/specs/` 下的主 spec 文件，适用于轻量纠错场景。
- **不涉及变更工作流**：不创建也不操作 `.spec-driven/changes/`。
- **规划层技能**：与 `spec-driven-init`、`spec-driven-spec-content` 一样，不修改产品代码。

## Unchanged Behavior

- All existing skills continue to work unchanged
- The change workflow (propose → apply → verify → review → archive) is unchanged
- `spec-driven-spec-content` continues to route spec content into delta files within changes
- `spec-driven-sync-specs` continues to create dedicated changes for code-to-spec drift
- No new script subcommands are added
