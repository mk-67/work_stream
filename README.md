# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |

### Association

- has_many :channel_users
- has_many :channels, through: :channel_users
- has_many :posts

## channels テーブル

| Column  | Type   | Options     |
| ------- | ------ | ----------- |
| channel | string | null: false |

### Association

- has_many :channel_users
- has_many :users, through: :channel_users
- has_many :posts
- has_one  :memo

## channel_users テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| channel   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :channel

## posts テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| content    | string     | null: false                    |
| deadline   | date       |                                |
| check_done | integer    |                                |
| check_hold | integer    |                                |
| user       | references | null: false, foreign_key: true |
| channel    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :channel
- has_one :suspend

## suspends テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| post   | references | null: false, foreign_key: true |

### Association

- belongs_to :post

## memos テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| memo    | string     |                                |
| channel | references | null: false, foreign_key: true |

### Association

- belongs_to :channel