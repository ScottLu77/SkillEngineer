---
name: skill-engineering
description: 建立新 skill 或修改舊 skill 時必須使用此 skill。
---

## SOP

### Phase 1 -- 釐清需求

1. READ 讀取舊 skill 目錄下所有檔案 (新建時無檔可讀), 到下一步。
2. READ 讀取本 skill 的 `rules/draft-sop-rule.md`, 到下一步。
3. THINK 回答 (a) skill 名稱 (b) 觸發條件 (c) 最終產出物 (d) 參考本 skill 的 `rules/draft-sop-rule.md` 寫 high-level SOP, 答不出的標「待補」, 到下一步。
4. ASK 列出 (a)~(d), 請使用者補齊並確認; 若有修改, 則回第 3 步; 否則到 Phase 2。

### Phase 2 -- 撰寫 SKILL.md

1. READ 讀取本 skill 的 `templates/sop.md` 與 `rules/sop-rule.md`, 到下一步。
2. WRITE 參考本 skill 的 `templates/sop.md` 建立 `.claude/skills/temp/<skill-name>/SKILL.md` (以下稱目標 skill), frontmatter 填入 (a)(b), 到下一步。
3. WRITE 參考 (d)、本 skill 的 `rules/sop-rule.md` 與 `templates/sop.md` 寫出目標 skill 的 `## SOP`, 到 Phase 3。

### Phase 3 -- 撰寫規則檔

1. DELEGATE 分派給 `extract-skill-rule`, 傳入目標 skill 路徑, 到 Phase 4。

### Phase 4 -- 檢查產出物

1. THINK 參考本 skill 的 `rules/sop-rule.md` 與 `templates/sop.md` 審核目標 skill, 並確認能產出 (c); 若需要修改, 則到下一步; 否則到第 3 步。
2. WRITE 修正不通過處, 回第 1 步。
3. TELL 告知使用者目標 skill 位於 `.claude/skills/temp/<skill-name>/`, 不搬回正式位置, 請使用者自行 review 後處理, 結束本 skill。
