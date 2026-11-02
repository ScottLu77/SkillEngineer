## Rule 1 -- 判定清單條目格式規則

- MUST: 每筆條目寫成 `<位置>: 「<原句>」 -> <判定>`。
- MUST: 目標 skill 的 `SKILL.md` 的 <位置> 以 `目標 ` 開頭, 來源 skill 的 `SKILL.md` 的 <位置> 以 `來源 ` 開頭; 來源與目標路徑相同時一律以 `目標 ` 開頭。
- MUST: `SKILL.md` 的 <位置> 接著寫 `Phase N 第 M 步`; 不在步驟內寫 `Phase N (步驟外)`; 不在任何 Phase 內寫 `(Phase 外)`。
- MUST: 來源 skill 的 `rules/` 的 <位置> 寫成 `rules/<檔名> L<行號>`。
- MUST: <原句> 一字不改地摘自 <位置> 所在的檔案, 可只取句子的一部分。
- MUST: 內嵌範例與 code fence 的 <原句> 寫成 `L<起始行>-<結束行> 範例`。
- MUST: <判定> 寫成 `流程: <理由>`、`指引: <理由>`、`規則候選 (<產出物> / <部分>): MUST: <改寫後的要求>` 或 `範例 (<產出物> / <部分> / <Good 或 Bad>)` 之一。
- MUST: <產出物> 寫成規則檔檔名 `<產出物>-rule.md` 中的名稱。
- MUST: <部分> 寫成該產出物中一個區段或欄位的名稱。

### Good example

位置、原句與判定都依格式寫成

```
目標 Phase 1 第 2 步: 「每個步驟格式為 `**動詞短語**: 說明`」 -> 規則候選 (draft-sop / 步驟): MUST: 每個步驟格式為 `**動詞短語**: 說明`。
目標 Phase 1 第 3 步: 「若有修改, 則回第 2 步」 -> 流程: 換掉後步驟沒有去向
來源 Phase 2 第 1 步: 「L19-21 範例」 -> 規則候選 (sop / 步驟): MUST: 步驟依 `<步驟編號>. <動作詞> <操作內容><去向>。` 的順序寫成。
rules/style.md L3: 「SHOULD: Header 不超過 50 字」 -> 規則候選 (commit-message / Header): MUST: Header 不超過 50 個字元。
rules/style.md L8: 「L8-10 範例」 -> 範例 (commit-message / Header / Good)
```

### Bad example

第一筆沒有位置且判定不在四種之內; 第二筆的判定沒有理由; 第三筆的規則候選沒寫產出物與部分

```
「格式要用動詞短語」 -> 是規則
目標 Phase 1 第 3 步: 「若有修改, 則回第 2 步」 -> 流程
目標 Phase 2 第 1 步: 「步驟編號從 1 開始」 -> 規則候選: MUST: <步驟編號> 在每個 Phase 內從 1 開始連續編號。
```


## Rule 2 -- 判定規則

- MUST: `SKILL.md` 的 <原句> 換成「參考本 skill 的 `rules/<產出物>-rule.md`」後, 所在步驟仍缺少動作詞、讀寫或參考的檔案、或去向時, 判定為 `流程`。
- MUST: 來源 skill 的 `rules/` 的條目不判定為 `流程`。
- MUST: 來源 skill 的 `rules/` 的 code fence 判定為 `範例`。
- MUST: 不屬 `流程` 與 `範例`、<原句> 約束產出物, 且能改寫成可用是或否回答、不含程度詞、只管一個對象的 <改寫後的要求> 時, 判定為 `規則候選`。
- MUST: 來源 skill 的 `rules/` 中以 `MUST: ` 開頭且符合本 skill 的 `rules/rule-rule.md` 的條目, <改寫後的要求> 沿用原文。
- MUST: 其餘條目 (含改寫不出 <改寫後的要求> 的) 判定為 `指引`。

### Good example

換掉後沒有去向判為流程, 可用是或否判定的格式與內容要求判為規則候選, 需主觀判斷判為指引, 舊規則檔的合格 MUST 沿用原文

```
目標 Phase 1 第 3 步: 「若有修改, 則回第 2 步」 -> 流程: 換掉後步驟沒有去向
目標 Phase 2 第 1 步: 「步驟編號從 1 開始」 -> 規則候選 (sop / 步驟): MUST: <步驟編號> 在每個 Phase 內從 1 開始連續編號。
目標 Phase 2 第 2 步: 「Body 每行最多 72 字元」 -> 規則候選 (commit-message / Body): MUST: Body 每行不超過 72 個字元。
目標 Phase 2 第 3 步: 「不收錄 chore」 -> 規則候選 (release-note / 變更清單): MUST: 變更清單不含 chore 類型的 commit。
目標 Phase 1 第 3 步: 「問使用者時先給推薦選項」 -> 指引: 推薦是否恰當需主觀判斷
rules/style.md L3: 「MUST: Header 不超過 50 個字元。」 -> 規則候選 (commit-message / Header): MUST: Header 不超過 50 個字元。
rules/style.md L4: 「Header 要寫清楚」 -> 指引: 是否清楚需主觀判斷
rules/style.md L8: 「L8-10 範例」 -> 範例 (commit-message / Header / Good)
```

### Bad example

第一筆換掉後步驟沒有去向, 應判為流程; 第二筆改寫出的 MUST 需主觀判斷, 應判為指引; 第三筆是舊規則檔的條目, 不可判為流程

```
目標 Phase 1 第 3 步: 「若有修改, 則回第 2 步」 -> 規則候選 (sop / 步驟): MUST: 有修改時回第 2 步。
目標 Phase 1 第 3 步: 「問使用者時先給推薦選項」 -> 規則候選 (question / 選項): MUST: 選項要給得恰當。
rules/style.md L4: 「Header 要寫清楚」 -> 流程: 不是格式要求
```


## Rule 3 -- 判定清單涵蓋範圍規則

- MUST: 本 skill 的 `scripts/find-signal-sentences.sh` 對每份 `SKILL.md` 輸出的每一行都至少有一筆條目。
- MUST: 不在腳本輸出中、但依 Rule 2 判定為 `規則候選` 的句子也列為條目。
- MUST: 來源 skill 的 `rules/` 中, code fence 外的每個句子或清單項目 (標題行與 example 段的說明行除外) 與每個 code fence 都至少有一筆條目。
- MUST: 同一個 code fence 涵蓋多個 <部分> 時, 每個 <部分> 各有一筆條目。
- MUST: frontmatter 中的句子不列為條目。

### Good example

腳本輸出的「只能」句已列入, 腳本沒抓到的標題要求也已列入, 舊規則檔的項目與 code fence 都已列入, frontmatter 的「必須」未列入

```
--- SKILL.md ---
description: 建立 demo 時必須使用此 skill。
### Phase 1 -- 撰寫草稿
注意: 動作詞只能用 READ、WRITE、THINK。
1. WRITE 寫出草稿, 第一行寫 `# Draft`, 到下一步。

--- rules/style.md ---
L3  - 草稿要簡潔
L5  ```
L6  # Draft
L7  ```

--- 判定清單 ---
目標 Phase 1 (步驟外): 「動作詞只能用 READ、WRITE、THINK」 -> 規則候選 (draft / 動作詞): MUST: <動作詞> 只能是 READ、WRITE、THINK 之一。
目標 Phase 1 第 1 步: 「第一行寫 `# Draft`」 -> 規則候選 (draft / 標題): MUST: 第一行是 `# Draft`。
rules/style.md L3: 「草稿要簡潔」 -> 指引: 是否簡潔需主觀判斷
rules/style.md L5: 「L5-7 範例」 -> 範例 (draft / 標題 / Good)
```

### Bad example

同一份 SKILL.md, 漏列腳本輸出的「只能」句、列入了 frontmatter 的句子, 且漏列舊規則檔的項目與 code fence

```
--- 判定清單 ---
目標 (Phase 外): 「建立 demo 時必須使用此 skill」 -> 流程: 觸發條件
目標 Phase 1 第 1 步: 「第一行寫 `# Draft`」 -> 規則候選 (draft / 標題): MUST: 第一行是 `# Draft`。
```
