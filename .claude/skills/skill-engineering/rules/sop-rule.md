## Rule 1 -- Phase 標題的寫作規則

- MUST: Phase 名稱是動詞短語。

## Rule 2 -- Phase 步驟的寫作規則

- MUST: 動作詞只能是: READ (讀檔)、WRITE (寫檔)、RUN (執行指令或 script)、THINK (分析判斷)、ASK (問使用者並等待回覆)、TELL (告知使用者)、DELEGATE (分派給其他 skill 或 subagent)。
- MUST: WRITE 步驟只寫入一個檔案。
- MUST: 要求依規則檔或範本執行時用「遵守」。
- MUST: 一步要回答或檢查兩個以上項目時, 用子清單逐項列出。
- MUST: 每個步驟都要寫明去向。
- MUST: 去向的句型只能是 `, <去向>` 或 `; 若<條件>, 則<去向>; 否則<去向>`。
- MUST: 去向只能是: 到下一步、到第 N 步、到 Phase N 第 M 步 (M 為 1 時可省略)、結束本 skill。
- MUST: Phase 最後一步的去向不可是到下一步。

## Rule 3 -- 規則檔引用的寫作規則

- MUST: 步驟提到的規則檔都存在。
- MUST: skill 內的每個規則檔都至少被一個步驟提到。
- MUST: 步驟用到規則檔之前, 前面有讀取該檔的 READ 步驟。
- MUST: 步驟提到自身目錄內的檔案時, 路徑寫成「本 skill 的 `<相對於 skill 根目錄的路徑>`」。