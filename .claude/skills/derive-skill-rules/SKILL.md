---
name: derive-skill-rules
description: 當使用者或其他 skill 要針對某個 skill 的某個步驟, 展開需要遵守的規則時必須使用此 skill。
---

## SOP

### Phase 1 -- 確認目標步驟

1. READ 讀取目標 skill 目錄下的 `SKILL.md` (目錄由呼叫的 skill 傳入, 或由使用者指定), 連同使用者的 prompt 作為分析依據, 讀完後進入下一步。
2. THINK 回答三個問題: (a) 要修改的步驟 (b) 規則檔名, 格式為 `<主題>-rule.md` (c) 規則內容; 有任一題答不出來則進入下一步, 否則跳至第 4 步。
3. ASK 向使用者詢問 (a)~(c) 中未能回答的題目, 取得全部答案後進入下一步。
4. ASK 將三題答案輸出到螢幕, 請使用者確認; 有修改則更新答案並重新確認, 確認無誤後進入 Phase 2。

### Phase 2 -- 撰寫規則檔

1. WRITE 依本 skill 的 `templates/rule.md` (骨架) 與 `templates/rule.example.md` (範例), 撰寫目標 skill 的 `rules/<rule-name>.md` (`rules/` 不存在則先建立), 寫完後進入下一步。
2. WRITE 依 (c) 規則內容 與本 skill 的 `rules/rule-file-rule.md` 改寫目標 skill 的 `rules/<rule-name>.md`, 寫完後進入下一步。
3. WRITE 在目標 skill `SKILL.md` 的 (a) 步驟中加上「依 `rules/<rule-name>.md`」, 讓該步驟執行時載入此規則檔, 寫完後進入 Phase 3。

### Phase 3 -- 檢查規則檔

1. THINK 依本 skill 的 `rules/rule-file-rule.md` 審核目標 skill 的 `rules/<rule-name>.md`, 並確認目標 skill `SKILL.md` 的 (a) 步驟已引用 `rules/<rule-name>.md`; 若全部符合, 則結束本 skill; 否則進入下一步。
2. WRITE 修正所有不通過的部份, 修完後回到 Phase 3 第 1 步。
