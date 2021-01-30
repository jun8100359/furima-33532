# README

## usersテーブル

| Column | Type | Option |
| ------ | ---- | ------ |
| nickname | string | null: false |
| email | string | null: false, unique: true |
| encrypted_password | string | null: false |
| first_name | string | null: false |
| last_name | string | null: false |
| first_name_kana | string | null: false |
| last_name_kana | string | null: false |
| birth_day | date | null: false |

### Association

- has_many : items
- has_many : purchases


## itemsテーブル

| Column | Type | Option |
| ------ | ---- | ------ |
| item_name | string | null: false |
| explanation | text | null: false |
| category_id | integer | null: false |
| state_id | integer | null: false |
| burden_id | integer | null: false |
| prefectures_id | integer | null: false |
| days_id | integer | null: false |
| price | integer | null: false |
| user_id | references | |

### Association

- belongs_to : user
- has_one : purchase


## purchasesテーブル

| Column | Type | Option |
| ------ | ---- | ------ |
| user | references | null: false, foreign_key: true |
| item | references | null: false, foreign_key: true |

### Association

- belongs_to : user
- belongs_to : item
- has_one : street_address


## street_addressテーブル

| Column | Type | Option |
| ------ | ---- | ------ |
| postal_code | string | null: false |
| prefectures_id | integer | null: false |
| municipalities | string | null: false |
| address | string | null: false |
| building | string |  |
| phone_number | string | null: false |
| purchase | references | null: false, foreign_key: true |

### Association

- belongs_to : purchase
