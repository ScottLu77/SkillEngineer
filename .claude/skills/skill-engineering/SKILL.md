---
name: skill-engineering
description: 建立新 skill 或修改舊 skill 時必須使用此 skill。
---

## SOP

### Phase 1 -- 釐清需求

1. READ 讀取舊 skill 目錄下所有檔案 (不存在就略過), 到下一步。
1. READ 讀取本 skill 的 `rules/high-level-sop-rule.md`, 到下一步。
2. THINK 回答 (a) skill 名稱 (b) 觸發條件 (c) 參考本 skill 的 `rules/high-level-sop-rule.md` 寫 high-level SOP, 答不出的標「待補」, 到下一步。
3. ASK 列出 (a)~(c), 請使用者補齊並確認; 若有修改, 則回第 2 步; 否則到 Phase 2。

### Phase 2 -- 撰寫目標 skill

1. READ 讀取本 skill 的 `templates/sop.md`、`rules/sop-rule.md`, 到下一步。
2. WRITE 參考 (a)、本 skill 的 `templates/sop.md` 建立 `.claude/skills/temp/<skill-name>/SKILL.md` (以下稱目標 skill), 到下一步。
4. WRITE 填入 (a)(b) 到目標 skill 的 frontmatter, 到下一步。
5. WRITE 參考 (c)、本 skill 的 `rules/sop-rule.md` 寫目標 skill 的 `## SOP`, 到 Phase 3。

### Phase 3 -- 撰寫目標 rules

1. READ 讀取本 skill 的 `rules/rule-rule.md`, 到下一步。
2. WRITE 參考本 skill 的 `rules/rule-rule.md` 寫入 SOP 以外的規則檔到 `.claude/skills/temp/<skill-name>/rules/` 目錄中, 到 Phase 4。

### Phase 4 -- 檢查產出物

1. THINK 參考本 skill 的 `templates/sop.md`、`rules/sop-rule.md` 審核目標 skill; 若需要修改, 則到下一步; 否則到第 3 步。
2. ASK 請使用者確認修正, 回第 1 步。
3. TELL 告知使用者目標 skill 位於 `.claude/skills/temp/<skill-name>/`, 不搬回正式位置, 請使用者自行 review 後處理, 結束本 skill。