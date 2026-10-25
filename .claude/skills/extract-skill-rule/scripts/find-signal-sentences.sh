#!/usr/bin/env bash
# 列出 SKILL.md 中含規則訊號字或內嵌範例的句子, 並標註所在的 Phase 與步驟。
# 本腳本即訊號字的唯一定義 (rules/rule-candidate-rule.md Rule 3 引用其輸出); 位置寫法須與該檔 Rule 1 一致。
#
# 用法: find-signal-sentences.sh <SKILL.md>
# 輸出: 每行一筆, tab 分隔: 行號  位置  [命中訊號]  句子
set -euo pipefail

if [[ $# -ne 1 || ! -f $1 ]]; then
  echo "用法: $0 <SKILL.md>" >&2
  exit 2
fi

SIGNALS='格式為|必須|不可|只能|從 1 開始|例如'

awk -v signals="$SIGNALS" '
BEGIN { n = split(signals, sig, "|"); loc = "(Phase 外)" }

# 跳過 frontmatter
NR == 1 && /^---$/ { infm = 1; next }
infm { if (/^---$/) infm = 0; next }

# 暫存的「例如:」: 下一行是 code fence 時由該範例代表, 不另輸出
pending != "" { if (!/^[ \t]*```/) print pending; pending = "" }

# 內嵌範例: 整個 code fence 當成一筆
/^[ \t]*```/ {
  if (!infence) { infence = 1; fstart = NR; fhead = $0 }
  else {
    infence = 0
    printf "L%d-%d\t%s\t[範例]\t%s ... (%d 行)\n", fstart, NR, loc, fhead, NR - fstart + 1
  }
  next
}
infence { next }

# 追蹤目前位置: 非 Phase 的 1-3 級標題結束 Phase; 其餘未縮排的非步驟行結束步驟
/^### Phase [0-9]+/ { match($0, /Phase [0-9]+/); phase = substr($0, RSTART, RLENGTH); loc = phase " (步驟外)"; next }
/^##?#? /           { phase = "" }
/^[0-9]+\. /        { match($0, /^[0-9]+/); loc = phase ? phase " 第 " substr($0, 1, RLENGTH) " 步" : "(Phase 外)" }
/^[^ \t0-9]/ || /^[0-9]+[^0-9.]/ { loc = phase ? phase " (步驟外)" : "(Phase 外)" }

# 逐句檢查訊號字
{
  m = split($0, sent, /。|；|; /)
  for (i = 1; i <= m; i++) {
    hits = ""
    for (j = 1; j <= n; j++)
      if (index(sent[i], sig[j])) hits = hits (hits ? "," : "") sig[j]
    if (hits != "") {
      s = sent[i]; sub(/^[ \t]*([0-9]+\.|-)?[ \t]*/, "", s)
      out = sprintf("L%d\t%s\t[%s]\t%s", NR, loc, hits, s)
      if (i == m && s ~ /^例如(:|：)?[ \t]*$/) pending = out
      else print out
    }
  }
}

END {
  if (pending != "") print pending
  if (infence) { print "警告: L" fstart " 的 code fence 未關閉" > "/dev/stderr"; exit 1 }
}
' "$1"
