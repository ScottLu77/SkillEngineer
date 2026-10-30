## Rule 1 -- 清單結構寫作規則

- MUST: 拆解清單依序含 `產出物名稱`、`段落分類`、`可變值`、`重複區塊`、`選填區塊` 五段, 沒有內容的段寫「無」。

### Good example

Gherkin 範例檔的拆解清單, 五段齊全且依序排列

```
產出物名稱: login
段落分類: 見下方
可變值: 見下方
重複區塊: scenario (`Scenario:` 起到下一個 `Scenario:` 前)
選填區塊: 無
```

### Bad example

缺少 `重複區塊` 與 `選填區塊` 兩段, 且順序錯亂

```
可變值: 見下方
產出物名稱: login
段落分類: 見下方
```


## Rule 2 -- 段落分類寫作規則

- MUST: 範例檔的每一段都恰好標為「固定結構」或「可變值」之一。
- MUST: 欄位名 (key)、註解、縮排、key 順序與格式語法 (例如 Gherkin 關鍵字、YAML 的 `:` 與 `-`) 都標為固定結構。

### Good example

Gherkin 關鍵字標為固定結構, 關鍵字後的描述標為可變值

```
L1 `Feature: ` -> 固定結構
L1 `User login` -> 可變值
L3 `  Scenario: ` -> 固定結構
L3 `Successful login` -> 可變值
L4 `    Given ` -> 固定結構
L4 `the user is on the login page` -> 可變值
```

### Bad example

把 Gherkin 關鍵字連同描述整段標為可變值, 且 L2 空行未分類

```
L1 `Feature: User login` -> 可變值
L3 `  Scenario: Successful login` -> 可變值
```


## Rule 3 -- 可變值寫作規則

- MUST: 每個可變值寫成 `<名稱>: <填寫說明>`, <名稱> 為 snake_case, <填寫說明> 不為空。
- MUST: 在範例檔中必須相同的可變值使用同一個 <名稱>, 其餘可變值的 <名稱> 互不重複。

### Good example

名稱皆為 snake_case 且各有填寫說明

```
feature_name: 功能名稱, 一句英文
scenario_name: 情境名稱, 一句英文
precondition: Given 後的前置條件
```

### Bad example

名稱非 snake_case, 且 precondition 沒有填寫說明

```
FeatureName: 功能名稱
scenario-name: 情境名稱
precondition:
```
