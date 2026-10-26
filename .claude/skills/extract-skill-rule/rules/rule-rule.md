## Rule 1 -- Rule 標題行寫作規則

- MUST: <Rule 編號> 從 1 開始連續編號。
- MUST: <抬頭> 以「規則」二字結尾。

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
## Rule 2 -- Body 應該怎麼寫
```

## Rule 2 -- MUST 細則的寫作規則

- MUST: <必須遵守的細則> 只看產出物就能回答是或否。
- MUST: 每條 MUST 只寫一個要求。
- MUST: Rule 下的每條 MUST 都約束 <抬頭> 中點名的同一個產出物部分。

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
- MUST: Header 應該寫清楚。
- MUST: Header 長度要適當。
- MUST: Header 要簡潔。
```

## Rule 3 -- example 寫作規則

- MUST: 每個 `## Rule <Rule 編號>` 底下恰好有一個 `### Good example` 與一個 `### Bad example`。
- MUST: <說一下這個例子在作什麼> 只寫一行。
- MUST: <例子列表> 用 code fence 包圍起來。
- MUST: Good example 要符合本 Rule 全部 MUST。
- MUST: Bad example 至少違反本 Rule 的一條 MUST。

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
