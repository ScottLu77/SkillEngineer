---
name: skill-form-template
description: 使用者提供範例檔, 要建立能產出同格式檔案的 skill 時必須使用此 skill。
---

## SOP

### Phase 1 -- 分析範例檔

1. READ 讀取本 skill 的 `rules/breakdown-rule.md`, 到下一步。
2. THINK 確認使用者已提供範例檔路徑與目標 skill 名稱; 若有缺漏, 則到下一步; 否則到第 4 步。
3. ASK 請使用者補齊範例檔路徑與目標 skill 名稱, 回第 2 步。
4. READ 讀取範例檔, 到下一步。
5. THINK 參考本 skill 的 `rules/breakdown-rule.md` 寫出拆解清單, 隨每次產出而不同的內容視為可變值, 會重複出現的區段視為重複區塊, 可有可無的區段視為選填區塊, 到下一步。
6. ASK 列出拆解清單請使用者確認; 若有修改, 則回第 5 步; 否則到 Phase 2。

### Phase 2 -- 撰寫範本檔

1. READ 讀取本 skill 的 `rules/template-rule.md`, 到下一步。
2. WRITE 參考本 skill 的 `rules/template-rule.md` 與拆解清單建立 `.claude/skills/temp/<目標 skill 名稱>/templates/<產出物名稱>.<範例檔副檔名>`, 到 Phase 3。

### Phase 3 -- 建立目標 skill

1. DELEGATE 分派給 `skill-engineering`, 傳入目標 skill 名稱、範本檔路徑與最終產出物 (依範本填完佔位符、移除區塊標記後的檔案), 並要求目標 skill 的 SOP 含 READ 讀取範本檔與 WRITE 依範本產出的步驟, 到 Phase 4。

### Phase 4 -- 檢查產出物

1. READ 讀取本 skill 的 `rules/template-rule.md`, 到下一步。
2. THINK 審核: (a) 將範例檔的原值填回範本檔、依範例檔展開重複區塊與選填區塊後, 結果與範例檔逐字相同 (b) 範本檔符合本 skill 的 `rules/template-rule.md` 全部 MUST (c) 目標 skill 的 `SKILL.md` 引用範本檔; 若有不通過處, 則到下一步; 否則到第 4 步。
3. WRITE 修正不通過處, 回第 2 步。
4. TELL 告知使用者範本檔與目標 skill 位於 `.claude/skills/temp/<目標 skill 名稱>/`, 不搬回正式位置, 請使用者自行 review 後處理, 結束本 skill。
