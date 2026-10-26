## Rule 1 -- Rule 寫作規則

- MUST: <Rule 編號> 從 1 開始連續編號。
- MUST: <抬頭> 以「規則」二字結尾。

### Good example

commit message 規則檔的 Rule 抬頭正確案例

```
## Rule 1 -- Header 寫作規則
## Rule 2 -- Body 寫作規則
```

### Bad example

commit message 規則檔的 Rule 抬頭錯誤案例

```
## Rule 1 -- 怎麼寫 Header
## Rule 2 -- Body 應該怎麼寫
```

## Rule 2 -- MUST 細則的寫作規則

- MUST: <必須遵守的細則> 只看產出物就能回答是或否。

### Good example

commit message Header 細則的正確案例

```
- MUST: 標題不超過 50 個字元。
- MUST: 標題必須以 `feat: ` 或 `fix: ` 開頭。
```

### Bad example

commit message Header 細則的錯誤案例

```
- MUST: 標題應該寫清楚。
- MUST: 標題長度要適當。
- MUST: 標題要簡潔。
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

- MUST: 標題必須以 `feat: ` 或 `fix: ` 開頭。

### Good example

有 `feat: ` 前綴的標題

```
feat: add login page
```

### Bad example

沒有 `feat: ` 或 `fix: ` 前綴的標題

```
add login page
```
````

### Bad example

commit message Header 規則的 example 錯誤案例

````
## Rule 1 -- Header 寫作規則

- MUST: 標題必須以 `feat: ` 或 `fix: ` 開頭。

### Good example

有 `feat: ` 前綴的標題

```
feat: add login page
```
````
