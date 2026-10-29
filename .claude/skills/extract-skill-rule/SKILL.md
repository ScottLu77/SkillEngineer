---
name: extract-skill-rule
description: 為目標 skill 的流程步驟建立 rules/ 規則檔時必須使用此 skill。
---

## SOP

### Phase 1 -- 判定規則候選

1. READ 讀取傳入路徑下的 skill (以下稱目標 skill) 的 `SKILL.md` 與 `rules/` 下所有檔案, 到下一步。
2. READ 讀取本 skill 的 `rules/rule-candidate-rule.md`, 到下一步。
3. DELEGATE 分派給本 skill 的 `scripts/find-signal-sentences.sh`, 傳入目標 skill 的 `SKILL.md`, 到下一步。
4. THINK 參考第 3 步的輸出與本 skill 的 `rules/rule-candidate-rule.md` 寫出判定清單; 若有規則候選, 則到 Phase 2; 否則到下一步。
5. TELL 告知使用者目標 skill 沒有規則候選, 結束本 skill。

### Phase 2 -- 撰寫規則檔

1. READ 讀取本 skill 的 `rules/rule-rule.md` 與 `templates/rule.md`, 到下一步。
2. WRITE 參考本 skill 的 `rules/rule-rule.md` 與 `templates/rule.md`, 將判定清單中的規則候選依 <產出物> 寫入目標 skill 的 `rules/<產出物>-rule.md`, 同一 <部分> 寫成同一個 Rule; 檔案已存在時, 同 <部分> 的 MUST 併入既有 Rule, 新 <部分> 接續最後一個 Rule 編號, 到下一步。
3. WRITE 將判定為規則候選的內嵌範例搬成對應 Rule 的 Good example, 到 Phase 3。

### Phase 3 -- 精簡 SKILL.md

1. WRITE 將目標 skill 的 `SKILL.md` 中判定為規則候選的原句換成「參考本 skill 的 `rules/<產出物>-rule.md`」(同一步驟已有此引用時只刪除原句), 到下一步。
2. WRITE 在引用規則檔卻未讀取它的 Phase 開頭補上 READ 步驟, 並調整受影響的步驟編號與去向, 到 Phase 4。

### Phase 4 -- 檢查產出物

1. DELEGATE 分派給本 skill 的 `scripts/find-signal-sentences.sh`, 傳入修改後的目標 skill 的 `SKILL.md`, 到下一步。
2. THINK 參考本 skill 的 `rules/rule-candidate-rule.md`、`rules/rule-rule.md` 與 `templates/rule.md` 審核目標 skill: (a) 第 1 步輸出的每一行都對應判定清單中的 `流程` 或 `指引` 條目, 且 `SKILL.md` 中沒有任何一句可依 `rules/rule-candidate-rule.md` Rule 2 判為 `規則候選` (b) 每筆規則候選都已寫成規則檔中的 MUST (c) 每個規則檔都被 `SKILL.md` 引用 (d) 每個新增或修改的規則檔都符合本 skill 的 `rules/rule-rule.md` 全部 MUST (e) 每筆內嵌範例的規則候選都已成為某個 Rule 的 Good example (f) `SKILL.md` 每個 Phase 內的步驟編號從 1 開始連續, 且每個去向都指向存在的步驟或 Phase; 若有不通過處, 則到下一步; 否則到第 4 步。
3. WRITE 修正不通過處, 回第 1 步。
4. TELL 告知使用者新增或修改的規則檔與 `SKILL.md` 中被移除的原句, 結束本 skill。
