## Rule 1 -- Rule 區塊寫作規則

- MUST: 格式為 `## Rule N -- <抬頭>`, N 從 1 開始連續編號。
- MUST: 抬頭寫明規則管轄的對象 ex. `Commit 標題寫作規則`。
- MUST: 每條 Rule 依序包含: MUST 條列、`### Good example`、`### Bad example`。

### Good example

格式與編號正確、抬頭寫明對象、三個部份齊全

````
## Rule 1 -- Commit 標題寫作規則

- MUST: 格式為 `<type>: <摘要>`。

### Good example

有 type

```
feat: add retry
```

### Bad example

缺 type

```
add retry
```

## Rule 2 -- Commit 內文寫作規則

- MUST: 標題與內文之間空一行。

### Good example

標題後有空行

```
feat: add retry

Reuse the upload token.
```

### Bad example

標題後無空行

```
feat: add retry
Reuse the upload token.
```
````

### Bad example

編號跳號、抬頭格式錯誤、缺 Bad example

````
## Rule 1 -- Commit 標題寫作規則

- MUST: 格式為 `<type>: <摘要>`。

### Good example

有 type

```
feat: add retry
```

## Rule 3: 內文

- MUST: 標題與內文之間空一行。
````

## Rule 2 -- MUST 條列寫作規則

- MUST: 每條以 `- MUST: ` 開頭, 一條只寫一個可檢查的要求。
- MUST: 不寫模糊用語 ex.「適當」、「視情況」、「必要時」。

### Good example

每條只有一個要求, 且都能客觀檢查

```
- MUST: 標題不超過 50 個字元。
- MUST: 摘要以動詞開頭。
- MUST: 摘要結尾不加句號。
```

### Bad example

第 1 條塞了多個要求; 第 2 條以 `- SHOULD:` 開頭且用了模糊用語

```
- MUST: 標題不超過 50 個字元、以動詞開頭且結尾不加句號。
- SHOULD: 必要時適當縮短標題。
```

## Rule 3 -- Example 寫作規則

- MUST: Good example 與 Bad example 各自依序包含: 一行說明、一個 fenced code block。
- MUST: 說明寫出範例符合或違反了哪些 MUST。
- MUST: 兩個範例用同一情境, 且 Bad example 至少違反本條 Rule 一個 MUST。

### Good example

說明指出符合/違反的要求, 兩個範例用同一個 commit 情境

````
### Good example

type 合法且摘要以動詞開頭

```
feat: add retry to upload client
```

### Bad example

type 不在允許清單內且摘要以名詞開頭

```
feature: Retry logic for the upload client
```
````

### Bad example

說明未指出符合/違反的要求, 兩個範例情境不同, 且 Bad example 未違反任何 MUST

````
### Good example

一個例子

```
feat: add retry to upload client
```

### Bad example

另一個例子

```
docs: update README install section
```
````
