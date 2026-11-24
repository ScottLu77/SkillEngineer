# 工程藍圖：{{SKILL_NAME}}

## 身分

| 項目 | 內容 |
| ---- | ---- |
| 工作情境 | {{SCENARIO}} |
| 目錄 | `{{SKILL_DIR}}` |
| name | `{{SKILL_NAME}}` |
| description | {{DESCRIPTION}} |

## SOP 大綱

<!-- 樣板指示：每個 Phase 重複一個區塊。 -->
### Phase {{PHASE_NUMBER}} -- {{PHASE_TITLE}}

<!-- 樣板指示：每個步驟重複一列。 -->
{{STEP_NUMBER}}. `{{STEP_VERB}}` {{STEP_SUMMARY}}

完成條件：{{PHASE_DONE_CONDITION}}

<!-- 樣板指示：沒有要展開的列時刪除本段落。 -->
## 部位分派表

<!-- 樣板指示：每個要展開的候選重複一列。 -->
| 順序 | 目標步驟 | 性質 | 委派對象 | 展開模式 | 素材 | 理由 |
| ---- | -------- | ---- | -------- | -------- | ---- | ---- |
| {{DISPATCH_ORDER}} | {{TARGET_STEP}} | {{CONTENT_NATURE}} | `{{DERIVER}}` | {{DERIVE_MODE}} | {{MATERIAL}} | {{DISPATCH_REASON}} |

<!-- 樣板指示：沒有不展開的候選時刪除本段落。 -->
## 不展開的內容

<!-- 樣板指示：每個不展開的候選重複一列。 -->
| 步驟 | 內容 | 原因 |
| ---- | ---- | ---- |
| {{KEPT_STEP}} | {{KEPT_CONTENT}} | {{KEPT_REASON}} |

<!-- 樣板指示：工作情境為建立，或沒有需要處置的既有檔案時刪除本段落。 -->
## 既有檔案處置

<!-- 樣板指示：每個需要處置的既有檔案重複一列。 -->
| 既有檔案 | 處置 | 說明 |
| -------- | ---- | ---- |
| `{{LEGACY_FILE}}` | {{LEGACY_DISPOSITION}} | {{LEGACY_NOTE}} |
