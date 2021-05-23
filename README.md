# usersテーブル

| Column               | Type       | Options                   |
| -------------------- | ---------- | ------------------------- |
| email                | string     | null: false, unique: true |
| encrypted_password   | string     | null: false               |
| first_name           | string     | null: false               |
| last_name            | string     | null: false               |
| first_name_hurigana  | string     | null: false               |
| last_name_hurigana   | string     | null: false               |
| nickname             | string     | null: false               |
| birthday             | date       | null: false               |

### Association
- has_many :items
- has_many :comments
- has_many :purchases
- belongs_to :shipping

# commentsテーブル

| Column          | Type       | Options     |
| --------------- | ---------- | ----------- |
| text            | text       | null: false |
| user            | references | ----------- |
| item            | references | ----------- |

### Association
- belongs_to :user
- belongs_to :items

# itemsテーブル
| Column                    | Type       | Options           |
| ------------------------- | ---------- | ----------------- |
| name                      | string     | null: false       |
| content                   | text       | null: false       |
| category_id               | integer    | null: false       |
| condition_id              | integer    | null: false       |
| delivery_charge_burden_id | integer    | null: false       |
| delivery_area_id          | integer    | null: false       |
| delivery_day_id           | integer    | null: false       |
| price                     | integer    | null: false       |
| user                      | references | foreign_key: true |

### Association
- belongs_to :user
- has_many :comments
- belongs_to :purchase
- belongs_to :shipping

# purchasesテーブル
| Column          | Type           | Options           |
| --------------- | -------------- | ----------------- |
| user            | references     | foreign_key: true |
| item            | references     | foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :shipping

# shippingsテーブル
| Column          | Type           | Options           |
| address         | string         | null: false       |
| date            | datetime       | null: false       |
| user            | string         | foreign_key: true |
| item            | string         | foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- belongs_to :purchase

