---
name: translate-readme
description: 當使用者要求把 README 翻譯成繁體中文時必須使用此 skill。
---

## SOP

### Phase 1 -- 翻譯文件

1. READ 讀取 `docs/en/README.md`, 讀完後進入下一步。
2. WRITE 把前一步讀到的內容翻譯成繁體中文, 寫入 `docs/zh-tw/README.md`, 寫完後進入 Phase 2。

### Phase 2 -- 自我檢查

1. READ 重新讀取 `docs/zh-tw/README.md`, 讀完後進入下一步。
2. THINK 逐段核對譯文是否漏段; 若無漏段, 則結束本 skill; 否則記下漏段, 回到 Phase 1 第 2 步補譯。
