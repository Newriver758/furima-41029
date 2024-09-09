# テーブル設計


## users テーブル

| Column             | Type     | Options                   |
| -----------------  | -------- | ------------------------- |
| nickname           | string   | null: false               |
| email              | string   | null: false, unique: true |
| encrypted_password | string   | null: false               |
| first_name         | string   | null: false               |
| last_name          | string   | null: false               |
| first_name_kana    | string   | null: false               |
| last_name_kana     | string   | null: false               |
| birthday           | date     | null: false               |

### Association

- has_many :items
- has_many :purchases


## Items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| description        | text       | null: false                    |
| price              | integer    | null: false                    |
| category           | references | null: false, foreign_key: true |
| condition_id       | integer    | null: false                    |
| shipping_charge_id | integer    | null: false                    |
| prefecture_id      | integer    | null: false                    |
| shipping_day_id    | integer    | null: false                    | 
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :category
- belongs_to :prefecture
- has_one :purchase


## Purchases テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping_address


## ShippingAddresses テーブル

  | Column           | Type       | Options                        |
  | ---------------- | ---------- | ------------------------------ |
  | postal_code      | string     | null: false                    |
  | prefecture_id    | integer    | null: false                    |
  | city             | string     | null: false                    |
  | address          | string     | null: false                    | 
  | building         | string     |                                |
  | phone_number     | string     | null: false                    |
  | purchase         | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase
- belongs_to :prefecture


This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
