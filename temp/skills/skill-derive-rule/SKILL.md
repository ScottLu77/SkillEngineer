---
name: skill-derive-rule
description: 針對既有 skill 的指定 SOP 流程步驟，將步驟內文中的判準抽取成 RuleFile，或為該步驟新增按需載入的 RuleFile，並同步更新載入步驟；當使用者要求為某一步驟抽取、展開、補強或逐步增加規則（extract rules、add rules to a step）時，必須使用本 skill。只修改 RuleFile 內容而不改載入步驟時改用 skill-form-rule。
---

# SOP

## Phase 1 -- 定位規則展開點

1. `READ` 使用者需求、目標 skill 的 `SKILL.md`，以及目標 skill `rules/` 底下的既有 RuleFile（不存在就略過）。
2. `READ` 本 skill 的 `rules/derive-rule.md` 的所有 Rule，建立展開檢查清單。
3. `THINK` 依已載入的展開檢查清單確定目標步驟與展開模式，列出缺少的資訊；沒有缺漏時進入步驟 6。
4. `WRITE` 向使用者詢問步驟 3 列出的缺少資訊。
5. `CHECK` 使用者回覆是否補齊缺少資訊；已補齊時回到步驟 3，仍有缺漏時返回步驟 4，使用者表示無法提供時停止執行。
6. `THINK` 依已載入的展開檢查清單設計展開方案。

完成條件：已產出符合展開檢查清單的展開方案。

## Phase 2 -- 確認展開方案

1. `WRITE` 向使用者展示展開方案。
2. `CHECK` 使用者是否確認展開方案；要求調整時依回覆回到 Phase 1 步驟 6，使用者放棄時停止執行。

完成條件：使用者已確認展開方案。

## Phase 3 -- 寫入與驗證

1. `DELEGATE` 使用 `skill-form-rule`，依已確認的展開方案建立或修改目標 RuleFile。
2. `DELEGATE` 使用 `skill-form-sop`，依已確認的展開方案更新目標 `SKILL.md` 的載入步驟與目標步驟內文。
3. `CHECK` 逐條驗證展開檢查清單；若有任一項未通過，修正後重新檢查。

完成條件：目標 RuleFile 與目標 `SKILL.md` 已寫入，且展開檢查清單均已通過。
