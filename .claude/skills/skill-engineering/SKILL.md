---
name: skill-engineering
description: 建立新 skill 或修改舊 skill 時必須使用此 skill。
---

## SOP

### Phase 1 -- 釐清需求

1. READ 讀取使用者指定的舊 skill 目錄下所有檔案 (新建時略過)、本 skill 的 `rules/draft-sop-rule.md` 與 `rules/change-list-rule.md`, 到下一步。
2. THINK 回答 (a) skill 名稱 (b) 觸發條件 (c) 最終產出物 (d) 參考本 skill 的 `rules/draft-sop-rule.md` 寫 high-level SOP (e) 舊 skill 路徑 (新建時寫「無」) (f) 參考本 skill 的 `rules/change-list-rule.md` 寫處理清單 (g) 試跑輸入 (使用者沒要求試跑時寫「無」), 答不出的標「待補」, 到下一步。
3. ASK 列出 (a)~(g), 請使用者補齊並確認; 若有修改, 則回第 1 步; 否則到 Phase 2。

### Phase 2 -- 撰寫目標 skill

1. READ 讀取本 skill 的 `templates/sop.md`、`rules/sop-rule.md`、`rules/rule-rule.md` 與 `templates/rule.md`, 到下一步。
2. RUN 將 (f) 中 <去處> 為 `同路徑` 的條目所在的檔案從 (e) 複製到 `.claude/skills/temp/<skill-name>/` (以下稱目標 skill; 新建時略過), 到下一步。
3. WRITE 依 (f) 處理 `rules/` 與 `SKILL.md` 以外的檔案: 從複製來的檔案移除 <去處> 不是 `同路徑` 的條目內容, 套用 <去處> 為 `同路徑` 且 <處理> 為 `修改為` 的條目, 並寫出 <去處> 為目標 skill 內相對路徑的條目 (沒有時略過), 到下一步。
4. RUN 為目標 skill 的 `scripts/` 下所有檔案加上執行權限 (沒有時略過), 到下一步。
5. WRITE 參考本 skill 的 `rules/rule-rule.md` 與 `templates/rule.md`, 將 (f) 中 <去處> 為 `rules/<產出物>-rule.md` 的條目寫成目標 skill 的規則檔, <處理> 為 `修改為` 的條目寫入新內容, 到下一步。
6. WRITE 參考本 skill 的 `templates/sop.md` 與 `rules/sop-rule.md` 建立目標 skill 的 `SKILL.md`: frontmatter 填入 (a)(b) 與 (f) 中 <去處> 為 `frontmatter` 的欄位, `## SOP` 依 (d) 寫出每個 Phase, 將 <去處> 為 `SOP 第 N 項` 的條目寫進對應 Phase 的步驟 (<處理> 為 `修改為` 的條目寫入新內容), 產出步驟引用對應的規則檔, 使用腳本或參考資料的步驟引用它們, 引用規則檔的 Phase 開頭以 READ 讀取它, 到 Phase 3。

### Phase 3 -- 檢查目標 skill

1. READ 讀取目標 skill 的所有檔案、本 skill 的 `templates/sop.md`、`rules/sop-rule.md`、`rules/change-list-rule.md` 與 `rules/rule-rule.md`, 到下一步。
2. THINK 審核以下項目: [1] (f) 符合本 skill 的 `rules/change-list-rule.md` 全部 MUST [2] `SKILL.md` 符合本 skill 的 `templates/sop.md` 的結構 (frontmatter 可多出 (f) 保留的欄位) 與 `rules/sop-rule.md` 全部 MUST [3] 每個規則檔符合本 skill 的 `rules/rule-rule.md` 全部 MUST, 且被 `SKILL.md` 引用 [4] `SKILL.md` 引用的檔案都存在, 目標 skill 的腳本與參考資料都被 `SKILL.md` 引用 [5] `SKILL.md` 的每個 Phase 與 (d) 的每一項一一對應 [6] (f) 中的每筆條目都已落實: <處理> 為 `修改為` 的新內容在 <去處>, `保留` 與 `新增` 的 <內容> 在 <去處> (換句話說或翻譯也算), `刪除` 的 <內容> 不在目標 skill; 若有不通過處, 則到下一步; 否則到第 5 步。
3. THINK 比對本次與前幾次審核的不通過處; 若有重複出現的不通過處, 則到第 8 步; 否則到下一步。
4. WRITE 只修正不通過處, 回第 2 步。
5. THINK 確認 (g) 的內容; 若 (g) 為「無」, 則到第 8 步; 否則到下一步。
6. DELEGATE 分派給 subagent, 以 (g) 的每個試跑輸入逐步執行目標 skill 的 SOP, 產出寫到 `.claude/skills/temp/<skill-name>-trial/`, 需問使用者時依 (g) 自答, 對外操作只列出不執行, 到下一步。
7. THINK 判定試跑是否跑完, 且產出符合目標 skill 規則檔的全部 MUST; 若有不通過處, 則回第 3 步; 否則到下一步。
8. TELL 告知使用者目標 skill 位於 `.claude/skills/temp/<skill-name>/`、(f) 每筆條目的落實結果、修不掉的不通過處與試跑結果 (沒試跑時說明未試跑, 目標 skill 是否跑得通未驗證), 不搬回正式位置, 請使用者自行 review 後處理, 結束本 skill。
