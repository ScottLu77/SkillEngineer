# skill-engineering 與 extract-skill-rule 審查報告

審查日期: 2026-11-02。審查對象包含當時尚未 commit 的 extract-skill-rule 修改。

## 結論

**這套流程能寫出格式合規的 skill，但還不能保證把 skill 改好。**

- **新建：** 堪用，產出的 skill 結構乾淨，規則檔也合規。但有些步驟是 agent 超出文字指示才完成的。
- **修改舊 skill：** 照字面跑，extract-skill-rule 的審核全數通過，但當時的 skill 跑不起來。這次能修好，只因為 agent 把「確認能產出 (c)」解讀得比較寬。

## 實測結果

兩次都由 subagent 在沙盒照 SOP 逐步執行。

| | 修改舊 skill (`write-release-note`) | 新建 skill (`write-weekly-report`) |
|---|---|---|
| 規則抽取 | ✅ 舊 MUST 與範例都轉入 | ✅ 4 條格式要求都抽出 |
| 流程內審核 | ⚠️ extract 通過時，有 3 個引用檔不存在 | ⚠️ 含違規步驟，卻第一次就通過 |
| 能否產出 (c) | 只靠審核時的補救 | 只審文字，沒有實際跑過 |

## 必須先修的問題

1. **舊 skill 的 `scripts/`、`templates/` 不會帶到目標 skill** (`skill-engineering/SKILL.md:18-23`)：Phase 2 只寫 `SKILL.md`，Phase 3 只寫 `rules/`。實測中，目標 skill 引用的腳本和範本都不存在。
2. **沒有檢查引用的檔案是否存在** (`extract-skill-rule/SKILL.md:32`)：(c) 只查「規則檔有被引用」，沒查反方向。舊的 `rules/style.md` 引用留了兩處，審核仍然通過。修正發生在 extract 結束後，所以最終版本也沒有重新審核。
3. **沒有驗證 skill 真的變好**：
   - (a)~(e) 沒有「修改目標」和「驗收條件」欄位。
   - 沒有試跑，也沒有和舊版比較。
   - 實測中，沒有破壞性變更的版本會留下空的 Breaking Changes 區段，流程沒有追問。
4. **Phase 2 第 3 步的資訊來源不足** (`skill-engineering/SKILL.md:19`)：它只參考 (d)，但 (d) 依規定不能寫「怎麼做」。兩次實測都超出文字才寫得出來，做法還不一致：
   - 修改案例把格式要求寫在 SOP 步驟裡，並自行決定沿用舊步驟。
   - 新建案例把格式要求放進 (d)，`git log` 指令則直接取自原始需求。
5. **指引類的舊規則會消失**：「語氣要友善」判為指引後，只在 TELL 提一句，目標 skill 裡就沒有了。修改舊 skill 等於默默丟掉行為要求。

## 其他問題

| 問題 | 位置 | 依據 |
|---|---|---|
| 動作詞沒有「執行指令」，實測只能寫 ``DELEGATE 分派給 `git log` ``，違規卻通過審核 | `sop-rule.md:28` | 實測 |
| 內容類規則的判定不穩定：MUST 只列格式、編號、命名、用詞、範例；本次把「不收錄 chore」判為規則候選，前一次測試的同類句子卻判為指引 | `rule-candidate-rule.md:40` | 實測對照 |
| 腳本漏抓「不能、要、應該、不要、須、恰好」和英文，測試 7 條全漏，只能靠 LLM 補抓 | `find-signal-sentences.sh:14` | 實測 |
| Phase 1 判定要用 rule-rule，但到 Phase 2 才讀 | `rule-candidate-rule.md:42`、`extract-skill-rule/SKILL.md:11` | 靜態 |
| 第 1 步就要讀舊 skill，但路徑第 3 步才確定；使用者改路徑後只回第 3 步，不會重讀 | `skill-engineering/SKILL.md:10,13` | 靜態 |
| 來源與目標路徑相同時，舊規則檔被直接刪除，沒有備份或確認 | `extract-skill-rule/SKILL.md:22` | 靜態 |
| 兩個 skill 的 Phase 4 都引用規則檔卻沒有 READ，違反 extract 自己 Phase 3 第 2 步的要求 | 兩份 `SKILL.md` | 機械檢查 |

## 是否遵守 sop-rule

以下是人工逐行檢查的結果，大致合規，有三處例外：

- **編號與去向：** 都通過。
- **`WRITE 刪除`：** WRITE 的定義是「寫檔」，刪檔不算在內，也沒有對應的動作詞 (`extract-skill-rule/SKILL.md:22`)。
- **範本與範例不一致：** 範本寫 `, <去向>` (`templates/sop.md:10`)，Good example 和實際步驟的條件句卻用 `; 若...`，嚴格的審查者會判定不符。
- **無法只看產出物判定：** `sop-rule.md:4` 的 Title 要對照 high-level SOP，這個問題同時違反 rule-rule。

## 是否遵守 rule-rule

Rule 1 的標題格式、Rule 3、Rule 4 的結構都通過，兩個實測產出的規則檔也合規。問題集中在 MUST 能否客觀判定，連 rule-rule 自己也有：

| 違規的 MUST | 違反的規則 | 原因 |
|---|---|---|
| `sop-rule.md:4` | R2 只看產出物、只管一個對象 | 要對照外部文件，還同時管 Title 和 Phase 對應 |
| `draft-sop-rule.md:5` | R2 兩位審查員判定相同 | 「做什麼 / 怎麼做」主觀，兩次實測的做法確實不同 |
| `rule-rule.md:30` | 自身 | 「兩位審查員會得到相同判定」本身無法客觀檢查 |
| `rule-rule.md:6` | R2 兩位審查員判定相同 | 「產出物部分」沒有定義 |
| `rule-candidate-rule.md:10` | R2 只管一個對象 | 同時管 `<產出物>` 和 `<部分>` |
| `rule-candidate-rule.md:41` | R2 兩位審查員判定相同 | 判定標準同樣主觀；實測中「不出現人名」也有同樣的邊界問題 |
| `rule-candidate-rule.md:70` | R1 抬頭要點名產出物部分 | 「掃描範圍」是流程，不是判定清單的組成部分 |

## 建議修法

1. **補齊修改舊 skill 的流程：** 在 (a)~(e) 加上修改目標和驗收條件，並增加複製 `scripts/`、`templates/` 的步驟。
2. **加強檢查：** 在 Phase 4 檢查每個引用都存在，修正後重跑 extract 的審核。
3. **加入實際驗證：** 試跑目標 skill，用驗收條件判定，修改時再和舊版比較。這項最重要，也是目前唯一能回答「有沒有變好」的方法。
4. **明確 Phase 2 第 3 步的來源：** 列入原始需求和舊 SOP，並決定格式要求放哪裡。
5. **處理指引和動作詞：** 指引不要丟棄，改為留在步驟裡或詢問使用者；同時增加「執行指令」和「刪檔」的動作詞。

## 這次測試的限制

- 每種情境各只跑一次，fixture 也很小，都是中文 SOP 格式。
- ASK 一律自動回「確認」，所以沒測到真人補充需求的情況。
- 兩個產出的 skill 都沒有實際執行。
- 標「靜態」的問題是讀文件推導的，實測沒有觸發。
