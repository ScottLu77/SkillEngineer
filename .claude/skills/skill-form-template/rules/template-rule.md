## Rule 1 -- 固定結構寫作規則

- MUST: 移除佔位符與區塊標記行後, 範本檔剩餘的文字與範例檔中對應的固定結構逐字相同, 含註解、空行、縮排與 key 順序。

### Good example

由 YAML 範例檔 `port: 8080  # http port` 做成的範本, 保留註解與縮排

```
server:
  port: {{port: 服務監聽的 port, 整數}}  # http port
```

### Bad example

同一份範例檔, 範本漏掉註解且縮排由 2 格改成 4 格

```
server:
    port: {{port: 服務監聽的 port, 整數}}
```


## Rule 2 -- 佔位符寫作規則

- MUST: 每個可變值換成 `{{<名稱>: <填寫說明>}}`, <名稱> 與 <填寫說明> 取自拆解清單。
- MUST: 範例檔本身含 `{{` 時, 佔位符改用 `[[<名稱>: <填寫說明>]]`。
- MUST: 同名佔位符的 <填寫說明> 一字不差。

### Good example

Helm values 範例檔本身含 `{{`, 佔位符改用 `[[ ]]`

```
image:
  repository: [[image_repository: 映像檔倉庫路徑]]
  tag: "{{ .Chart.AppVersion }}"
```

### Bad example

範例檔含 `{{` 卻仍用 `{{ }}` 當佔位符, 且同名佔位符的填寫說明不一致

```
image:
  repository: {{image_repository: 映像檔倉庫路徑}}
  mirror: {{image_repository: 鏡像路徑}}
  tag: "{{ .Chart.AppVersion }}"
```


## Rule 3 -- 區塊標記寫作規則

- MUST: 重複區塊在範本中只保留一份, 前後以 `{{#repeat <名稱>}}` 與 `{{/repeat}}` 包住。
- MUST: 選填區塊前後以 `{{#optional <名稱>}}` 與 `{{/optional}}` 包住。
- MUST: 範例檔本身含 `{{` 時, 區塊標記的 `{{` 與 `}}` 改為 `[[` 與 `]]`。
- MUST: 每個區塊標記獨立成行, 縮排與其包住區塊的第一行相同, 且開始標記與結束標記成對出現。

### Good example

Gherkin 範本中多個 Scenario 收成一份重複區塊, 選填的 Background 以選填區塊包住

```
Feature: {{feature_name: 功能名稱, 一句英文}}

  {{#optional background}}
  Background:
    Given {{background_step: 每個情境共用的前置條件}}
  {{/optional}}

  {{#repeat scenario}}
  Scenario: {{scenario_name: 情境名稱, 一句英文}}
    Given {{precondition: 前置條件}}
    When {{action: 使用者操作}}
    Then {{expected_result: 預期結果}}
  {{/repeat}}
```

### Bad example

重複的 Scenario 保留兩份, 區塊標記與內容同行, 且 `{{#optional background}}` 沒有結束標記

```
Feature: {{feature_name: 功能名稱, 一句英文}}

  {{#optional background}} Background:
    Given {{background_step: 每個情境共用的前置條件}}

  Scenario: {{scenario_name: 情境名稱, 一句英文}}
    Given {{precondition: 前置條件}}
  Scenario: {{scenario_name: 情境名稱, 一句英文}}
    Given {{precondition: 前置條件}}
```
