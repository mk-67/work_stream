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

## channel_users テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| channel   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :channel

## posts テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| content  | string     |                                |
| deadline | date       |                                |
| user     | references | null: false, foreign_key: true |
| channel  | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :channel

## memos テーブル
| Column | Type   | Options |
| ------ | ------ | ------- |
| memo   | string |         |