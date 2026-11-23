# Rule 1 - 目標步驟與適用性必須明確

- 目標步驟必須以 Phase 編號與步驟編號唯一指定。
- 目標步驟要執行的工作在相同輸入下只有一種正確結果，且不需要理解語意時，必須判定為適用 ScriptFile。
- 目標步驟的工作需要理解語意、權衡取捨或與使用者互動時，必須判定為不適用 ScriptFile。
- 目標步驟的工作以單一讀取或單一寫入即可完成時，必須判定為不適用 ScriptFile。
- 目標步驟要規範的只有判準時，必須判定為不適用 ScriptFile，並建議使用者改用 `skill-derive-rule`；只有產出物格式時，必須建議改用 `skill-derive-template`。
- 目標步驟同時含有機械工作與判斷時，必須只展開機械工作，並在展開方案中列出保留在 SOP 步驟的判斷。
- ScriptFile 與 SOP 步驟的分工參見 `skill-form-script` 的 `rules/ScriptFile-rule.md` Rule 6。

## Example

- 每列都能由目標步驟的現況判斷是否適用；混合的步驟只展開機械工作，判斷保留在 SOP 步驟。

| 目標步驟內文 | 適用性 |
| ------------ | ------ |
| `CHECK` 以 `grep` 列出目標 RuleFile 的所有 Rule 標題，確認編號從 `1` 開始連續。 | 適用：列出標題與檢查編號都只有一種正確結果 |
| `CHECK` 列出目標 RuleFile 的所有 Rule 標題，確認每個標題都表明規則的要求。 | 適用：只展開列出標題；「標題表明規則的要求」列為保留的判斷 |
| `THINK` 判斷兩條 Rule 是否重述相同的要求。 | 不適用：需要理解語意 |
| `READ` 目標 skill 的 `SKILL.md`。 | 不適用：單一讀取即可完成 |
| `WRITE` 產生錯誤訊息，訊息必須指出欄位名稱。 | 不適用：只有判準，建議改用 `skill-derive-rule` |

# Rule 2 - 展開模式必須明確

- 目標步驟內文含有命令、指令名稱或逐項的機械操作描述時，必須使用抽取模式。
- 使用者要求為目標步驟補上原本沒有的機械工作時，必須使用新增模式。
- 同一個目標步驟同時符合兩種模式時，展開方案必須同時包含兩種模式，並標明 ScriptFile 每項操作的來源模式。
- 新增模式中，使用者沒有提供 ScriptFile 的輸入來源或預期輸出時，必須將其列為缺少的資訊。

## Example

- 每列都能由目標步驟內文與使用者需求判斷模式；新增模式缺少預期輸出時列為缺少的資訊。

| 目標步驟內文 | 使用者需求 | 展開模式 |
| ------------ | ---------- | -------- |
| `CHECK` 以 `grep` 列出目標 RuleFile 的所有 Rule 標題，確認編號從 `1` 開始連續。 | 把這一步抽成腳本 | 抽取 |
| `CHECK` 逐條驗證完成檢查清單。 | 加一支腳本，輸出每條 Rule 是否有 `## Example` | 新增 |
| `CHECK` 以 `grep` 列出目標 RuleFile 的所有 Rule 標題。 | 抽成腳本，並另外檢查編號是否連續 | 抽取與新增 |
| `CHECK` 逐條驗證完成檢查清單。 | 幫這一步加上腳本 | 新增；預期輸出列為缺少的資訊 |

# Rule 3 - 抽取必須保留原有行為

- 目標步驟中每一項被抽取的操作，必須對應到腳本草稿中的敘述。
- 抽取不得新增原步驟沒有的操作，也不得刪減原有操作。
- 原步驟沒有指定、但 ScriptFile 必須決定的行為（例如參數順序、輸出格式與各種失敗的 exit code），必須在展開方案中標示為補定內容。
- 原步驟的命令寫法不符合可攜性要求時，必須改為行為相同的寫法，並在展開方案中標示轉換前後的寫法；可攜性要求參見 `skill-form-script` 的 `rules/ScriptFile-rule.md` Rule 3。
- 抽取後，目標 `SKILL.md` 不得殘留已抽取的操作描述。

## Example

- 原步驟的列出標題對應到腳本的 `grep`；`grep -P` 與 `\d` 被轉換為 `grep -E` 與 `[0-9]` 並標示；需要理解語意的確認保留為獨立步驟。

改寫前：

```markdown
3. `CHECK` 以 `grep -P '^# Rule \d+ - '` 列出目標 RuleFile 的所有 Rule 標題，確認每個標題都表明規則的要求。
```

腳本草稿 `scripts/list-rule-titles.sh` 的對應敘述（`grep -P '^# Rule \d+ - '` 轉換為 `grep -E '^# Rule [0-9]+ - '`）：

```bash
grep -E '^# Rule [0-9]+ - ' "$rule_file" || true
```

改寫後：

```markdown
3. `DELEGATE` 執行 `bash scripts/list-rule-titles.sh <目標 RuleFile 路徑>`，取得 Rule 標題清單；exit code 不是 `0` 時停止執行並回報 stderr 內容。
4. `CHECK` Rule 標題清單中的每個標題都表明規則的要求。
```

# Rule 4 - 操作必須歸屬到單一職責的 ScriptFile

- 目標 skill 的既有 ScriptFile 已負責相同職責時，必須沿用該 ScriptFile，不得新建重複的 ScriptFile。
- 既有 ScriptFile 已涵蓋要展開的全部操作時，展開方案必須標明 ScriptFile 內容不變，只更新委派步驟與目標步驟內文。
- 既有 ScriptFile 負責相同職責但介面不足時，必須修改該 ScriptFile，並在展開方案中列出目標 `SKILL.md` 內其他執行該 ScriptFile 的步驟與其更新後的內文。
- 沒有負責相同職責的既有 ScriptFile 時，必須新建 ScriptFile。
- 要展開的操作包含多個職責時，展開方案必須為每個職責各自列出 ScriptFile 與委派步驟。

## Example

- 列出標題已有同職責的 ScriptFile 而沿用；去除行尾空白是另一個職責而新建。

| 要展開的操作 | 既有 ScriptFile | 歸屬 |
| ------------ | --------------- | ---- |
| 列出目標 RuleFile 的所有 Rule 標題 | `scripts/list-rule-titles.sh` | 沿用，內容不變 |
| 列出 Rule 標題並附上行號 | `scripts/list-rule-titles.sh` | 修改既有 ScriptFile，並更新其他執行它的步驟 |
| 去除目標 RuleFile 的行尾空白 | 無同職責的 ScriptFile | 新建 `scripts/trim-trailing-spaces.sh` |

# Rule 5 - 目標步驟必須改寫為委派步驟

- 被展開的操作必須改寫為執行目標 ScriptFile 的 `DELEGATE` 步驟；執行形式與執行結果的命名依 `skill-form-script` 的 `rules/ScriptFile-rule.md` Rule 7。
- 委派步驟中每次執行都不同的參數必須以 `<參數名稱>` 表示，且參數值必須能由使用者需求或先前步驟的結果確定。
- 委派步驟必須說明 ScriptFile 以非 `0` 的 exit code 結束時的處理方式（停止執行、修正後重新執行，或進入指定步驟）。
- 目標步驟含有保留的判斷時，必須在委派步驟之後以獨立步驟保留該判斷，並以執行結果名稱引用 ScriptFile 的輸出。
- 改寫使步驟數量改變時，必須重新編號，並更新目標 `SKILL.md` 中所有引用步驟編號的內文。

## Example

- 原本的步驟 2 拆成委派步驟與保留判斷的 `CHECK` 步驟；步驟重新編號後，原本「回到步驟 1」的引用仍指向寫入步驟。

改寫前：

```markdown
1. `WRITE` 依已載入的完成檢查清單修改目標 RuleFile。
2. `CHECK` 列出目標 RuleFile 的所有 Rule 標題，確認每個標題都表明規則的要求；未通過時回到步驟 1。
```

改寫後：

```markdown
1. `WRITE` 依已載入的完成檢查清單修改目標 RuleFile。
2. `DELEGATE` 執行 `bash scripts/list-rule-titles.sh <目標 RuleFile 路徑>`，取得 Rule 標題清單；exit code 不是 `0` 時停止執行並回報 stderr 內容。
3. `CHECK` Rule 標題清單中的每個標題都表明規則的要求；未通過時回到步驟 1。
```

# Rule 6 - 展開方案必須完整列出變更

- 展開方案必須包含下表所有欄位，供使用者在寫入前確認。
- 抽取模式的展開方案必須列出原步驟操作與腳本草稿敘述的對照。
- 展開方案不得包含目標 ScriptFile 與目標 `SKILL.md` 以外的檔案變更。

| 欄位 | 內容 |
| ---- | ---- |
| 目標步驟 | Phase 編號、步驟編號與原步驟內文 |
| 展開模式 | 抽取、新增，或兩者 |
| 目標 ScriptFile | 檔案路徑，並標明新建、修改或內容不變 |
| 介面 | 參數、stdout 內容與每個 exit code 的意義 |
| 相依工具 | POSIX 規範以外的工具；沒有時標明無 |
| 腳本草稿 | ScriptFile 的完整內容，並標明補定內容與可攜性轉換 |
| 委派步驟 | 新增或更新的 `DELEGATE` 步驟位置、內文與執行結果名稱 |
| 改寫後步驟 | 目標步驟與受重新編號影響的步驟改寫後的內文 |
| 保留的判斷 | 留在 SOP 步驟的判斷；沒有時標明無 |

## Example

- 方案逐欄列出變更，並附上抽取對照，使用者可以直接核對；腳本草稿的完整內容同 `skill-form-script` 的 `rules/ScriptFile-rule.md` Rule 2 的 Example。

展開方案：

- 目標步驟：Phase 2 步驟 2，`CHECK` 以 `grep -P '^# Rule \d+ - '` 列出目標 RuleFile 的所有 Rule 標題，確認每個標題都表明規則的要求；未通過時回到步驟 1。
- 展開模式：抽取。
- 目標 ScriptFile：`scripts/list-rule-titles.sh`（新建）。
- 介面：

  | 項目 | 內容 |
  | ---- | ---- |
  | 參數 | `<RuleFile 路徑>` |
  | stdout | 每行一個 Rule 標題 |
  | Exit code | `0` 成功；`1` 找不到 RuleFile；`2` 用法錯誤 |

- 相依工具：無。
- 腳本草稿：完整內容；補定內容為找不到 RuleFile 時的 exit code `1`；可攜性轉換為 `grep -P` 與 `\d` 改用 `grep -E` 與 `[0-9]`。
- 委派步驟：Phase 2 步驟 2 改為 `DELEGATE` 執行 `bash scripts/list-rule-titles.sh <目標 RuleFile 路徑>`，取得 Rule 標題清單；exit code 不是 `0` 時停止執行並回報 stderr 內容。
- 改寫後步驟：新增 Phase 2 步驟 3，`CHECK` Rule 標題清單中的每個標題都表明規則的要求；未通過時回到步驟 1。
- 保留的判斷：每個標題都表明規則的要求。

抽取對照：

| 原步驟操作 | 腳本草稿敘述 |
| ---------- | ------------ |
| 以 `grep -P '^# Rule \d+ - '` 列出所有 Rule 標題 | `grep -E '^# Rule [0-9]+ - ' "$rule_file" \|\| true` |
