---
name: derive-skill-templates
description: 當要為某個 skill 的步驟建立 templates/ 範本檔並讓步驟引用它時必須使用此 skill。
---

## SOP

### Phase 1 -- 確認目標步驟

1. READ 讀取目標 skill 目錄下所有檔案, 讀完後進入下一步。
2. THINK 對每個目標步驟回答: (a) 步驟 (b) 範本檔名 `<產出物>.md` (修改既有範本檔則用既有檔名) (c) 範本內容: 固定文字、`<說明>` 佔位符、可重複或可省略的區塊; 答不出的標「待補」, 完成後進入下一步。
3. ASK 以表格列出所有步驟的 (a)~(c), 請使用者補齊待補項目並確認; 若有修改, 則更新後回到本步; 否則進入 Phase 2。

### Phase 2 -- 撰寫範本檔

1. WRITE 取下一個未處理步驟, 依本 skill 的 `rules/template-file-rule.md` 將 (c) 寫入目標 skill 的 `templates/<範本檔名>` (已存在則修改既有內容), 寫完後進入下一步。
2. WRITE 在目標 skill `SKILL.md` 的該步驟加上字樣「依本 skill 的 `templates/<範本檔名>`」; 若仍有未處理步驟, 則回到第 1 步; 否則進入 Phase 3。

### Phase 3 -- 檢查範本檔

1. THINK 依本 skill 的 `rules/template-file-rule.md` 審核所有新增或修改的範本檔, 並確認每個目標步驟已引用對應範本檔; 若全部符合, 則回報各步驟對應的範本檔路徑並結束本 skill; 否則進入下一步。
2. WRITE 修正所有不通過的部份, 修完後回到第 1 步。
