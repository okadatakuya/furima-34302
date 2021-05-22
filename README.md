# usersテーブル

| Column     | Type       | Options     |
| ---------- | ---------- | ----------- |
| email      | string     | null: false |
| password   | string     | null: false |
| name       | string     | null: false |
| nickname   | string     | null: false |
| birthday   | datetime   | null: false |

### Association
- has_many :items
- has_many :comments

# commentsテーブル

| Column          | Type       | Options     |
| --------------- | ---------- | ----------- |
| text            | text       | null: false |
| user            | references | ----------- |
| item            | references | ----------- |

### Association
- belongs_to :users
- belongs_to :items

# itemsテーブル
| Column                 | Type       | Options     |
| ---------------------- | ---------- | ----------- |
| image                  | ---------- | null: false |
| name                   | string     | null: false |
| content                | text       | null: false |
| category               | string     | ----------- |
| delivery_charge_burden | string     | null: false |
| delivery_area          | string     | null: false |
| delivery_day           | string     | null: false |
| price                  | integer    | null: false |
| user                   | references | ----------- |

### Association
- belongs_to :users
- has_many :items
