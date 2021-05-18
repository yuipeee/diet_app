# テーブル設計

## users テーブル

| Column             | Type     | Options                   |
| ------------------ | -------- | ------------------------- |
| name               | string   | null: false               |
| email              | string   | null: false  unique: true |
| encrypted_password | string   | null: false               |

### Association

- has_many :posts
- has_many :comments
- has_many :likes

## posts テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| name             | string     | null: false                    |
| weight           | integer    | null: false                    |
| text             | string     | null: false                    |
| user_id          | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many   :comments
- has_many :likes

## comments テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| user       | references | null: false, foreign_key: true |
| post       | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :post

## likes テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| user       | references | null: false, foreign_key: true |
| post       | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :post