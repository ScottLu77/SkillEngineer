## Rule 1 -- Phase寫作規則

- MUST: 格式為 `### Phase N -- <抬頭>`。
- MUST: phase 從 1 開始連續編號。

### Good example

phase 與步驟各自從 1 開始連續編號, 標題格式正確

```
### Phase 1 -- 翻譯文件

1. READ 讀取 `docs/en/README.md`, 讀完後進入下一步。
2. WRITE 把前一步讀到的內容翻譯成繁體中文, 寫入 `docs/zh-tw/README.md`, 寫完後進入 Phase 2。

### Phase 2 -- 自我檢查

1. READ 重新讀取 `docs/zh-tw/README.md`。
2. THINK 逐段核對譯文是否漏段; 若無漏段, 則結束本 skill; 否則記下漏段, 回到 Phase 1 第 2 步補譯。
```

### Bad example

phase 編號跳號且標題格式錯誤

```
### Phase 1 -- 翻譯並檢查文件

1. READ 讀取 `docs/en/README.md`, 讀完後進入下一步。
2. WRITE 把前一步讀到的內容翻譯成繁體中文, 寫入 `docs/zh-tw/README.md`, 寫完後進入下一步。
3. THINK 逐段核對譯文是否漏段, 核對完後進入下一個 phase。

### phase 3: 收尾

4. WRITE 補譯所有漏段。
```

## Rule 2 -- Phase的詳細步驟寫作規則

- MUST: 每一步以 READ、WRITE、THINK、ASK、DELEGATE 五個動作詞之一開頭。
- MUST: 動作詞依步驟性質選用: 讀檔用 READ、寫檔用 WRITE、分析/判斷/決策用 THINK、向使用者提問用 ASK、分派給其他 script 或 skill 用 DELEGATE。
- MUST: 步驟中不要寫模糊不清的用語 ex.「適當」、「視情況」、「必要時」。

### Good example

每一步以大寫動作詞開頭且清楚描述行為

```
1. READ 讀取 `docs/en/README.md`, 讀完後進入下一步。
2. THINK 判斷文件是否超過 500 行; 若超過, 則進入下一步; 否則跳至第 4 步。
3. DELEGATE 分派給 `split-doc` skill, 傳入 `docs/en/README.md`, 預期拿回拆分後的檔案路徑清單, 拿到後進入下一步。
4. ASK 向使用者提問「譯文要使用繁體中文還是簡體中文?」, 得到答案後進入下一步。
5. WRITE 以前一步得到的語言翻譯內容, 寫入 `docs/zh-tw/README.md`, 寫完後結束本 skill。
```

### Bad example

動作未以大寫動作詞開頭也未清楚描述行為

```
1. 讀取並分析 `docs/en/README.md`。
2. THINK 若文件超過 500 行, 則進入下一步。
3. DELEGATE 視情況分派給適當的 skill 處理。
4. ASK 詢問使用者的翻譯偏好。
5. WRITE 必要時將譯文寫入檔案。
```