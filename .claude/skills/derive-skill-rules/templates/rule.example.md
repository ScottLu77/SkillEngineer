## Rule 1 -- Commit 標題寫作規則

- MUST: 格式為 `<type>: <摘要>`。
- MUST: type 只能是 feat、fix、docs、refactor、test、chore 之一。
- MUST: 標題不超過 50 個字元。
- MUST: 摘要以動詞開頭。
- MUST: 摘要結尾不加句號。

### Good example

格式正確、type 合法、長度在 50 字元內、摘要以動詞開頭且無句號

```
feat: add retry to upload client
```

### Bad example

type 不在允許清單內、摘要以名詞開頭且結尾加了句號

```
feature: Retry logic for the upload client.
```

## Rule 2 -- Commit 內文寫作規則

- MUST: 標題與內文之間空一行。
- MUST: 內文每行不超過 72 個字元。
- MUST: 內文只寫「為什麼改」, 不寫「改了哪些檔案」。

### Good example

標題後空一行, 每行在 72 字元內, 內文說明動機而非檔案清單

```
fix: stop duplicate upload on network retry

The client re-sent the whole payload when the first attempt timed out,
so the server stored two copies. Retry now reuses the upload token.
```

### Bad example

標題後未空行, 且內文列出改動的檔案而非動機

```
fix: stop duplicate upload on network retry
Changed UploadClient.kt, RetryPolicy.kt and UploadClientTest.kt.
```
