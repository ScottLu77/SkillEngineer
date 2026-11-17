# Rule 1 -- Phase 標題的寫作規則

- MUST: Phase 標題的格式如右 `### Phase <編號> -- <名稱>`。
- MUST: `<編號>` 從 1 開始連續編號。
- MUST: `<名稱>` 是動詞短語。

## example
```
### Phase 1 -- 蒐集變更內容
### Phase 2 -- 撰寫 commit message
### Phase 3 -- 提交變更
```

# Rule 2 -- 步驟的寫作規則

- MUST: 步驟的格式如右 `<步驟編號>. <動作詞> <要做的事><去向>。`
- MUST: `<步驟編號>` 從 1 開始連續編號, 不跨 Phase 延續。
- MUST: `<動作詞>` 只能是: READ (讀檔)、WRITE (寫檔)、RUN (執行 指令或 script)、THINK (分析判斷)、ASK (問使用者並等待回覆)、TELL (告知使用者)、DELEGATE (分派給其他 skill 或 subagent)。
- MUST: `<去向>` 的句型只能是 `, <NEXT>` 或 `; 若<條件>, 則<NEXT>; 否則<NEXT>`。
- MUST: `<NEXT>` 只能是: 到下一步、到第 N 步、到 Phase N 第 M 步 (M 為 1 時可省略)、結束本 skill。

## example
```
### Phase 1 -- 蒐集變更內容
1. RUN 執行 `git status` 及 `git diff`, 到下一步。
2. THINK 判斷是否有尚未提交的變更; 若沒有任何變更, 則到下一步; 否則到 Phase 2。
3. TELL 告知使用者沒有可提交的變更, 結束本 skill。

### Phase 2 -- 撰寫 commit message
1. READ 讀取專案根目錄下的 `CONTRIBUTING.md`, 到下一步。
2. THINK 判斷變更是否只屬於單一主題; 若只屬於單一主題, 則到第 4 步; 否則到下一步。
3. ASK 詢問使用者要提交哪一個主題的變更, 得到回覆後, 到下一步。
4. WRITE 將 commit message 寫入 `.git/COMMIT_EDITMSG`, 到下一步。
5. DELEGATE 分派 subagent 檢查 commit message 是否符合規範; 若不符合規範, 則到第 4 步; 否則到 Phase 3。

### Phase 3 -- 提交變更
1. RUN 執行 `git commit -F .git/COMMIT_EDITMSG`, 到下一步。
2. THINK 判斷 pre-commit hook 是否失敗; 若失敗, 則到 Phase 2 第 4 步; 否則到下一步。
3. TELL 告知使用者 commit 的 hash 及標題, 結束本 skill。
```
