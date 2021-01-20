# README

## usersテーブル

| Column | Type | Option |
| ------ | ---- | ------ |
| nickname | string | null: false |
| email | string | null: false |
| encrypted_password | string | null: false |
| first_name | string | null: false |
| last_name | string | null: false |
| first_name_kana | string | null: false |
| last_name_kana | string | null: false |
| year | string | null: false |
| month | string | null: false |
| day | string |null: false |

### Association

- has_many : items
- has_many : purchases


## itemsテーブル

| Column | Type | Option |
| ------ | ---- | ------ |
| image(ActiveStorageで実装)|  |  |
| item_name | string | null: false |
| explanation | text | null: false |
| category | string | null: false |
| state | string | null: false |
| del_burden | string | null: false |
| del_area | string | null: false |
| del_days | string | null: false |
| price | string | null: false |

### Association

- belongs_to : user
- has_one : purchase


## purchasesテーブル

| Column | Type | Option |
| ------ | ---- | ------ |
| street_address | references |  |
| user | references |  |
| item | references |  |

### Association

- belongs_to : user
- belongs_to : item
- has_one : street_address


## street_addressテーブル

| Column | Type | Option |
| ------ | ---- | ------ |
| postal_code | string | null: false |
| prefectures | string | null: false |
| municipalities | string | null: false |
| address | string | null: false |
| building | string |  |
| phone_number | string | null: false |

### Association

- belongs_to : purchase
