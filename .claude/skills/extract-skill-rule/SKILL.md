---
name: extract-skill-rule
description: 為目標 skill 的流程步驟建立 rules/ 規則檔時必須使用此 skill。
---

## SOP

### Phase 1 -- 判定規則候選

1. READ 讀取傳入的來源 skill 路徑下的 `SKILL.md` 與 `rules/` 下所有檔案 (以下稱來源 skill), 到下一步。
2. READ 讀取本 skill 的 `rules/rule-candidate-rule.md`, 到下一步。
3. DELEGATE 分派給本 skill 的 `scripts/find-signal-sentences.sh`, 傳入來源 skill 的 `SKILL.md`, 到下一步。
4. THINK 參考第 3 步的輸出與本 skill 的 `rules/rule-candidate-rule.md` 寫出判定清單; 若有規則候選或來源 skill 的 `rules/` 下有檔案, 則到 Phase 2; 否則到下一步。
5. TELL 告知使用者來源 skill 沒有規則候選, 結束本 skill。

### Phase 2 -- 撰寫規則檔

1. READ 讀取傳入的目標 skill 路徑 (未傳入時同來源 skill 路徑) 下的 `SKILL.md` (以下稱目標 skill), 與本 skill 的 `rules/rule-rule.md`、`templates/rule.md`, 到下一步。
2. THINK 對判定清單與來源 skill 的 `rules/` 中出現的每個 <產出物>, 找出目標 skill 的 `SKILL.md` 中產出它的步驟 (以下稱產出步驟), 找不到產出步驟的 <產出物> 標為未使用, 到下一步。
3. WRITE 參考本 skill 的 `rules/rule-rule.md` 與 `templates/rule.md`, 對每個未標為未使用的 <產出物>, 以來源 skill 的 `rules/<產出物>-rule.md` 為基底 (沒有此檔時從空檔起寫), 將判定清單中該 <產出物> 的規則候選寫入目標 skill 的 `rules/<產出物>-rule.md`, 同一 <部分> 的 MUST 併入同一個 Rule, 新 <部分> 接續最後一個 Rule 編號, 到下一步。
4. WRITE 將目標 skill 規則檔中與目標 skill 的 `SKILL.md` 句子衝突的 MUST, 依該句改寫, 到下一步。
5. WRITE 將判定為規則候選的內嵌範例搬成對應 Rule 的 Good example, 到 Phase 3。

### Phase 3 -- 套用規則到目標 SKILL.md

1. WRITE 將目標 skill 的 `SKILL.md` 中判定為規則候選的原句、以及與規則檔 MUST 重複的句子, 換成「參考本 skill 的 `rules/<產出物>-rule.md`」(同一步驟已有此引用時只刪除原句; 被刪的是步驟的主要操作時, 留下一個不含訊號字的動詞短語), 並在其餘產出步驟補上同樣的引用, 到下一步。
2. WRITE 在引用規則檔卻未讀取它的 Phase 開頭補上 READ 步驟, 並調整受影響的步驟編號與去向, 到 Phase 4。

### Phase 4 -- 檢查產出物

1. DELEGATE 分派給本 skill 的 `scripts/find-signal-sentences.sh`, 傳入修改後的目標 skill 的 `SKILL.md`, 到下一步。
2. THINK 參考本 skill 的 `rules/rule-candidate-rule.md`、`rules/rule-rule.md` 與 `templates/rule.md` 審核目標 skill: (a) 第 1 步輸出的每一行都不能依 `rules/rule-candidate-rule.md` Rule 2 判為 `規則候選` (b) 每筆 <產出物> 未標為未使用的規則候選都已寫成目標 skill 規則檔中的 MUST (c) 目標 skill 的每個規則檔都被其 `SKILL.md` 引用, 且每個產出步驟都引用對應的規則檔 (d) 每個新增或修改的規則檔都符合本 skill 的 `rules/rule-rule.md` 全部 MUST (e) 每筆內嵌範例的規則候選都已成為某個 Rule 的 Good example (f) `SKILL.md` 每個 Phase 內的步驟編號從 1 開始連續, 且每個去向都指向存在的步驟或 Phase (g) 目標 skill 的 `SKILL.md` 沒有句子與規則檔的 MUST 衝突 (h) 來源與目標 skill 不同時, 來源 skill 的檔案都未被修改; 若有不通過處, 則到下一步; 否則到第 4 步。
3. WRITE 修正不通過處, 回第 1 步。
4. TELL 告知使用者寫入目標 skill 的規則檔、`SKILL.md` 中被移除的原句、依目標 skill 改寫的 MUST、以及標為未使用而未寫入的 <產出物>, 結束本 skill。
