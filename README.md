# README

#テーブル設計

## users テーブル

| Column                | Type   | Options     |
| --------------------- | ------ | ----------- |
| nickname              | string | null: false |
| email                 | string | null: false |
| password              | string | null: false |
| password_confirmation | string | null: false |


### Association

- has_many :items
- has_many :comments, through: items
- has_one :userkey
- has_one :addresse



## items テーブル

| Column  | Type    | Options                        |
| ------- | ------- | ------------------------------ |
| name    | string  | null: false                    |
| image   | string  |                                |
| price   | integer | null: false                    |
| user_id | string  | null: false ,foreign_key: true |
| text    | text    |                                |

### Association

- belongs_to :user
- has_many :comments
- has_one :item-information

## item-informations テーブル

| Column     | Type    | Options      |
| ---------- | ------- | ------------ |
| genre      | string  | null: false |
| quality    | string  | null: false |
| payment    | string  | null: false |
| prefecture | string  | null: false |
| days       | string  | null: false |

### Association

- belongs_to :item

## comments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| text    | text       |                                |
| user_id | references | null: false, foreign_key: true |
| item_id | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item


## userkeys テーブル

| Column                | Type    | Options     |
| --------------------- | ------- | ----------- |
| username_kanji        | string  | null: false |
| username_katakana     | string  | null: false |
| birth_year            | integer | null: false |
| birth_month           | integer | null: false |
| birth_day             | integer | null: false |

### Association

- belongs_to :user


## addresses テーブル

| Column        | Type    | Options      |
| ------------- | ------- | ------------ |
| card_id       | integer | null: false |
| exp_month     | integer | null: false |
| exp_year      | integer | null: false |
| cvc           | integer | null: false |
| postal_code   | integer | null: false |
| prefecture    | string  | null: false |
| city          | string  | null: false |
| house_number  | string  | null: false |
| building_name | string  |             |

### Association

- belongs_to :user