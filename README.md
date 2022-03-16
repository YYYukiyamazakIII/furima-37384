# テーブル設計

## users テーブル

| Colum               | Type    | Options     |
| ------------------- | ------- | ----------- |
| nickname            | string  | null: false |
| email               | string  | null: false |
| password            | string  | null: false |
| last_name           | string  | null: false |
| first_name          | string  | null: false |
| last_name_kana      | string  | null: false |
| first_name_kana     | string  | null: false |
| date_of_birth_year  | integer | null: false |
| date_of_birth_month | integer | null: false |
| date_of_birth_day   | integer | null: false |

### Association

- has_many :items
- has_many :comments

## items テーブル
| Colum            | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| image            | string     | null: false                    |
| name             | string     | null: false                    |
| explanation      | string     | null: false                    |
| category         | string     | null: false                    |
| status           | string     | null: false                    |
| delivery_charge  | string     | null: false                    |
| area             | string     | null: false                    |
| date_of_shipping | string     | null: false                    |
| price            | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |

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
| item  | references | null: false, foreign_key: true |

### Association
- belongs_to :item
- has_one :shipping_address

## shipping_addresses
| Colum          | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| zip_code       | string     | null: false                    |
| state          | string     | null: false                    |
| municipalities | string     | null: false                    |
| street_number  | string     | null: false                    |
| building_name  | string     |                                |
| phone_number   | string     | null: false                    |
| purchased_item | references | null: false, foreign_key: true |

### Association
- be_longs to :purchased_item