# rules/rule-rule.md 修改建議

## 一、rule-rule.md 自我審查

對照 `rules/rule-rule.md` 自身的 MUST 與 `templates/rule.md` 的結果: **全部通過**, 結構也符合 template。

| MUST | 結果 |
|---|---|
| R1: Rule 編號從 1 連續 | ✓ 1, 2, 3 |
| R1: 抬頭以「規則」結尾 | ✓ 三個皆是 |
| R2: MUST 只看產出物能答是或否 | ✓ (但見下方第 1 點) |
| R3: 每個 Rule 恰好一個 Good + 一個 Bad | ✓ |
| R3: 例子描述只寫一行 | ✓ L8, 17, 30, 39, 57, 83 |
| R3: 例子列表用 code fence | ✓ (Rule 3 正確使用 4 個反引號) |
| R3: Good 符合本 Rule 全部 MUST | ✓ 三個皆是 |
| R3: Bad 至少違反一條 | ✓ R1 違反「規則」結尾, R2 違反可判定, R3 違反「恰好一個 Bad」 |

### 不違規但值得修的地方

1. **Rule 2 (L26) 是最弱的自我檢驗。** 判斷一條 MUST「是否只看產出物就能答是或否」本身需要主觀判斷。`rule-candidate-rule.md:33` 用另一種說法定義同一件事 (「只寫一個要求, 且兩位審查員各自檢查會得到相同判定」), 兩份檔案對同一標準的措辭可能漸行漸遠。「每條 MUST 只寫一個要求」也只寫在候選規則中, 卻適用於 Phase 2 寫出的規則檔。建議改為:
   ```
   - MUST: <必須遵守的細則> 只寫一個要求, 且兩位審查員只看產出物各自檢查會得到相同的是或否判定。
   ```
2. **Rule 1 的抬頭範圍過大。** 「Rule 寫作規則」聽起來管整個 Rule, 但兩條 MUST 都只管抬頭那一行。Rule 2、Rule 3 都以它們約束的部分命名, 改成「Rule 抬頭寫作規則」較一致。
3. **Bad example 的描述沒說錯在哪。** L17、39、83 只寫「錯誤案例」; `rule-candidate-rule.md` 的 Bad 描述會點出違規處 (例如「第二筆的判定沒有理由」), 這讓 R3「至少違反一條」的檢查變得簡單。
4. **(小事) Rule 3 的例子在 code fence 內含有 heading** (L60–78, L86–96)。人讀沒問題, 但若日後用 grep 檢查 (例如加進 `find-signal-sentences.sh` 或 Phase 4 腳本), 會算出 Rule 3 有三個 `### Good example` 而誤判不通過。

## 二、能否單靠 template + rule-rule.md 寫出完美的規則檔

**結論: 單一 Rule 區塊的格式大致能寫對, 但還寫不出「完美架構與功能」的規則檔。** 主要缺口在整個檔案的結構, 以及 MUST 本身的品質。

有些品質本來就無法用 MUST 保證, 例如規則是否涵蓋真正的需求、例子是否像真實會犯的錯。這些要靠 `rule-candidate-rule.md` 的判定與 Phase 4 的審核, 不必硬塞進 `rule-rule.md`。

### 已經做好的部分

| 面向 | 由誰負責 |
|---|---|
| Rule 區塊骨架: 抬頭 → MUST → Good → Bad | template |
| Rule 編號連續、抬頭格式 | Rule 1 |
| MUST 能客觀判定 | Rule 2 (偏弱) |
| 例子數量、描述、code fence、Good/Bad 與 MUST 的對應 | Rule 3 |

### 缺口 (依影響排序)

**功能面: 規則檔能否被穩定執行**

1. **沒要求一條 MUST 只寫一個要求。** 例如 `MUST: 標題以 feat: 開頭且不超過 50 字`, 審核時只能整條算過或不過, 查不出是哪一部分錯。這個要求只寫在 `rule-candidate-rule.md:33`, 且只約束判定清單, 管不到 Phase 2 寫出的規則檔。
2. **沒規定 MUST 如何分到各 Rule。** 現在可以把不相關的 MUST 塞進同一個 Rule, Rule 1「抬頭以規則結尾」擋不住。較好的切法: 一個 Rule 只管產出物的一個部分 (Header、Body…)。
3. **沒禁止 MUST 之間重複或矛盾。** 「已存在則併入」最容易出這種問題: 舊的寫「不超過 50 字」, 新併入的寫「不超過 72 字」, 現有規則抓不到。
4. **佔位符沒定義。** MUST 常寫 `<原句>`、`<抬頭>` 這類佔位符, 但沒規定它們必須在 template 或前面的 MUST 中定義。目標 skill 若沒有 template, 讀者就不知道 `<X>` 指什麼。
5. **例子的範圍不完整。** Rule 3 只要求 Good 符合「本 Rule」, 因此它可以合法違反其他 Rule。模型會照著例子學, 等於學到錯的東西。
6. **Bad 沒寫錯在哪。** `rule-rule.md` 自己的 Bad 描述只寫「錯誤案例」; 審核者得自己猜違反哪條, 模型也較難從例子學到教訓。`rule-candidate-rule.md` 的寫法較好, 會直接點出錯在哪。

**結構面: 整個檔案長什麼樣**

7. **沒有檔案層級的規則。** 沒規定 Rule 之間空幾行、能否有前言、併入時接續編號還是重排。目前 `rule-candidate-rule.md` 的 Rule 之間空兩行, `rule-rule.md` 空一行, 已經不一致。
8. **巢狀 code fence 沒有規範。** 例子本身含 ``` 時, 外層要改用更長的 fence。`rule-rule.md` Rule 3 自己就這樣做, 但沒寫成規則, 另寫一份規則檔時很容易寫壞。

### 建議補上的 MUST

每條都已先用現有的 Rule 2 檢查過, 確認能只看產出物判定是或否:

````
## Rule 1 補
- MUST: 同一 Rule 的 MUST 都約束產出物的同一部分。
- MUST: 併入既有規則檔時, 新 Rule 接續最後一個 <Rule 編號>。

## Rule 2 補
- MUST: 每條 MUST 只寫一個要求。
- MUST: MUST 中的 `<佔位符>` 都出現在對應的 template 或同一 Rule 前面的 MUST 中。
- MUST: 檔案中沒有兩條 MUST 對產出物的同一部分提出相同或相反的要求。

## Rule 3 補
- MUST: Good example 不違反本檔任何 Rule 的 MUST。
- MUST: Bad example 的 <說一下這個例子在作什麼> 寫出違反了哪一條 MUST。
- MUST: <例子列表> 含有 ``` 時, 外層 code fence 比內層多一個反引號。

## Rule 4 -- 檔案結構規則 (新增)
- MUST: 檔案只由 Rule 區塊組成, 第一行即為 `## Rule 1 -- ...`。
- MUST: 相鄰兩個 Rule 區塊之間恰好一個空行。
````

### 連帶影響

- 補上「Good example 不違反本檔任何 Rule」後, 每個 Rule 都要先自我檢查一遍。例如 Rule 3 的 Good example 內嵌了一個完整的 Rule, 這個內嵌的 Rule 也必須通過新加的所有條款。
- `rule-candidate-rule.md` 也要跟著修: 它的 Rule 之間空兩行, 違反建議的 Rule 4。
