---
name: skill-derive-template
description: 針對既有 skill 的指定 SOP 流程步驟，將步驟內文中的產出物格式描述抽取成樣板組（骨架與範例兩個 TemplateFile），或為該步驟新增按需載入的樣板組，並同步更新載入步驟，使其同時提名骨架與範例的路徑；當使用者要求為某一步驟抽取、建立或補上樣板（extract template、add template to a step）時，必須使用本 skill。只修改樣板組內容而不改載入步驟時改用 skill-form-template；要展開的是條列判準而非格式樣板時改用 skill-derive-rule。
---

# SOP

## Phase 1 -- 定位樣板展開點

1. `READ` 使用者需求、目標 skill 的 `SKILL.md`，以及目標 skill `templates/` 底下的既有樣板組（不存在就略過）。
2. `READ` 本 skill 的 `rules/derive-template-rule.md` 的所有 Rule，建立展開檢查清單。
3. `THINK` 依已載入的展開檢查清單確定目標步驟並判斷是否適用樣板組；不適用時進入步驟 4，適用時進入步驟 5。
4. `WRITE` 向使用者說明目標步驟不適用樣板組的原因與建議改用的 skill，然後停止執行。
5. `THINK` 依已載入的展開檢查清單確定展開模式，列出缺少的資訊；沒有缺漏時進入步驟 8。
6. `WRITE` 向使用者詢問步驟 5 列出的缺少資訊。
7. `CHECK` 使用者回覆是否補齊缺少資訊；已補齊時回到步驟 5，仍有缺漏時返回步驟 6，使用者表示無法提供時停止執行。
8. `THINK` 依已載入的展開檢查清單設計展開方案。

完成條件：已產出符合展開檢查清單的展開方案。

## Phase 2 -- 確認展開方案

1. `WRITE` 向使用者展示展開方案。
2. `CHECK` 使用者是否確認展開方案；要求調整時依回覆回到 Phase 1 步驟 8，使用者放棄時停止執行。

完成條件：使用者已確認展開方案。

## Phase 3 -- 寫入與驗證

1. `DELEGATE` 使用 `skill-form-template`，依已確認的展開方案建立或修改目標樣板組的骨架與範例。
2. `DELEGATE` 使用 `skill-form-sop`，依已確認的展開方案更新目標 `SKILL.md` 的載入步驟與目標步驟內文。
3. `CHECK` 逐條驗證展開檢查清單；若有任一項未通過，修正後重新檢查。

完成條件：目標樣板組的骨架與範例、目標 `SKILL.md` 均已寫入，且展開檢查清單均已通過。
