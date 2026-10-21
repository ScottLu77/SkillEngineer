## Rule 1 -- Phase 寫作規則

- MUST: 格式為 `### Phase N -- <抬頭>`。
- MUST: phase 與每個 phase 內的步驟, 各自從 1 開始連續編號。

### Good example

標題格式正確, phase 與步驟各自從 1 連續編號

```
### Phase 1 -- 翻譯文件

1. READ 讀取 `docs/en/README.md`, 讀完後進入下一步。
2. WRITE 將前一步內容翻譯成繁體中文寫入 `docs/zh-tw/README.md`, 寫完後進入 Phase 2。

### Phase 2 -- 自我檢查

1. THINK 逐段核對譯文是否漏段; 若無, 則結束本 skill; 否則回到 Phase 1 第 2 步補譯。
```

### Bad example

標題格式錯誤、phase 跳號、步驟編號未從 1 開始

```
### Phase 1 -- 翻譯文件

1. READ 讀取 `docs/en/README.md`, 讀完後進入下一步。
2. WRITE 將前一步內容翻譯成繁體中文寫入 `docs/zh-tw/README.md`, 寫完後進入 Phase 3。

### phase 3: 自我檢查

3. THINK 逐段核對譯文是否漏段; 若無, 則結束本 skill; 否則回到 Phase 1 第 2 步補譯。
```

## Rule 2 -- SOP 步驟寫作規則

- MUST: 每一步以動作詞開頭: READ 讀檔、WRITE 寫檔、THINK 分析判斷、ASK 問使用者、DELEGATE 分派給其他 skill 或 script。
- MUST: 每一步只做一個動作。
- MUST: ASK 寫出具體問題。
- MUST: DELEGATE 寫出對象、傳入內容、預期拿回的結果。
- MUST: 每一步結尾寫明去向, 目的地只用五種: 下一步、本步、第 N 步、Phase N 第 M 步 (M 為 1 時可省略)、結束本 skill。
- MUST: 往前寫「進入」, 往回寫「回到」。
- MUST: 有條件判斷時每個分支各寫去向。
- MUST: 需遵守規則檔或範本檔的步驟寫「依本 skill 的 `rules/<name>.md`」或「依本 skill 的 `templates/<name>.md`」, 執行前先讀取該檔。
- MUST: 不寫模糊用語 ex.「適當」、「視情況」、「必要時」。

### Good example

動作詞、去向、分支、ASK 問題、DELEGATE 內容、規則檔與範本檔引用皆正確

```
1. READ 讀取 `docs/en/README.md`, 讀完後進入下一步。
2. THINK 判斷文件是否超過 500 行; 若超過, 則進入下一步; 否則進入第 4 步。
3. DELEGATE 分派給 `split-doc` skill, 傳入 `docs/en/README.md`, 預期拿回拆分後的檔案路徑清單, 拿到後進入下一步。
4. ASK 向使用者提問「譯文要使用繁體中文還是簡體中文?」; 若答案不在兩者之內, 則回到本步; 否則進入下一步。
5. WRITE 依本 skill 的 `rules/translation-rule.md` 與 `templates/readme.md`, 以前一步的語言翻譯內容並寫入 `docs/zh-tw/README.md`, 寫完後結束本 skill。
```

### Bad example

第 1 步缺動作詞、做兩件事、無去向; 第 2 步缺否定分支去向; 第 3 步缺傳入與拿回且用模糊用語; 第 4 步無具體問題與去向; 第 5 步用模糊用語

```
1. 讀取並分析 `docs/en/README.md`。
2. THINK 若文件超過 500 行, 則進入下一步。
3. DELEGATE 視情況分派給適當的 skill 處理。
4. ASK 詢問使用者的翻譯偏好。
5. WRITE 必要時將譯文寫入檔案, 寫完後結束本 skill。
```
