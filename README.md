# テーブル設計

## users テーブル

| Column                 | Type       |  Options                       |
| ---------------------- | ---------- | ------------------------------ |
| nickname               | string     | null: false                    |
| email                  | string     | null: false                    |
| password               | string     | null: false                    |
| family_name_full_width | string     | null: false                    |
| first_name_full_width  | string     | null: false                    |
| family_name_kana_input | string     | null: false                    |
| first_name_kana_input  | string     | null: false                    |
| birthday               | date       | null: false                    |

### Association
- has_many   :items
- has_many   :purchases

## items テーブル

| Column                        | Type       |  Options                       |
| ----------------------------- | ---------- | ------------------------------ |
| exhibition_image              | blob       | null: false                    |
| name                          | text       | null: false                    |
| product_explanation           | text       | null: false                    |
| price                         | integer    | null: false                    |
| category_id                   | integer    | null: false                    |
| status_id                     | integer    | null: false                    |
| origin_id                     | integer    | null: false                    |
| charge _id                    | integer    | null: false                    |
| delivery_id   　　　　　　　    | integer    | null: false                    |
| user                          | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one    :purchase
- has_one    :address

## purchase テーブル

| Column                    | Type       |  Options                       |
| ------------------------- | ---------- | ------------------------------ |
| user                      | references | null: false, foreign_key: true |
| items                     | references | null: false, foreign_key: true |

## Association
- belongs_to :user
- belongs_to :item

## address テーブル

| Column                    | Type       |  Options                       |
| ------------------------- | ---------- | ------------------------------ |
| postal_code               | integer    | null: false                    |
| prefectures               | string     | null: false                    |
| city                      | string     | null: false                    |
| house_number              | string     | null: false                    |
| building_name             | string     | null: true                     |
| phone_number              | string     | null: false                    |
| items                     | references | null: false, foreign_key: true |

## Association
- belongs_to :item