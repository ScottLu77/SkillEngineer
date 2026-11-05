## Rule 1 -- Phase 標題的寫作規則

- MUST: <編號> 從 1 開始連續編號。
- MUST: <抬頭> 是動詞短語。

## Rule 2 -- Phase 步驟的寫作規則

- MUST: <步驟編號> 在每個 Phase 內從 1 開始連續編號。
- MUST: <動作詞> 只能是: READ (讀檔)、WRITE (寫檔)、RUN (執行指令或 script)、THINK (分析判斷)、ASK (問使用者並等待回覆)、TELL (告知使用者)、DELEGATE (分派給其他 skill 或 subagent)。
- MUST: <操作內容> 只處理一個產出物。
- MUST: <去向> 只能是無條件句型 `, <目標>` 或有條件句型 `; 若<條件>, 則<目標>; 否則<目標>`。
- MUST: <目標> 只能是: 到下一步、到第 N 步、回本步、回第 N 步、到 Phase N 第 M 步 (M 為 1 時可省略)、結束本 skill。
- MUST: Phase 的最後一步不可用「到下一步」。