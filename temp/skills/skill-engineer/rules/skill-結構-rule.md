# Rule 1 - Skill 目錄只包含 SKILL.md 與三個部位目錄

- Skill 目錄名稱必須使用 kebab-case。
- Skill 目錄必須直接包含 `SKILL.md`。
- 部位檔案必須只放在 `rules/`、`templates/` 與 `scripts/` 三個目錄，且三個目錄底下不得再建立子目錄。
- Skill 目錄不得有這三個目錄以外的子目錄。
- 沒有檔案的部位目錄不得存在。
- Skill 目錄可以直接包含 `LICENSE` 等不被任何步驟讀取的授權檔。

## Example

- 目錄只有 `SKILL.md` 與實際用到的兩個部位目錄；沒有腳本，因此沒有 `scripts/`。

```text
meeting-minutes/
├── SKILL.md
├── rules/
│   └── 會議紀錄-rule.md
└── templates/
    ├── meeting-minutes.md
    └── meeting-minutes.example.md
```

# Rule 2 - Frontmatter 必須宣告與目錄一致的身分

- `SKILL.md` 必須以 YAML frontmatter 開頭，並包含 `name` 與 `description` 兩個欄位。
- `name` 必須與 Skill 目錄名稱相同。
- 使用者沒有要求時，不得加入 `name` 與 `description` 以外的欄位。
- 優化與遷移時，既有 frontmatter 的其他欄位必須保留。

## Example

- `name` 與目錄 `meeting-minutes/` 相同，只有兩個必要欄位。

```markdown
---
name: meeting-minutes
description: 當要從會議逐字稿產生會議紀錄時，必須使用本 skill。
---
```

# Rule 3 - description 必須說明觸發條件與相鄰 skill 的邊界

- `description` 必須說明使用者提出哪一種工作時要使用本 skill。
- `description` 必須使用「必須使用本 skill」表達觸發強度。
- 有其他 skill 處理相近工作時，`description` 必須以「改用 `<skill 名稱>`」說明各自的邊界。
- `description` 不得描述 Phase、步驟或部位檔案等執行細節。

## Example

- 描述交代了觸發的工作與相鄰 skill 的邊界，沒有提到流程。

```text
當要從會議逐字稿產生會議紀錄時，必須使用本 skill。只需要逐字稿摘要而不需要決議與待辦事項時改用 transcript-summary。
```

# Rule 4 - SKILL.md 的內文只有 SOP

- Frontmatter 之後的第一個非空白行必須是 `# SOP`。
- `SKILL.md` 不得有 `# SOP` 以外的一級標題。
- 判準、格式與命令不得以 `# SOP` 之外的段落存放在 `SKILL.md`。
- `# SOP` section 的結構依 `skill-form-sop` 的 `rules/SOP-rule.md`。

## Example

- Frontmatter 之後直接進入 `# SOP`，沒有概述段落或其他一級標題。

```markdown
---
name: meeting-minutes
description: 當要從會議逐字稿產生會議紀錄時，必須使用本 skill。
---

# SOP

## Phase 1 -- 理解會議內容
```

# Rule 5 - 部位檔案與 SOP 步驟必須互相對應

- `rules/`、`templates/` 與 `scripts/` 底下的每個檔案，必須被 `SKILL.md` 的至少一個步驟以反引號標示的相對路徑提名。
- `SKILL.md` 步驟提名的每個部位檔案路徑必須實際存在。
- `templates/` 底下的骨架與範例必須成對存在。
- 沒有任何步驟提名的部位檔案必須刪除，或補上使用它的步驟。

## Example

- 每列都能由檔案清單與步驟內文判斷；第三列的檔案沒有步驟提名，第四列的路徑不存在。

| 檔案或路徑 | 步驟內文 | 判定 |
| ---------- | -------- | ---- |
| `rules/會議紀錄-rule.md` | `READ` `rules/會議紀錄-rule.md` 的所有 Rule | 符合 |
| `templates/meeting-minutes.md`、`templates/meeting-minutes.example.md` | `READ` 同一步驟列出兩個路徑 | 符合 |
| `scripts/list-open-items.sh` | 沒有步驟提名 | 不符合：孤兒檔 |
| `rules/待辦-rule.md` | `READ` `rules/待辦-rule.md`，但檔案不存在 | 不符合：失效路徑 |

# Rule 6 - 同一項要求只能存在於一個位置

- 同一項要求不得同時出現在步驟內文、RuleFile、樣板組與 ScriptFile 之中的兩處以上。
- 兩個以上步驟需要相同的判準、格式或機械工作時，必須共用同一個部位檔案。
- 展開完成後，步驟內文不得殘留已移入部位檔案的判準、格式或命令。

## Example

- 「必須有單一負責人」只留在 RuleFile；步驟內文改為引用載入結果。

| 位置 | 展開前 | 展開後 |
| ---- | ------ | ------ |
| Phase 2 步驟 2 內文 | `WRITE` 產生會議紀錄，待辦事項必須有單一負責人。 | `WRITE` 依已載入的會議紀錄檢查清單產生會議紀錄。 |
| `rules/會議紀錄-rule.md` | 不存在 | 待辦事項必須有單一負責人。 |

# Rule 7 - 既有檔案必須有明確處置

- 優化與遷移時，目標 skill 目錄中不符合 Rule 1 的每個既有檔案與目錄，必須列入工程藍圖的「既有檔案處置」。
- 每個既有檔案的處置必須是下表其中一種。
- 處置為併入時，必須指明承接內容的部位分派表順序。
- 既有檔案必須在承接其內容的列已展開之後才可以刪除；該列未展開時必須保留既有檔案，並在交付時說明。
- 不得刪除沒有列入已確認工程藍圖的檔案。

| 處置 | 適用情況 |
| ---- | -------- |
| 併入後刪除 | 內容由某一列的展開承接 |
| 搬移 | 檔案已符合部位規範，只是位置不符合 Rule 1 |
| 保留 | 授權檔，或使用者要求保留 |
| 刪除 | 內容已不被任何步驟需要，且使用者已在工程藍圖中確認 |

## Example

- `references/format.md` 的內容由順序 2 的樣板展開承接，展開後才刪除；`LICENSE` 保留。

| 既有檔案 | 處置 | 說明 |
| -------- | ---- | ---- |
| `references/format.md` | 併入後刪除 | 由順序 2 承接 |
| `LICENSE` | 保留 | 授權檔 |
