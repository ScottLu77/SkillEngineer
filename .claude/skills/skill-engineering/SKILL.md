---
name: skill-engineering
description: 當使用者要建立新的 skill 或修改現有的 skill 時必須使用此 skill。
---

## SOP

### Phase 1 -- 釐清需求

1. READ 讀取 `.claude/skills/<skill-name>/` 下所有檔案 (以下稱舊 skill; 新 skill 則略過), 讀完後進入下一步。
2. THINK 回答: (a) skill 名稱 (b) 觸發情境 (c) 最終產出物 (d) 依本 skill 的 `rules/draft-sop-rule.md` 寫出的 high-level SOP; 答不出的標「待補」, 完成後進入下一步。
3. ASK 列出 (a)~(d), 請使用者補齊待補項目並確認; 若有修改, 則更新後回到本步; 否則進入 Phase 2。

### Phase 2 -- 撰寫 SKILL.md

1. WRITE 依本 skill 的 `templates/sop.md` 建立 `.claude/skills/temp/<skill-name>/SKILL.md` (以下稱目標 skill; 不複製舊 skill 任何檔案), frontmatter 填入 (a)(b), 寫完後進入下一步。
2. WRITE 依 (d) 與本 skill 的 `rules/sop-rule.md` 展開目標 skill 的 `## SOP`, 寫完後進入 Phase 3。

### Phase 3 -- 提取規則

1. THINK 列出目標 skill 中產出物有可逐條檢查的格式要求 (ex. commit message 的標題格式) 且尚未引用 `rules/` 的步驟; 若沒有, 則進入 Phase 4; 否則進入下一步。
2. ASK 以多選題列出候選步驟, 請使用者勾選要建立規則檔的步驟; 若勾選為空, 則進入 Phase 4; 否則進入下一步。
3. DELEGATE 分派給 `derive-skill-rules` skill, 傳入目標 skill 路徑與勾選步驟, 預期拿回各步驟對應的規則檔路徑, 拿到後進入 Phase 4。

### Phase 4 -- 提取範本

1. THINK 列出目標 skill 中產出物有固定段落骨架 (ex. 含固定段落與欄位的文件) 且尚未引用 `templates/` 的步驟; 若沒有, 則進入 Phase 5; 否則進入下一步。
2. ASK 以多選題列出候選步驟, 請使用者勾選要建立範本檔的步驟; 若勾選為空, 則進入 Phase 5; 否則進入下一步。
3. DELEGATE 分派給 `derive-skill-templates` skill, 傳入目標 skill 路徑與勾選步驟, 預期拿回各步驟對應的範本檔路徑, 拿到後進入 Phase 5。

### Phase 5 -- 檢查 SKILL.md

1. THINK 依本 skill 的 `rules/sop-rule.md` 與 `templates/sop.md` 審核目標 skill 的 `SKILL.md`, 並確認 SOP 執行完會產出 (c); 若全部符合, 則回報目標 skill 路徑 (不自行搬移) 並結束本 skill; 否則進入下一步。
2. WRITE 修正所有不通過的部份, 修完後回到第 1 步。
