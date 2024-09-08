# テーブル設計

## users テーブル

| Column             | Type     | Options                   |
| -----------------  | -------- | ------------------------- |
| id                 | bigint   | null: false, primary key  |
| nickname           | string   | null: false               |
| email              | string   | null: false, unique: true |
| encrypted_password | string   | null: false               |
| first_name         | string   | null: false               |
| last_name          | string   | null: false               |
| first_name_kana    | string   | null: false               |
| last_name_kana     | string   | null: false               |
| birthday           | date     | null: false               |
| created_at         | datetime | null: false               |
| updated_at         | datetime | null: false               |

### Association

- has_many :items
- has_many :purchases

## Items テーブル

| Column             | Type     | Options                        |
| ------------------ | -------- | ------------------------------ |
| id                 | bigint   | null: false, primary key       |
| name               | string   | null: false                    |
| description        | text     | null: false                    |
| price              | integer  | null: false                    |
| category_id        | integer  | null: false, foreign_key: true |
| condition_id       | integer  | null: false                    |
| shipping_charge_id | integer  | null: false                    |
| shipping_area_id   | integer  | null: false                    |
| shipping_day_id    | integer  | null: false                    | 
| user_id            | bigint   | null: false, foreign_key: true |
| created_at         | datetime | null: false                    |
| updated_at         | datetime | null: false                    |

### Association

- belongs_to :user
- belongs_to :category
- has_one :purchase

## Categories テーブル

| Column             | Type     | Options                  |
| ------------------ | -------- | ------------------------ |
| id                 | bigint   | null: false, primary key |
| name               | string   | null: false              |
| created_at         | datetime | null: false              |
| updated_at         | datetime | null: false              |

### Association

- has_many :items

## Purchases テーブル

| Column             | Type     | Options                        |
| ------------------ | -------- | ------------------------------ |
| id                 | bigint   | null: false, primary key       |
| user_id            | bigint   | null: false, foreign_key: true |
| item_id            | bigint   | null: false, foreign_key: true |
| created_at         | datetime | null: false                    |
| updated_at         | datetime | null: false                    |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping_address

## ShippingAddresses テーブル

  | Column           | Type     | Options                        |
  | ---------------- | -------- | ------------------------------ |
  | id               | bigint   | null: false, primary key       |
  | postal_code      | string   | null: false                    |
  | prefecture_id    | integer  | null: false                    |
  | city             | string   | null: false                    |
  | address          | string   | null: false                    | 
  | building         | string   |                                |
  | phone_number     | string   | null: false                    |
  | purchase_id      | bigint   | null: false, foreign_key: true |
  | created_at       | datetime | null: false                    |
  | updated_at       | datetime | null: false                    |

### Association

- belongs_to :purchase


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
