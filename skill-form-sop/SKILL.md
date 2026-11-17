---
name: skill-form-sop
description: 當要撰寫或修改 skill (以下稱 `目標 skill`) 時, 只要涉及流程 (SOP) 的撰寫就必須使用此 skill。
---

## SOP

### Phase 1 -- 釐清 `目標 skill` 的目的
1. READ 讀取 `目標 skill` 目錄下的 `SKILL.md` (不存在就略過), 到下一步。
2. THINK 回答4個問題: (a) skill 的名稱 (b) skill 的觸發條件 (c) skill 的抽象流程 (d) skill 的抽象流程以外的說明內容及約束清單; 若有任何一題沒有答案, 則到下一步; 否則到 Phase 2。
3. ASK 向使用者提出問題, 得到前一步的全部答案後, 到 Phase 2。

### Phase 2 -- 撰寫 `目標 skill` 的 `SKILL.md`
1. READ 讀取 本 skill 目錄下的 `templates/sop-template.md`, 作為 `目標 skill` 的 `SKILL.md` 的骨架, 到下一步。
2. WRITE 依 Phase 1 第 2 步的 (a)(b) 的答案, 撰寫 `目標 skill` 的 `SKILL.md` 的 frontmatter, 到下一步。
3. THINK 將 Phase 1 第 2 步的 (d) 的答案, 依「(c) 的抽象流程中哪一步會用到」分組, 每一組取一個 `<主題>` (小寫英文, 以 `-` 連接), 對應將來的規則檔 `rules/<主題>-rule.md` ((d) 沒有任何內容時不分組), 到下一步。
4. READ 讀取 本 skill 目錄下的 `rules/sop-rule.md`, 到下一步。
5. WRITE 依 本 skill 目錄下的 `rules/sop-rule.md`, 及 Phase 1 第 2 步的 (c) 的答案, 撰寫 `目標 skill` 的 `SKILL.md` 的 `## SOP` 區塊, 並為第 3 步的每一組, 在其適用步驟之前加一步 ``READ 讀取 本 skill 目錄下的 `rules/<主題>-rule.md`, 到下一步。``; 若 (d) 沒有任何內容, 則結束本 skill; 否則到 Phase 3。

### Phase 3 -- 撰寫 `目標 skill` 的 `extension.md`
1. READ 讀取 本 skill 目錄下的 `templates/extension-template.md`, 到下一步。
2. WRITE 依 `templates/extension-template.md`, 及 Phase 2 第 3 步的分組結果, 撰寫 `目標 skill` 的 `extension.md`, 每一組一個區塊, 內容保留使用者的原文, 到下一步。
3. DELEGATE 分派給 `skill-form-rule`, 將 `目標 skill` 的 `extension.md` 轉成規則檔, 結束本 skill。
