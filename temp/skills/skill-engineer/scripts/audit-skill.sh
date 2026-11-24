#!/usr/bin/env bash
# 用途：稽核一個 skill 目錄的結構（目錄組成、SOP 標題與步驟編號、部位檔案與步驟的對應、樣板成對）。
# 用法：bash scripts/audit-skill.sh <skill 目錄>
# 輸出：stdout 每行一項發現，格式為「[代碼] 對象：說明」；沒有發現時沒有輸出。
# Exit code：0 沒有發現；1 找不到 skill 目錄或 SKILL.md；2 用法錯誤；3 有發現。

set -euo pipefail

# 列出不符合規範的子目錄、空的部位目錄與部位目錄內的子目錄。
audit_directories() {
  local skill_dir="$1"
  local entry name sub

  for entry in "$skill_dir"/*/; do
    [ -d "$entry" ] || continue
    name="$(basename "$entry")"
    case "$name" in
      rules | templates | scripts)
        if [ -z "$(find "$entry" -type f | head -n 1)" ]; then
          printf '[EMPTY-DIR] %s/：部位目錄沒有任何檔案\n' "$name"
        fi
        find "$skill_dir/$name" -type d ! -path "$skill_dir/$name" | sort | while IFS= read -r sub; do
          printf '[SUB-DIR] %s：部位目錄底下不得有子目錄\n' "${sub#"$skill_dir"/}"
        done
        ;;
      *)
        printf '[DIR] %s/：不是 rules/、templates/ 或 scripts/\n' "$name"
        ;;
    esac
  done
}

# 檢查 SKILL.md 的 SOP 標題結構、Phase 與步驟編號、受控動詞與完成條件。
audit_sop() {
  local skill_md="$1"

  awk '
    function close_phase() {
      if (phase != "" && !has_done) {
        print "[PHASE-DONE] Phase " phase "：缺少以「完成條件：」開頭的段落"
      }
      phase = ""
    }
    NR == 1 && $0 == "---" { in_frontmatter = 1; next }
    in_frontmatter { if ($0 == "---") in_frontmatter = 0; next }
    /^[ ]*(```|~~~)/ { in_fence = !in_fence; next }
    in_fence { next }
    /^# / {
      close_phase()
      if ($0 == "# SOP") {
        sop_count++
        in_sop = 1
      } else {
        in_sop = 0
        print "[H1] 第 " NR " 行：不得有 # SOP 以外的一級標題"
      }
      next
    }
    sop_count == 0 && $0 !~ /^[ \t]*$/ {
      if (!reported_preamble) {
        print "[PREAMBLE] 第 " NR " 行：frontmatter 之後的第一個非空白行必須是 # SOP"
        reported_preamble = 1
      }
      next
    }
    !in_sop { next }
    /^## / {
      close_phase()
      if ($0 ~ /^## Phase [0-9]+ -- ./) {
        expected_phase++
        split($0, parts, " ")
        phase = parts[3]
        has_done = 0
        expected_step = 0
        if (phase + 0 != expected_phase) {
          print "[PHASE-NUMBER] Phase " phase "：編號應為 " expected_phase
        }
      } else {
        print "[PHASE-TITLE] 第 " NR " 行：二級標題必須是「## Phase N -- <phase title>」"
      }
      next
    }
    phase != "" && /^[0-9]+\. / {
      expected_step++
      step = $1
      sub(/\.$/, "", step)
      if (step + 0 != expected_step) {
        print "[STEP-NUMBER] Phase " phase " 步驟 " step "：編號應為 " expected_step
      }
      if ($2 != "`READ`" && $2 != "`THINK`" && $2 != "`WRITE`" && $2 != "`CHECK`" && $2 != "`DELEGATE`") {
        print "[STEP-VERB] Phase " phase " 步驟 " step "：必須以反引號標示的受控動詞開頭"
      }
      next
    }
    phase != "" && index($0, "完成條件：") == 1 { has_done = 1 }
    END {
      close_phase()
      if (sop_count != 1) {
        print "[SOP] SKILL.md：# SOP section 應有 1 個，實際有 " sop_count + 0 " 個"
      } else if (expected_phase == 0) {
        print "[SOP] SKILL.md：# SOP 底下沒有任何 Phase"
      }
    }
  ' "$skill_md"
}

# 列出 SKILL.md 在 code block 以外、以反引號標示的部位檔案路徑。
list_named_paths() {
  local skill_md="$1"

  awk '
    /^[ ]*(```|~~~)/ { in_fence = !in_fence; next }
    in_fence { next }
    {
      line = $0
      while (match(line, /`[^`]+`/)) {
        span = substr(line, RSTART + 1, RLENGTH - 2)
        line = substr(line, RSTART + RLENGTH)
        count = split(span, words, " ")
        for (i = 1; i <= count; i++) {
          if (words[i] ~ /^(rules|templates|scripts)\/.*[^\/]$/) print words[i]
        }
      }
    }
  ' "$skill_md" | sort -u
}

# 列出 rules/、templates/ 與 scripts/ 底下實際存在的檔案（相對於 skill 目錄）。
list_part_files() {
  local skill_dir="$1"
  local part file

  for part in rules templates scripts; do
    [ -d "$skill_dir/$part" ] || continue
    find "$skill_dir/$part" -type f | sort | while IFS= read -r file; do
      printf '%s\n' "${file#"$skill_dir"/}"
    done
  done
}

# 比對部位檔案與 SKILL.md 提名的路徑，列出孤兒檔與失效路徑。
audit_wiring() {
  local named_list="$1"
  local file_list="$2"
  local path

  while IFS= read -r path; do
    [ -n "$path" ] || continue
    if ! grep -qxF -- "$path" "$named_list"; then
      printf '[ORPHAN] %s：沒有任何 SKILL.md 步驟提名\n' "$path"
    fi
  done < "$file_list"

  while IFS= read -r path; do
    [ -n "$path" ] || continue
    if ! grep -qxF -- "$path" "$file_list"; then
      printf '[MISSING] %s：SKILL.md 提名的檔案不存在\n' "$path"
    fi
  done < "$named_list"
}

# 檢查 templates/ 底下的骨架與範例是否成對存在。
audit_template_pairs() {
  local file_list="$1"
  local path base ext counterpart

  while IFS= read -r path; do
    case "$path" in
      templates/*.example.*)
        base="${path%.example.*}"
        ext="${path##*.}"
        counterpart="$base.$ext"
        if ! grep -qxF -- "$counterpart" "$file_list"; then
          printf '[PAIR] %s：缺少對應的骨架 %s\n' "$path" "$counterpart"
        fi
        ;;
      templates/*.*)
        base="${path%.*}"
        ext="${path##*.}"
        counterpart="$base.example.$ext"
        if ! grep -qxF -- "$counterpart" "$file_list"; then
          printf '[PAIR] %s：缺少對應的範例 %s\n' "$path" "$counterpart"
        fi
        ;;
      templates/*)
        printf '[PAIR] %s：樣板檔沒有副檔名\n' "$path"
        ;;
    esac
  done < "$file_list"
}

main() {
  if [ "$#" -ne 1 ]; then
    printf '用法：bash scripts/audit-skill.sh <skill 目錄>\n' >&2
    exit 2
  fi

  local skill_dir="${1%/}"
  if [ ! -d "$skill_dir" ]; then
    printf '找不到 skill 目錄：%s\n' "$skill_dir" >&2
    exit 1
  fi

  local skill_md="$skill_dir/SKILL.md"
  if [ ! -f "$skill_md" ]; then
    printf '找不到 SKILL.md：%s\n' "$skill_md" >&2
    exit 1
  fi

  local work_dir
  work_dir="$(mktemp -d)"
  trap "rm -rf '$work_dir'" EXIT

  local named_list="$work_dir/named"
  local file_list="$work_dir/files"
  local findings="$work_dir/findings"

  list_named_paths "$skill_md" > "$named_list"
  list_part_files "$skill_dir" > "$file_list"

  {
    audit_directories "$skill_dir"
    audit_sop "$skill_md"
    audit_wiring "$named_list" "$file_list"
    audit_template_pairs "$file_list"
  } > "$findings"

  if [ -s "$findings" ]; then
    cat "$findings"
    exit 3
  fi
}

main "$@"
