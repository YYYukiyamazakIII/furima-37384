# テーブル設計

## users テーブル

| Colum              | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| last_name          | string  | null: false               |
| first_name         | string  | null: false               |
| last_name_kana     | string  | null: false               |
| first_name_kana    | string  | null: false               |
| date_of_birth      | date    | null: false               |

### Association

- has_many :items
- has_many :comments
- has_many :purchased_items
- has_many :good_items

## items テーブル
| Colum               | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| name                | string     | null: false                    |
| explanation         | text       | null: false                    |
| category_id         | integer    | null: false                    |
| status_id           | integer    | null: false                    |
| delivery_charge_id  | integer    | null: false                    |
| area_id             | integer    | null: false                    |
| date_of_shipping_id | integer    | null: false                    |
| price               | integer    | null: false                    |
| user                | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :comments
- has_one :purchased_item
- has_many :good_items

## comments テーブル
| Colum | Type       | Options                        |
| ----- | ---------- | ------------------------------ |
| text  | string     | null: false                    |
| user  | references | null: false, foreign_key: true |
| item  | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item

## purchased_items
| Colum | Type       | Options                        |
| ----- | ---------- | ------------------------------ |
| user  | references | null: false, foreign_key: true |
| item  | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :shipping_address

## shipping_addresses
| Colum          | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| zip_code       | string     | null: false                    |
| area_id        | integer    | null: false                    |
| municipalities | string     | null: false                    |
| street_number  | string     | null: false                    |
| building_name  | string     |                                |
| phone_number   | string     | null: false                    |
| purchased_item | references | null: false, foreign_key: true |

### Association
- belongs_to :purchased_item

## good_item テーブル
| Colum | Type       | Options                        |
| ----- | ---------- | ------------------------------ |
| user  | references | null: false, foreign_key: true |
| item  | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item