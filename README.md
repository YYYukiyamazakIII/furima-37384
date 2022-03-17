# テーブル設計

## users テーブル

| Colum               | Type    | Options                   |
| ------------------- | ------- | ------------------------- |
| nickname            | string  | null: false               |
| email               | string  | null: false, unique: true |
| encrypted_password  | string  | null: false               |
| last_name           | string  | null: false               |
| first_name          | string  | null: false               |
| last_name_kana      | string  | null: false               |
| first_name_kana     | string  | null: false               |
| date_of_birth_year  | date    | null: false               |
| date_of_birth_month | date    | null: false               |
| date_of_birth_day   | date    | null: false               |

### Association

- has_many :items
- has_many :comments
- has_many :purchased_items

## items テーブル
| Colum               | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| name                | string     | null: false                    |
| explanation         | string     | null: false                    |
| category_id         | string     | null: false                    |
| status_id           | string     | null: false                    |
| delivery_charge_id  | string     | null: false                    |
| area_id             | string     | null: false                    |
| date_of_shipping_id | string     | null: false                    |
| price               | integer    | null: false                    |
| user                | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :comments
- has_one :purchased_item

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
| area_id        | string     | null: false                    |
| municipalities | string     | null: false                    |
| street_number  | string     | null: false                    |
| building_name  | string     |                                |
| phone_number   | string     | null: false                    |
| purchased_item | references | null: false, foreign_key: true |

### Association
- be_longs to :purchased_item