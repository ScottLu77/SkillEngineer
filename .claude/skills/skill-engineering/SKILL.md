---
name: skill-engineering
description: 建立新 skill 或修改舊 skill 時必須使用此 skill。
---

## SOP

### Phase 1 -- 釐清需求

1. READ 讀取舊 skill 目錄下所有檔案 (不存在就略過), 到下一步。
2. READ 讀取本 skill 的 `rules/outline-rule.md`、`rules/constraint-list-rule.md`, 到下一步。
3. THINK 整理以下項目, 答不出的標「待補」:
   - skill 名稱
   - 觸發條件
   - 流程大綱 (遵守本 skill 的 `rules/outline-rule.md`)
   - 約束清單 (遵守本 skill 的 `rules/constraint-list-rule.md`)

   到下一步。
4. ASK 列出以上項目, 請使用者補齊並確認; 若有修改, 則到第 3 步; 否則到 Phase 2。

### Phase 2 -- 撰寫 SKILL.md

1. READ 讀取本 skill 的 `templates/sop.md`、`rules/sop-rule.md`、`rules/rule-rule.md`, 到下一步。
2. WRITE 依據 skill 名稱和觸發條件、遵守本 skill 的 `templates/sop.md`, 建立 `.claude/skills/temp/<skill-name>/SKILL.md` (這個目錄以下稱草稿), 到下一步。
3. WRITE 依據流程大綱 (每個步驟寫成一個 Phase) 和約束清單、遵守本 skill 的 `rules/sop-rule.md`, 寫草稿 `SKILL.md` 的 `## SOP`; 若發現約束清單需要修改, 則到 Phase 1 第 3 步; 否則到 Phase 3。

### Phase 3 -- 撰寫規則檔

1. THINK 判斷約束清單中是否有放在規則檔的項目; 若有, 則到下一步; 否則到 Phase 4。
2. WRITE 依據這些項目、遵守本 skill 的 `rules/rule-rule.md`, 在草稿寫入一個規則檔 `rules/<主題>-rule.md`; 若還有規則檔要寫, 則到第 2 步; 否則到 Phase 4。

### Phase 4 -- 檢查草稿

1. THINK 遵守本 skill 的 `templates/sop.md`、`rules/sop-rule.md`、`rules/rule-rule.md`、`rules/constraint-list-rule.md` 檢查草稿:
   - 流程大綱的每個步驟都有對應的 Phase
   - 約束清單中放在 `SOP` 的項目都已寫入 `SKILL.md`, 且 `SKILL.md` 沒有混入應放在規則檔的約束
   - 約束清單中放在規則檔的項目都已寫入規則檔, 且規則檔沒有混入應放在 `SOP` 的約束
   - `SKILL.md` 提到的規則檔與實際檔案一致

   若需要修改, 則到下一步; 否則到第 4 步。
2. ASK 列出待修正項目, 請使用者確認, 到下一步。
3. WRITE 依確認結果修正一個檔案; 若還有檔案要修正, 則到第 3 步; 否則到第 1 步。
4. TELL 告知使用者草稿位於 `.claude/skills/temp/<skill-name>/`, 不搬回正式位置, 請使用者自行 review 後處理, 結束本 skill。