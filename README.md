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
- belongs_to :purchases

# purchasesテーブル
| Column           | Type           | Options           |
| ---------------- | -------------- | ----------------- |
| card_number      | string         | null: false       |
| expiration_month | string         | null: false       |
| expiration_day   | string         | null: false       |
| security_code    | string         | null: false       |
| user             | references     | foreign_key: true |
| item             | references     | foreign_key: true |
| shippings        | references     | foreign_key: true |


### Association
- belongs_to :user
- belongs_to :item
- has_one :shipping

# shippingsテーブル
| Column          | Type           | Options           |
| --------------- | -------------- | ----------------- |
| postal_code     | string         | null: false       |
| prefectures     | string         | null: false       |
| municipality    | string         | null: false       |
| address         | string         | null: false       |
| building_name   | string         | ----------------- |
| phone_number    | string         | null: false       |
| purchases       | references     | foreign_key: true |


### Association
- belongs_to :purchase

