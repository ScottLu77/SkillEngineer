---
name: derive-skill-rules
description: 當使用者想針對 skill 的某個步驟, 展開需要遵守的規則時必須使用此 skill。
---

## SOP

### Phase 1 -- 確認目標步驟

1. READ 讀取目標 skill 的 `SKILL.md`, 連同使用者的 prompt 作為分析依據。
2. THINK 回答三個問題: (a) 要修改的步驟 (b) 規則檔案名稱 (c) 規則內容; 有任一題答不出來則進入下一步, 否則跳至第 4 步。
3. ASK 向使用者詢問未能回答的問題, 取得全部答案後進入下一步。
4. ASK 將三題答案輸出到螢幕, 請使用者確認; 有修改則更新答案並重新確認, 確認無誤後進入 Phase 2。

### Phase 2 -- 撰寫規則檔

1. WRITE 依 `templates/rule.md` (骨架) 與 `templates/rule.example.md` (範例), 撰寫目標 skill 的 `rules/<rule-name>.md`。
2. WRITE 依 (c) 規則內容 與 `rules/rule-file-rule.md` 改寫 `rules/<rule-name>.md`。
3. WRITE 改寫目標 skill 的 `SKILL.md` 中要修改的步驟為按需載入 `rules/rule-file-rule.md`

### Phase 3 -- 檢查規則檔

1. THINK 依 `rules/rule-file-rule.md` 審核 `rules/<rule-name>.md` 是否符合規範; 若符合, 則結束本 skill; 否則進入下一步。
2. WRITE 修正所有不通過的部份, 修完後回到 Phase 3 第 1 步。