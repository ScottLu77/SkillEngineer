---
name: skill-engineering
description: 建立新 skill 或修改舊 skill 時必須使用此 skill。
---

## SOP

### Phase 1 -- 釐清需求

1. READ 讀取使用者指定的舊 skill 目錄下所有檔案 (新建時略過) 與本 skill 的 `rules/draft-sop-rule.md`, 到下一步。
2. THINK 回答 (a) skill 名稱 (b) 觸發條件 (c) 最終產出物 (d) 參考本 skill 的 `rules/draft-sop-rule.md` 寫 high-level SOP (e) 舊 skill 路徑 (新建時寫「無」) (f) 修改目標 (新建時寫「無」) (g) 驗收條件: 試跑輸入 (含一個邊界情況) 與只看產出物可判定的條件, 答不出的標「待補」, 到下一步。
3. ASK 列出 (a)~(g), 請使用者補齊並確認; 若有修改, 則回第 1 步; 否則到 Phase 2。

### Phase 2 -- 撰寫 SKILL.md

1. READ 讀取本 skill 的 `templates/sop.md` 與 `rules/sop-rule.md`, 到下一步。
2. RUN 將 (e) 下 `SKILL.md` 與 `rules/` 以外的檔案複製到 `.claude/skills/temp/<skill-name>/` (以下稱目標 skill; 新建時略過), 到下一步。
3. WRITE 參考本 skill 的 `templates/sop.md` 與 `rules/sop-rule.md` 建立目標 skill 的 `SKILL.md`, frontmatter 填入 (a)(b), `## SOP` 依 (d)、(f)、使用者原始需求與舊 skill 的 `SKILL.md` 寫出, 具體作法與格式要求都寫進對應步驟, 到 Phase 3。

### Phase 3 -- 撰寫規則檔

1. DELEGATE 分派給 `extract-skill-rule`, 傳入來源 skill 路徑 (修改舊 skill 時為 (e), 新建時為目標 skill 路徑) 與目標 skill 路徑, 到 Phase 4。

### Phase 4 -- 檢查產出物

1. READ 讀取本 skill 的 `rules/sop-rule.md` 與 `templates/sop.md`, 到下一步。
2. THINK 參考本 skill 的 `rules/sop-rule.md` 與 `templates/sop.md` 審核目標 skill, 並確認 Phase 與 (d) 一一對應、引用的檔案都存在; 若有不通過處, 則到第 5 步; 否則到下一步。
3. DELEGATE 分派給 subagent, 以 (g) 的每個試跑輸入逐步執行目標 skill 的 SOP (修改舊 skill 時舊 skill 也跑一次), 產出寫到 `.claude/skills/temp/<skill-name>-trial/`, 需問使用者時依 (g) 自答, 對外操作只列出不執行, 到下一步。
4. THINK 依 (g) 判定試跑產出, 修改舊 skill 時比較新舊產出, 確認達成 (f) 且沒有退步; 若有不通過處, 則到下一步; 否則到第 6 步。
5. WRITE 修正不通過處, 到 Phase 3。
6. TELL 告知使用者目標 skill 位於 `.claude/skills/temp/<skill-name>/`, 試跑結果與新舊比較, 不搬回正式位置, 請使用者自行 review 後處理, 結束本 skill。
