---
name: skill-form-script
description: 當要撰寫或修改 skill 的 scripts/ 底下的 ScriptFile（供 SOP 步驟委派執行、可在 Linux 與 macOS 執行的 shell script）內容時，必須使用本 skill。
---

# SOP

## Phase 1 -- 理解與設計

1. `READ` 使用者需求、要修改的目標 skill 的 `SKILL.md`，以及目標 skill `scripts/` 底下的既有 ScriptFile（不存在就略過），確認要修改的目標 ScriptFile。
2. `READ` 本 skill 的 `rules/ScriptFile-rule.md` 的所有 Rule，建立完成檢查清單。
3. `THINK` 依已載入的完成檢查清單，確定每個目標 ScriptFile 的職責、檔名、參數、輸出、exit code 與相依工具。

完成條件：已確定每個目標 ScriptFile 的職責、檔名、參數、輸出、exit code 與相依工具。

## Phase 2 -- 寫入與驗證

1. `WRITE` 依已載入的完成檢查清單修改目標 ScriptFile。
2. `DELEGATE` 使用 `bash`，依已載入的完成檢查清單對目標 ScriptFile 執行語法檢查與試跑，取得執行驗證結果。
3. `CHECK` 依執行驗證結果逐條驗證完成檢查清單；若有任一項未通過，修正後回到步驟 2。

完成條件：目標 ScriptFile 已寫入，且所有檢查項目均已通過。
