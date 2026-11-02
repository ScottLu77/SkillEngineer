---
name: extract-skill-rule
description: 為目標 skill 的流程步驟建立 rules/ 規則檔時必須使用此 skill。
---

## SOP

### Phase 1 -- 判定規則候選

1. READ 讀取傳入的來源 skill 路徑下的 `SKILL.md` 與 `rules/` 下所有檔案 (以下稱來源 skill)、傳入的目標 skill 路徑 (未傳入時同來源 skill 路徑) 下的 `SKILL.md` (以下稱目標 skill)、本 skill 的 `rules/rule-candidate-rule.md` 與 `rules/rule-rule.md`, 到下一步。
2. RUN 執行本 skill 的 `scripts/find-signal-sentences.sh`, 分別傳入目標與來源 skill 的 `SKILL.md` (路徑相同時只傳一次), 到下一步。
3. THINK 參考第 2 步的輸出與本 skill 的 `rules/rule-candidate-rule.md`, 為目標 skill 的 `SKILL.md`、來源 skill 的 `SKILL.md` 與來源 skill 的 `rules/` 寫出判定清單; 若有規則候選, 則到 Phase 2; 否則到下一步。
4. TELL 告知使用者沒有規則候選, 並列出判定為指引的條目, 結束本 skill。

### Phase 2 -- 撰寫規則檔

1. READ 讀取本 skill 的 `rules/rule-rule.md` 與 `templates/rule.md`, 到下一步。
2. THINK 合併判定清單: 同一 <部分> 的相同要求併成一條; 要求衝突時依目標 skill 的 `SKILL.md`、來源 skill 的 `rules/`、來源 skill 的 `SKILL.md` 的順序取前者; 找出每個 <產出物> 在目標 skill 的 `SKILL.md` 中產出它的步驟 (以下稱產出步驟), 找不到產出步驟的 <產出物> 標為未使用, 到下一步。
3. RUN 將目標 skill 現有的 `rules/` 搬到 `.claude/skills/temp/<目標 skill 名稱>-old-rules/` (沒有時略過), 到下一步。
4. WRITE 參考本 skill 的 `rules/rule-rule.md` 與 `templates/rule.md`, 將未標為未使用的條目寫成目標 skill 的 `rules/<產出物>-rule.md`, 同一 <部分> 寫成同一個 Rule, 範例條目與內嵌範例放入對應 Rule 的 example (刪改與 MUST 衝突的內容, 缺少的依 MUST 補寫), 到 Phase 3。

### Phase 3 -- 套用規則到目標 SKILL.md

1. WRITE 修改目標 skill 的 `SKILL.md`: (a) 判定為規則候選的原句換成「參考本 skill 的 `rules/<產出物>-rule.md`」(同一步驟已有此引用時只刪原句; 被刪的是步驟的主要操作時, 留下一個不含訊號字的動詞短語) (b) 其餘產出步驟補上同樣的引用 (c) 指向舊規則檔的引用改成對應的新規則檔, 沒有對應時移除 (d) 來源 skill 有而目標 skill 沒有的指引併入相關步驟, 與目標 skill 衝突的除外, 到下一步。
2. WRITE 在引用規則檔卻未讀取它的 Phase 開頭補上 READ 步驟, 並調整受影響的步驟編號與去向, 到 Phase 4。

### Phase 4 -- 檢查產出物

1. READ 讀取本 skill 的 `rules/rule-candidate-rule.md`、`rules/rule-rule.md` 與 `templates/rule.md`, 到下一步。
2. RUN 執行本 skill 的 `scripts/find-signal-sentences.sh`, 傳入修改後的目標 skill 的 `SKILL.md`, 到下一步。
3. THINK 審核目標 skill: (a) 第 2 步輸出與 `SKILL.md` 其餘句子都不能判為 `規則候選`, 也不與規則檔的 MUST 衝突 (b) 判定清單中未標為未使用的規則候選與範例都已進入規則檔, 或在合併時併入、捨棄 (c) 每個規則檔都被 `SKILL.md` 引用, 每個產出步驟都引用對應的規則檔, `SKILL.md` 引用的檔案都存在 (d) 每個規則檔都符合本 skill 的 `rules/rule-rule.md` 全部 MUST (e) 每個 Phase 內的步驟編號從 1 開始連續, 每個去向都指向存在的步驟或 Phase (f) 來源與目標 skill 不同時, 來源 skill 的檔案都未被修改; 若有不通過處, 則到下一步; 否則到第 5 步。
4. WRITE 修正不通過處, 回第 2 步。
5. TELL 告知使用者寫入的規則檔、舊規則檔備份位置、被移除的原句、併入步驟的指引、捨棄的衝突要求、從來源 skill 新增的規則、補寫或刪改的 example、標為未使用的 <產出物>, 結束本 skill。
