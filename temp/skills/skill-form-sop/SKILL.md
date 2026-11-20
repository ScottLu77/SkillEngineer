---
name: skill-form-sop
description: 當要撰寫或修改 skill 的 SKILL.md 中 SOP 流程（Phase、步驟、完成條件與部位載入步驟）時，必須使用本 skill。
---

# SOP

## Phase 1 -- 理解與設計

1. `READ` 使用者需求，以及要修改的目標 skill 的 `SKILL.md` 及其 SOP 流程載入的 RuleFile and TemplateFile (不存在就略過)，確認目標 skill 的目的、輸入、輸出與限制。
2. `READ` 本 skill 的 `rules/SOP-rule.md` 及 `rules/reference-rule.md` 的所有 Rule，建立完成檢查清單。
3. `THINK` 依已載入的完成檢查清單，將工作拆成 Phase、步驟與完成條件。

完成條件：已定義符合完成檢查清單的 SOP 結構。

## Phase 2 -- 寫入與驗證

1. `WRITE` 依已載入的完成檢查清單，在目標 `SKILL.md` 建立或更新 `# SOP` section。
2. `CHECK` 逐條驗證完成檢查清單；若有任一項未通過，修正後重新檢查。

完成條件：所有檢查項目均已通過。
