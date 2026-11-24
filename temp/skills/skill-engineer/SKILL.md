---
name: skill-engineer
description: 當要建立新的 skill，或要整體改寫、優化、模組化既有 skill（包含將不是 SOP 格式的舊 skill 遷移為 SOP、RuleFile、樣板組與 ScriptFile 四個部位）時，必須使用本 skill。只為單一步驟展開單一部位時改用對應的 skill-derive-rule、skill-derive-template 或 skill-derive-script；只修改單一部位的內容時改用對應的 skill-form-sop、skill-form-rule、skill-form-template 或 skill-form-script。
---

# SOP

## Phase 1 -- 診斷目標 skill

1. `READ` 使用者需求；目標 skill 已存在時，另外讀取目標 skill 目錄底下的所有檔案。
2. `DELEGATE` 目標 skill 已存在時，執行 `bash scripts/audit-skill.sh <目標 skill 目錄>`，取得現況稽核結果；exit code 為 `3` 時繼續執行，exit code 為 `1` 或 `2` 時停止執行並回報 stderr 內容。
3. `THINK` 判斷使用者需求與既有內容是否足以確定目標 skill 的目的、輸入、輸出與限制，列出缺少的資訊；沒有缺漏時進入 Phase 2。
4. `DELEGATE` 使用 `clarify`，以步驟 3 列出的缺少資訊為提問面向訪談使用者，取得已確認決策。
5. `CHECK` 已確認決策是否補齊步驟 3 列出的缺少資訊；已補齊時回到步驟 3，使用者表示無法提供時停止執行。

完成條件：已確定目標 skill 的目的、輸入、輸出與限制；目標 skill 已存在時已取得現況稽核結果。

## Phase 2 -- 設計並確認工程藍圖

1. `READ` `rules/部位分派-rule.md` 與 `rules/skill-結構-rule.md` 的所有 Rule，建立工程檢查清單。
2. `READ` `templates/skill-blueprint.md` 與 `templates/skill-blueprint.example.md`，建立工程藍圖樣板組。
3. `THINK` 依已載入的工程檢查清單，確定工作情境、skill 身分、SOP 大綱、部位分派表、不展開的內容與既有檔案處置。
4. `WRITE` 依已載入的工程藍圖樣板組，複製骨架並改寫 placeholder，向使用者展示工程藍圖。
5. `CHECK` 使用者是否確認工程藍圖，且工程藍圖沒有待補的素材；要求調整或補上素材時依回覆回到步驟 3，使用者放棄時停止執行。

完成條件：使用者已確認沒有待補素材的工程藍圖。

## Phase 3 -- 建立骨架

1. `WRITE` 依已確認的工程藍圖建立目標 skill 目錄，並建立或更新目標 `SKILL.md` 的 frontmatter。
2. `DELEGATE` 使用 `skill-form-sop`，依已確認的工程藍圖的 SOP 大綱，建立或改寫目標 `SKILL.md` 的 `# SOP` section。
3. `CHECK` 目標 `SKILL.md` 的 Phase 與步驟是否與工程藍圖的 SOP 大綱一致；步驟編號不同時更新部位分派表的目標步驟，內容不一致時回到步驟 2。

完成條件：目標 `SKILL.md` 已有 frontmatter 與 `# SOP` section，且部位分派表的目標步驟都指向實際存在的步驟。

## Phase 4 -- 依部位分派表展開

1. `THINK` 取出部位分派表中尚未處理且順序最前的一列；所有列都已處理時進入步驟 4。
2. `DELEGATE` 使用該列指定的 `skill-derive-script`、`skill-derive-template` 或 `skill-derive-rule`，並提供該列的目標步驟、展開模式與素材。
3. `CHECK` 該列是否已展開；記錄該列的結果（已展開，或未展開與原因），更新尚未處理的列中受重新編號影響的目標步驟，然後回到步驟 1。
4. `WRITE` 工程藍圖有既有檔案處置時，依其搬移或刪除既有檔案。

完成條件：部位分派表的每一列都已記錄結果，且既有檔案處置已完成。

## Phase 5 -- 整體驗收

1. `DELEGATE` 執行 `bash scripts/audit-skill.sh <目標 skill 目錄>`，取得驗收稽核結果；exit code 為 `1` 或 `2` 時停止執行並回報 stderr 內容。
2. `CHECK` 驗收稽核結果是否沒有發現，並逐條驗證工程檢查清單；全部通過時進入步驟 4。
3. `DELEGATE` 使用未通過項目所屬部位對應的 `skill-form-sop`、`skill-form-rule`、`skill-form-template` 或 `skill-form-script` 修正，然後回到步驟 1；未通過項目屬於目錄或 frontmatter 時改為回到 Phase 3 步驟 1。
4. `WRITE` 向使用者交付目標 skill 的檔案清單、部位分派表每一列的結果，以及不展開的內容與原因。

完成條件：驗收稽核結果沒有發現，工程檢查清單均已通過，且已向使用者交付結果。
