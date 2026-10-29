## Rule 1 -- Rule 標題行寫作規則

- MUST: code fence 外, 每個 Rule 標題行的格式為 `## Rule <Rule 編號> -- <抬頭>`。
- MUST: code fence 外的 <Rule 編號> 從 1 開始連續編號。
- MUST: <抬頭> 以「規則」二字結尾。
- MUST: <抬頭> 在「規則」之前寫出一個產出物部分的名稱。

### Good example

commit message 規則檔的 Rule 標題行正確案例

```
## Rule 1 -- Header 寫作規則
## Rule 2 -- Body 寫作規則
```

### Bad example

commit message 規則檔的 Rule 標題行錯誤案例

```
## Rule 1 -- 怎麼寫 Header
## Rule 2 -- 一般規則
```

## Rule 2 -- MUST 細則的寫作規則

- MUST: code fence 外, 每個 Rule 至少有一條 MUST。
- MUST: code fence 外, 每個 Rule 的頂層清單項目都以 `- MUST: ` 開頭。
- MUST: 兩位審查員只看產出物各自檢查 <必須遵守的細則>, 會得到相同的是或否判定。
- MUST: 每條 MUST 只管一個對象; 同一個對象的多個條件可以合寫成一條。
- MUST: Rule 下的每條 MUST 都約束 <抬頭> 中點名的同一個產出物部分。
- MUST: 檔案中沒有兩條 MUST 對同一個產出物部分提出相同或相反的要求。

### Good example

commit message Header 細則的正確案例

```
## Rule 1 -- Header 寫作規則

- MUST: Header 不超過 50 個字元。
- MUST: Header 必須以 `feat: ` 或 `fix: ` 開頭。
```

### Bad example

commit message Header 細則的錯誤案例

```
## Rule 1 -- Header 寫作規則

- MUST: Header 應該寫清楚。
- SHOULD: Header 長度要適當。
- MUST: Header 要簡潔。
```

## Rule 3 -- example 寫作規則

- MUST: code fence 外, 每個 `## Rule <Rule 編號>` 底下恰好有一個 `### Good example`。
- MUST: code fence 外, 每個 `## Rule <Rule 編號>` 底下恰好有一個 `### Bad example`。
- MUST: <說一下這個例子在作什麼> 恰好一行, 且不是空白行。
- MUST: 每個 example 段在說明行之外只有一個 code fence, 用來包圍 <例子列表>。
- MUST: Good example 視為獨立檔案時, 要符合其所屬 Rule 的全部 MUST。
- MUST: Bad example 視為獨立檔案時, 至少違反其所屬 Rule 的一條 MUST。

### Good example

commit message Header 規則的完整 Rule 正確案例

````
## Rule 1 -- Header 寫作規則

- MUST: Header 必須以 `feat: ` 或 `fix: ` 開頭。

### Good example

有 `feat: ` 前綴的 Header

```
feat: add login page
```

### Bad example

沒有 `feat: ` 或 `fix: ` 前綴的 Header

```
add login page
```
````

### Bad example

commit message Header 規則的 example 錯誤案例

````
## Rule 1 -- Header 寫作規則

- MUST: Header 必須以 `feat: ` 或 `fix: ` 開頭。

### Good example

有 `feat: ` 前綴的 Header

```
feat: add login page
```
````

## Rule 4 -- 檔案結構規則

- MUST: 檔案第一行是 `## Rule 1` 的標題行。
- MUST: code fence 外, 每個 Rule 內依序只有 MUST 列表、`### Good example` 段、`### Bad example` 段。

### Good example

只由 Rule 組成的 commit message 規則檔

````
## Rule 1 -- Header 寫作規則

- MUST: Header 不超過 50 個字元。

### Good example

不超過 50 個字元的 Header

```
feat: add login page
```

### Bad example

超過 50 個字元的 Header

```
feat: add login page with OAuth, remember-me checkbox and captcha support
```
````

### Bad example

開頭有前言, 且 Rule 內多出 `### Note` 段的 commit message 規則檔

````
# Commit message 規則

以下規則用於撰寫 commit message。

## Rule 1 -- Header 寫作規則

- MUST: Header 不超過 50 個字元。

### Note

中文字元也算一個字元。

### Good example

不超過 50 個字元的 Header

```
feat: add login page
```

### Bad example

超過 50 個字元的 Header

```
feat: add login page with OAuth, remember-me checkbox and captcha support
```
````
