## Rule 1 -- Phase 寫作規則

- MUST: <Phase 編號> 從 1 開始連續編號。
- MUST: <Title> 沿用 high-level SOP 對應步驟的動詞短語, 一步對應一個 Phase。

### Good example

合乎標準的 Phase

```
### Phase 1 -- 翻譯文件
### Phase 2 -- 檢查譯文
```

### Bad example

編號從 0 開始

```
### Phase 0 -- 翻譯文件
### Phase 1 -- 檢查譯文
```


## Rule 2 -- 步驟寫作規則

- MUST: <步驟編號> 在每個 Phase 內從 1 開始連續編號。
- MUST: 每步只用一個 <動作詞>: READ 讀檔、WRITE 寫檔、THINK 分析判斷、ASK 問使用者並等待回覆、TELL 告知使用者、DELEGATE 分派給其他 skill 或 script。
- MUST: <去向> 只用兩種句型:
  - 無條件: `<目標>`
  - 有條件: `若<條件>, 則<目標>; 否則<目標>`
- MUST: <目標> 只能是: 到下一步、到第 N 步、回本步、回第 N 步、到 Phase N 第 M 步 (M 為 1 時可省略)、結束本 skill。
- MUST: Phase 的最後一步不可用「到下一步」。

### Good example

合乎標準的步驟

```
1. READ 讀取 `docs/en/README.md`, 到下一步。
2. THINK 比對原文與譯文段數; 若有漏段, 則回第 1 步; 否則到 Phase 3。
```

### Bad example

使用未定義的動作詞、一步含兩個動作詞、未寫去向

```
1. OPEN 開啟 `docs/en/README.md`。
2. READ 讀取原文並 WRITE 寫入 `docs/zh-tw/README.md`。
```
