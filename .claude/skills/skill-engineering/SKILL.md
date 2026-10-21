---
name: skill-engineering
description: 當使用者要建立新的 skill 或修改現有的 skill 時必須使用此 skill。
---

## SOP

### Phase 1 -- 釐清需求

1. READ 讀取目標 skill 目錄 (`.claude/skills/<skill-name>/`) 下的所有檔案, 連同使用者的 prompt 作為分析依據。
2. THINK 回答四個問題: (a) skill 名稱 (b) 觸發情境 (c) 最終產出物 (d) 依 `rules/draft-sop-rule.md` 寫出一份 high-level SOP; 有任一題答不出來則進入下一步, 否則跳至第 4 步。
3. ASK 向使用者詢問未能回答的問題, 取得全部答案後進入下一步。
4. ASK 將四題答案輸出到螢幕, 請使用者確認; 有修改則更新答案並重新確認, 確認無誤後進入 Phase 2。

### Phase 2 -- 撰寫 SKILL.md

1. WRITE 建立目標 skill 的目錄 (`.claude/skills/temp/<skill-name>/`)。
2. WRITE 依 `templates/sop.md` (骨架) 與 `templates/sop.example.md` (範例), 撰寫目標 skill 的 `SKILL.md`。
3. WRITE 依 (a) skill 名稱 (b) 觸發情境 改寫 `SKILL.md` 的 frontmatter。
4. WRITE 依 (d) high-level SOP 與 `rules/sop-rule.md` 撰寫 `SKILL.md` 的 `## SOP` 區塊。

### Phase 3 -- 檢查 SKILL.md

1. THINK 依 `rules/sop-rule.md` 審核目標 skill 的 `SKILL.md` 是否符合規範; 若符合, 則結束本 skill; 否則進入下一步。
2. WRITE 修正所有不通過的部份, 修完後回到 Phase 3 第 1 步。