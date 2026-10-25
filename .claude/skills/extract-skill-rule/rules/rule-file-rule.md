## Rule 1 -- 規則檔分派規則

- MUST: 一個規則檔只約束一種產出物。
- MUST: 約束同一種產出物的規則都放在同一個規則檔, 不論來自哪個步驟。
- MUST: 同一產出物的不同版本 (例如草稿與正式版) 視為不同產出物。

### Good example

每檔一種產出物, 寫與審 SOP 的規則同檔, 草稿版另立一檔

```
rules/draft-sop-rule.md       <- Phase 1 第 3 步 (寫草稿版 SOP)
rules/sop-rule.md             <- Phase 2 第 3 步 (寫 SOP)、Phase 4 第 1 步 (審核 SOP)
rules/commit-message-rule.md  <- Phase 3 第 2 步 (寫 commit message)
```

### Bad example

`sop-rule.md` 混入 commit message (違反第 1 個 MUST), 審核 SOP 另放一檔 (違反第 2 個 MUST), 草稿版與正式版共用一檔 (違反第 3 個 MUST)

```
rules/sop-rule.md        <- Phase 1 第 3 步 (寫草稿版 SOP)、Phase 2 第 3 步 (寫 SOP 與 commit message)
rules/final-sop-rule.md  <- Phase 4 第 1 步 (審核 SOP)
```


## Rule 2 -- Rule 抬頭規則

- MUST: <Rule 編號> 在每個規則檔內從 1 開始連續編號。
- MUST: <抬頭> 寫成「<約束對象>規則」。

### Good example

編號連續, 抬頭以「規則」結尾

```
## Rule 1 -- Commit 標題規則
## Rule 2 -- Commit 內文規則
```

### Bad example

編號跳號 (違反第 1 個 MUST), 抬頭未以「規則」結尾 (違反第 2 個 MUST)

```
## Rule 1 -- Commit 標題
## Rule 3 -- Commit 內文規則
```


## Rule 3 -- Rule 切分規則

- MUST: 每個 Rule 的 MUST 只約束其 <抬頭> 寫出的那一個組成部分。
- MUST: 約束同一組成部分的 MUST 都放在同一個 Rule。

### Good example

標題與內文的 MUST 各自集中在對應的 Rule

```
## Rule 1 -- Commit 標題規則

- MUST: 標題以 `feat: ` 或 `fix: ` 開頭。
- MUST: 標題不超過 50 個字元。


## Rule 2 -- Commit 內文規則

- MUST: 內文每行不超過 72 個字元。
```

### Bad example

標題規則含內文的 MUST、內文規則含標題的 MUST (違反第 1 個 MUST), 標題的 MUST 分散在兩個 Rule (違反第 2 個 MUST)

```
## Rule 1 -- Commit 標題規則

- MUST: 標題不超過 50 個字元。
- MUST: 內文每行不超過 72 個字元。


## Rule 2 -- Commit 內文規則

- MUST: 標題以 `feat: ` 或 `fix: ` 開頭。
```


## Rule 4 -- MUST 條文規則

- MUST: 每個 MUST 以「。」結尾。
- MUST: 每個 MUST 只寫一個要求 (不以「且」「並且」「以及」串接)。

### Good example

以「。」結尾, 只寫一個要求

```
- MUST: 標題不超過 50 個字元。
```

### Bad example

未以「。」結尾 (違反第 1 個 MUST), 以「並且」串接兩個要求 (違反第 2 個 MUST)

```
- MUST: 標題不超過 50 個字元, 並且以 `fix: ` 開頭
```
