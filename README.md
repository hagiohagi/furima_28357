# README

#テーブル設計

## users テーブル

| Column                | Type    | Options     |
| --------------------- | ------- | ----------- |
| nickname              | string  | null: false |
| email                 | string  | null: false |
| password              | string  | null: false |
| password_confirmation | string  | null: false |
| firstname_kanji       | string  | null: false |
| lastname_kanji        | string  | null: false |
| firstname_katakana    | string  | null: false |
| lastname_katakana     | string  | null: false |
| birth_day             | date    | null: false |



### Association

- has_many :items
- has_many :comments, through: items
- has_many :orders


## items テーブル

| Column     | Type       | Options                        |
| ---------  | ---------- | ------------------------------ |
| name       | string     | null: false                    |
| image      | string     | null: false                    |
| price      | integer    | null: false                    |
| user       | references | null: false ,foreign_key: true |
| tax        | boolean    | null: false                    |
| text       | text       |                                |
| genre      | integer    | null: false                    |
| quality    | integer    | null: false                    |
| payment    | integer    | null: false                    |
| prefecture | integer    | null: false                    |
| days       | integer    | null: false                    |

### Association

- belongs_to :user
- has_many :comments
- has_one :order

## comments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| text    | text       |                                |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## orders テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association

belongs_to :user
belongs_to :item
has_one :address

## addresses テーブル

| Column         | Type    | Options     |
| -------------- | ------- | ----------- |
| postal_code    | string  | null: false |
| prefecture     | integer | null: false |
| city           | string  | null: false |
| house_number   | string  | null: false |
| building_name  | string  |             |
| phone_number   | integer | null:false  |

### Association

- belongs_to :order