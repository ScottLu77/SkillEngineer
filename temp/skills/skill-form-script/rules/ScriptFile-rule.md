# Rule 1 - 一支 ScriptFile 只負責一個職責

- 一支 ScriptFile 必須只完成一個可以由單一 `DELEGATE` 步驟委派的職責。
- ScriptFile 必須直接放在 `scripts/` 底下，不得建立子目錄。
- ScriptFile 檔名必須使用 `<動詞>-<對象>.sh`，並使用 kebab-case。
- 同一個 Skill 不得有兩支職責相同的 ScriptFile；多個步驟需要相同職責時，必須執行同一支 ScriptFile。

## Example

- 兩支 ScriptFile 各自只有一個職責，檔名以動詞與對象指出職責，且都直接位於 `scripts/`。

```text
scripts/list-rule-titles.sh
scripts/trim-trailing-spaces.sh
```

# Rule 2 - ScriptFile 使用固定結構

- ScriptFile 必須依序包含 shebang、檔頭註解、`set -euo pipefail`、函式定義，並以 `main "$@"` 作為最後一行。
- shebang 必須是 `#!/usr/bin/env bash`。
- 檔頭註解必須依序包含 `用途：`、`用法：`、`輸出：`、`Exit code：` 四個欄位。
- 執行邏輯必須放在 `main` 函式；函式之外只能有 `set -euo pipefail`、`readonly` 常數宣告與 `main "$@"`。
- 函式內的變數必須以 `local` 宣告。

## Example

- 腳本依固定順序組成，檔頭註解四個欄位齊全，邏輯全部在 `main` 內。

```bash
#!/usr/bin/env bash
# 用途：列出 RuleFile 中所有 Rule 的標題。
# 用法：bash scripts/list-rule-titles.sh <RuleFile 路徑>
# 輸出：stdout 每行一個 Rule 標題。
# Exit code：0 成功；1 找不到 RuleFile；2 用法錯誤。

set -euo pipefail

main() {
  if [ "$#" -ne 1 ]; then
    printf '用法：bash scripts/list-rule-titles.sh <RuleFile 路徑>\n' >&2
    exit 2
  fi

  local rule_file="$1"
  if [ ! -f "$rule_file" ]; then
    printf '找不到 RuleFile：%s\n' "$rule_file" >&2
    exit 1
  fi

  grep -E '^# Rule [0-9]+ - ' "$rule_file" || true
}

main "$@"
```

# Rule 3 - ScriptFile 必須可在 Linux 與 macOS 執行

- ScriptFile 必須能以 Bash 3.2 執行。
- ScriptFile 不得使用 Bash 4 以上才有的語法，包含 `declare -A`、`mapfile`、`readarray`、`${var,,}`、`${var^^}`、`&>>`、`|&` 與 `coproc`。
- 指令選項必須使用 GNU 與 BSD 版本行為一致的寫法；下表「不得使用」欄的寫法必須改為「改用」欄的寫法。
- 下表未列出的指令選項，應使用 POSIX 規範定義的選項。
- ScriptFile 應使用兩個平台一致的寫法，不以作業系統分支。
- 沒有一致的寫法而必須以 `uname -s` 分支時，分支必須集中在單一函式。

| 不得使用                  | 改用                                             |
| ------------------------- | ------------------------------------------------ |
| `sed -i`                  | 輸出到 `mktemp` 建立的暫存檔後，以 `mv` 覆蓋原檔 |
| `sed -r`                  | `sed -E`                                         |
| `grep -P`                 | `grep -E`                                        |
| `readlink -f`、`realpath` | `cd "$(dirname "$0")" && pwd`                    |
| `date -d`、`date -v`      | 由參數傳入日期，或只使用 `date +<格式>`          |
| `echo -e`、`echo -n`      | `printf`                                         |
| `xargs -r`                | 先確認輸入不是空的，再執行 `xargs`               |
| `stat -c`、`stat -f`      | 檔案大小使用 `wc -c`，新舊比較使用 `find -newer` |
| `mktemp --suffix`         | 不帶選項的 `mktemp`，或 `mktemp -d`              |

## Example

- 去除行尾空白時不使用 `sed -i`，改為寫入暫存檔後覆蓋；`sed -E` 與 `[[:space:]]` 在 GNU 與 BSD 版本行為一致。

```bash
local tmp_file
tmp_file="$(mktemp)"
sed -E 's/[[:space:]]+$//' "$target_file" > "$tmp_file"
mv "$tmp_file" "$target_file"
```

# Rule 4 - ScriptFile 的介面必須固定

- 輸入必須由命令列參數傳入。
- 輸入是多行資料時，可以改由 stdin 傳入，並必須在檔頭註解的 `用法：` 標明。
- ScriptFile 不得以互動提示要求輸入。
- stdout 必須只輸出委派步驟要使用的結果；診斷與錯誤訊息必須輸出到 stderr。
- Exit code 必須使用 `0` 表示成功、`1` 表示執行失敗、`2` 表示用法錯誤。
- 需要區分其他結果時，可以使用 `3` 以上的 exit code，並必須列在檔頭註解的 `Exit code：`。
- ScriptFile 以非 `0` 的 exit code 結束時，必須在 stderr 指出失敗原因。
- ScriptFile 不得假設呼叫時的工作目錄是 Skill 目錄；需要讀取 Skill 內的檔案時，必須由 ScriptFile 自身的位置推得路徑。

## Example

- 三次執行分別對應成功、執行失敗與用法錯誤；結果只出現在 stdout，失敗原因只出現在 stderr。

| 命令                                                        | stdout                              | stderr                                                | Exit code |
| ----------------------------------------------------------- | ----------------------------------- | ----------------------------------------------------- | --------- |
| `bash scripts/list-rule-titles.sh rules/error-message-rule.md` | `# Rule 1 - 錯誤訊息必須指出失敗原因` | 無                                                    | `0`       |
| `bash scripts/list-rule-titles.sh rules/missing-rule.md`       | 無                                  | `找不到 RuleFile：rules/missing-rule.md`              | `1`       |
| `bash scripts/list-rule-titles.sh`                             | 無                                  | `用法：bash scripts/list-rule-titles.sh <RuleFile 路徑>` | `2`       |

# Rule 5 - ScriptFile 必須自足且相依最小

- ScriptFile 不得 `source` 或執行同一個 Skill 的其他 ScriptFile。
- Skill 不得建立供多支 ScriptFile 共用的函式庫檔案。
- ScriptFile 應只使用 POSIX 規範定義的工具。
- 職責無法只以 POSIX 規範定義的工具完成時，可以使用 `git`、`jq` 等外部工具。
- 使用外部工具時，必須在 `main` 的開頭以 `command -v` 檢查，缺少時以 exit code `1` 結束。
- ScriptFile 不得自動安裝工具。

## Example

- 腳本需要 `jq`，在 `main` 開頭檢查；缺少時指出工具名稱並結束，不嘗試安裝。

```bash
main() {
  if ! command -v jq > /dev/null 2>&1; then
    printf '缺少必要工具：jq\n' >&2
    exit 1
  fi

  jq -r '.name' "$1"
}
```

# Rule 6 - ScriptFile 只做決定性的機械工作

- ScriptFile 在相同參數與相同檔案狀態下，必須產生相同的結果。
- ScriptFile 不得包含需要理解語意才能做出的判斷；這類判斷必須留在 SOP 步驟，由執行者依 ScriptFile 的輸出完成。
- 需要解析 JSON、YAML 等結構化格式時，必須使用專用工具，不得以 `sed` 或 `grep` 自行解析。

## Example

- 能以字面規則得到唯一結果的工作歸屬 ScriptFile；需要理解內容才能判斷的工作留在 SOP 步驟。

| 工作                                   | 歸屬      |
| -------------------------------------- | --------- |
| 列出 RuleFile 中所有 Rule 的標題       | ScriptFile |
| 檢查 Rule 編號是否從 `1` 開始連續      | ScriptFile |
| 判斷 Rule 標題是否表明規則的要求       | SOP 步驟  |
| 判斷兩條 Rule 是否重述相同的要求       | SOP 步驟  |

# Rule 7 - ScriptFile 必須由 SKILL.md 以 DELEGATE 步驟執行

- 擁有 ScriptFile 的 `SKILL.md` 必須以 `DELEGATE` 步驟執行 ScriptFile。
- `DELEGATE` 步驟必須以 `bash scripts/<檔名> <參數>` 的形式執行，不得依賴檔案的執行權限。
- `DELEGATE` 步驟必須為執行結果指定表明用途的名稱，後續步驟必須使用該名稱引用執行結果。
- `scripts/` 底下的每支 ScriptFile 必須至少被一個 `DELEGATE` 步驟執行；沒有步驟執行的 ScriptFile 必須刪除。
- 腳本路徑的提名位置依 `skill-form-sop` 的 `rules/reference-rule.md` Rule 1。

## Example

- 委派步驟以 `bash` 執行腳本並將結果命名為「Rule 標題清單」，後續步驟只引用該名稱。

```markdown
3. `DELEGATE` 執行 `bash scripts/list-rule-titles.sh <目標 RuleFile 路徑>`，取得 Rule 標題清單。
4. `CHECK` Rule 標題清單中的每個標題都表明規則的要求。
```

# Rule 8 - ScriptFile 必須經過執行驗證

- 建立或修改 ScriptFile 後，必須以 `bash -n` 檢查語法。
- 必須以一組有效參數實際執行，確認 stdout 與 exit code 符合檔頭註解。
- 必須以一組錯誤用法執行，確認 exit code 為 `2`。
- ScriptFile 會修改檔案時，試跑必須在暫存目錄中的副本上執行。
- 執行環境有 `shellcheck` 時，必須執行 `shellcheck` 並修正所有警告。
- 執行環境沒有 `shellcheck` 時，可以略過 `shellcheck`。
- 交付時必須說明實際驗證過的作業系統，以及是否執行過 `shellcheck`。

## Example

- 驗證依序涵蓋語法、有效參數與錯誤用法，並在交付時說明驗證範圍。

```text
$ bash -n scripts/list-rule-titles.sh; echo "exit=$?"
exit=0
$ bash scripts/list-rule-titles.sh rules/error-message-rule.md; echo "exit=$?"
# Rule 1 - 錯誤訊息必須指出失敗原因
exit=0
$ bash scripts/list-rule-titles.sh; echo "exit=$?"
用法：bash scripts/list-rule-titles.sh <RuleFile 路徑>
exit=2

驗證範圍：已在 Linux 執行；未在 macOS 執行；環境沒有 shellcheck，已略過。
```
