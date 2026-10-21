---
name: skill-engineering
description: 當使用者要建立新的 skill 或修改現有的 skill 時必須使用此 skill。
---

## SOP

### Phase 1 -- 釐清需求

1. READ 若使用者要修改現有 skill, 讀取 `.claude/skills/<skill-name>/` 下的所有檔案, 讀完後進入下一步; 若為新 skill 則直接進入下一步。
2. THINK 依使用者的 prompt 與前一步讀到的內容回答四個問題: (a) skill 名稱 (b) 觸發情境 (c) 最終產出物 (d) 依本 skill 的 `rules/draft-sop-rule.md` 寫出一份 high-level SOP; 有任一題答不出來則進入下一步, 否則跳至第 4 步。
3. ASK 向使用者詢問 (a)~(d) 中未能回答的題目, 取得全部答案後進入下一步。
4. ASK 將四題答案輸出到螢幕, 請使用者確認; 有修改則更新答案並重新確認, 確認無誤後進入 Phase 2。

### Phase 2 -- 撰寫 SKILL.md

1. WRITE 建立目標 skill 目錄 `.claude/skills/temp/<skill-name>/`; 完成後進入下一步。之後所有「目標 skill」皆指此目錄。
2. WRITE 依本 skill 的 `templates/sop.md` (骨架) 與 `templates/sop.example.md` (範例), 撰寫目標 skill 的 `SKILL.md`, 寫完後進入下一步。
3. WRITE 依 (a) skill 名稱 與 (b) 觸發情境 改寫目標 skill `SKILL.md` 的 frontmatter, 寫完後進入下一步。
4. WRITE 依 (d) high-level SOP 與本 skill 的 `rules/sop-rule.md` 撰寫目標 skill `SKILL.md` 的 `## SOP` 區塊, 寫完後進入 Phase 3。

### Phase 3 -- 提取規則

1. THINK 找出目標 skill `SKILL.md` 中需要約束輸出格式或內容寫法、且尚未引用 `rules/` 下任何檔案的步驟; 若有, 取其中一步進入下一步; 否則進入 Phase 4。
2. DELEGATE 分派給 `derive-skill-rules` skill, 傳入目標 skill 目錄路徑與前一步選出的步驟, 預期該步驟改為引用新產出的規則檔; 完成後回到 Phase 3 第 1 步。

### Phase 4 -- 檢查 SKILL.md

1. THINK 依本 skill 的 `rules/sop-rule.md` 審核目標 skill 的 `SKILL.md`, 並確認 SOP 執行完會產出 (c) 最終產出物; 若全部符合, 則結束本 skill; 否則進入下一步。
2. WRITE 修正所有不通過的部份, 修完後回到 Phase 4 第 1 步。