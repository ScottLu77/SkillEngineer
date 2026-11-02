## Rule 1 -- 條目寫作規則

- MUST: 每筆條目寫成 `<編號>. <來源>: <內容> -> <處理>: <去處>`。
- MUST: <編號> 從 1 開始連續編號。
- MUST: <來源> 是 `<舊 skill 內的相對路徑> <標題>`、`<舊 skill 內的相對路徑>`、`frontmatter <欄位>` 或 `使用者需求` 之一。
- MUST: <處理> 是 `保留`、`修改為 <新內容>`、`刪除`、`新增` 之一。
- MUST: <來源> 為 `使用者需求` 的條目, <處理> 是 `新增`。
- MUST: 同一筆條目的 <內容> 只對應一種 <處理> 與一個 <去處>。

### Good example

依格式寫成的處理清單

```
1. frontmatter allowed-tools: Bash(git log:*) -> 保留: frontmatter
2. rules/style.md Header: Header 不超過 50 個字元 -> 修改為 Header 不超過 72 個字元: rules/commit-message-rule.md
3. scripts/collect.sh: 收集 commit -> 保留: 同路徑
4. 使用者需求: 產出前先確認版本號 -> 新增: SOP 第 1 項
```

### Bad example

第一筆沒有來源, 第二筆的處理不在清單內, 第三筆的使用者需求不是新增

```
1. Header 不超過 50 個字元 -> 保留: rules/commit-message-rule.md
2. rules/style.md Body: 語氣要友善 -> 再想想: SOP 第 2 項
3. 使用者需求: 產出前先確認版本號 -> 保留: SOP 第 1 項
```

## Rule 2 -- 條目清單規則

- MUST: 舊 skill 的 frontmatter 中, `name` 與 `description` 以外的每個欄位各有一筆條目。
- MUST: 舊 skill 的每個非 Markdown 檔案各有一筆條目。
- MUST: 舊 skill 的每個 Markdown 檔案中, 每個含內文的標題區段 (標題前的內文算一個區段, frontmatter 除外) 至少有一筆條目。
- MUST: 只有標題、沒有內文的區段沒有條目。
- MUST: 使用者要求對特定內容的每項修改、刪除與新增各有一筆條目。
- MUST: 針對整份 skill 的要求 (例如改成 SOP 格式) 沒有條目。

### Good example

舊 skill 有 `license` 欄位、一個腳本與兩個含內文的區段, 使用者要求改成 SOP 格式並刪除 Body 長度限制

```
1. frontmatter license: MIT -> 保留: frontmatter
2. scripts/collect.sh: 收集 commit -> 保留: 同路徑
3. rules/style.md Header: Header 不超過 50 個字元 -> 保留: rules/commit-message-rule.md
4. rules/style.md Body: Body 每行不超過 72 個字元 -> 刪除: 無
```

### Bad example

同一個舊 skill, 漏列 `license` 欄位、腳本與 Body 區段, 且把整份 skill 的格式要求列成條目

```
1. rules/style.md Header: Header 不超過 50 個字元 -> 保留: rules/commit-message-rule.md
2. 使用者需求: 改成 SOP 格式 -> 新增: SOP 第 1 項
```

## Rule 3 -- 去處欄位規則

- MUST: <處理> 為 `刪除` 的條目, <去處> 是 `無`。
- MUST: <處理> 不是 `刪除` 的條目, <去處> 是 `frontmatter`、`同路徑`、`rules/<產出物>-rule.md`、`SOP 第 N 項` 或目標 skill 內的相對路徑之一。
- MUST: <處理> 不是 `刪除` 且 <來源> 為 `frontmatter <欄位>` 時, <去處> 是 `frontmatter`。
- MUST: <處理> 不是 `刪除`, 且 <內容> 是對產出物某個區段或欄位的要求、可用是或否回答、不含程度詞、只管一個對象時, <去處> 是 `rules/<產出物>-rule.md`。
- MUST: <處理> 不是 `刪除`, 且 <內容> 是舊 skill 內的腳本、素材或不含要求的參考資料時, <去處> 是 `同路徑`。
- MUST: <處理> 為 `新增`, 且 <內容> 是腳本、素材或參考資料時, <去處> 是目標 skill 內的相對路徑。
- MUST: 不屬於以上情況的條目, <去處> 是 `SOP 第 N 項`, N 是 high-level SOP 的項次。

### Good example

可判定的要求進規則檔, 需主觀判斷的指引留在步驟, 參考資料留在原檔, 新腳本有新路徑, 刪除的條目沒有去處

```
1. rules/style.md Header: Header 不超過 50 個字元 -> 保留: rules/commit-message-rule.md
2. rules/style.md Tone: 語氣要友善 -> 保留: SOP 第 2 項
3. references/api.md Endpoints: API 端點列表 -> 保留: 同路徑
4. 使用者需求: 統計 commit 數量的腳本 -> 新增: scripts/count.sh
5. rules/style.md Body: Body 每行不超過 72 個字元 -> 刪除: 無
```

### Bad example

第一筆可判定的要求留在步驟, 第二筆含要求的內容留在原檔, 第三筆刪除的條目還有去處

```
1. rules/style.md Header: Header 不超過 50 個字元 -> 保留: SOP 第 2 項
2. references/format.md Title: 標題不超過 20 個字元 -> 保留: 同路徑
3. rules/style.md Body: Body 每行不超過 72 個字元 -> 刪除: rules/commit-message-rule.md
```
