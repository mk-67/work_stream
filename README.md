# WorkStream

## アプリケーション概要

- 仕事におけるコミュニケーションを円滑にすることを実現
- チャットから案件進捗確認など幅広い使い方が可能
- マネージャーから現場の方々まで使用できるアプリケーション

## デプロイ後のURL
http://52.199.19.199/

## テスト用アカウント
### Basic認証
- ID：admin
- PASS：2222
### テスト用アカウント1
- Email：aaaaaa@aaaaaa
- PASS：aaa123
### テスト用アカウント2
- Email：bbbbbb@bbbbbb
- PASS：bbb123
### テスト用アカウント3
- Email：cccccc@cccccc
- PASS：ccc123
## 利用方法
01. 新規登録・ログイン
02. トップ画面へ遷移する
03. 「チャットを作成する」ボタンからチャットルームを作成
04. チャンネル名とメンバーを設定するとチャットルームが作成される
05. チャンネル名を選択するとメッセージ一覧が表示される
06. 下部のフォームよりメッセージ投稿が可能
07. メッセージ投稿の際に締切日を任意で設定できる
08. 07で設定した締切日は右上にある締切日リストに表示される
09. メッセージ投稿の際に画像を任意で投稿できる
10. メッセージにある保留のチェックマークをチェックして更新すると保留リストにメッセージが追加される
11. ハートマークを押して「いいね」することができる
12. 右下の「MEMO」でメモを投稿・閲覧できる

## 目指した課題解決

| 解決したい課題              | なぜその課題解決が必要なのか                               | 課題を解決する実装内容           |
| ------------------------- | ----------------------------------------------------- | ---------------------------  |
| チームのタスク状況を把握したい | 忙しいので極力アプリを統一したい                           | タスク管理機能とチャットアプリ併用 |
| リアルタイムで情報発信する    | 電話だと作業効率が下がる                                  | メッセージ投稿機能とコメント機能   |
| 社内で円滑に情報共有したい    | 社内でメールのやり取りは煩雑、レスポンスがなければ誰も発信しない | 「いいね」機能                  |

## 洗い出した要件

| 機能                | 目的                                                           | 詳細                                                                  | ストーリー |
| ------------------ | -------------------------------------------------------------- | -------------------------------------------------------------------- | ----------------------------------------------- |
| ユーザー管理機能      | ログイン・ログアウトできる、ユーザー編集・更新ができる、ユーザー管理できる | deviseを利用してユーザー管理機能実装                                       | ・アプリを開くとログイン画面に遷移・ログインしてなければ新規登録画面から登録する。・ログイン後にログインユーザー名をクリックすると編集画面に遷移して更新できる。 |
| チャット機能         | チャットルーム(スレッド)立ち上げ                                    | ログインした人がルームを立ち上げることができ、メンバーを選別できる。             | ・「チャットを作成する」ボタンを押すとチャットルーム新規作成画面に遷移・チャンネル名とメンバー1人を選別して登録する・「チャットを終了する」ボタンでチャットルームを削除することができる |
| メッセージ投稿機能    | メッセージ投稿 | 「いいね」機能                                     | ログインした人であればメッセージ投稿が可能                                  | ・メッセージを入力して送信ボタンを押すと投稿できる・任意で画像を投稿する事も可能 |
| チャットルーム編集機能 | 立ち上げたチャットルームの情報を更新する                             | ルームを立ち上げたメンバーが編集できる                                      | ・立ち上げたチャットルームの情報を間違えた際に「チャットを編集する」ボタンを押す事でチャット名とメンバーを変更できる・すでにメッセージが投稿されていれば自動的に削除される(未実装) |
| いいね機能           | いいねできる | 「いいね」機能                                      | ログインした人がいいねできる                                              | ・投稿されたメッセージに対していいねを押す事ができる・いいねを押すと非同期でいいねされる(未実装) |
| 締切日リスト機能      | 締切日リストを表示する | 「いいね」機能                              | ・投稿時に日付を選択することで締切日を表示・締切日が入った投稿はリストに表示される | ・投稿時に日付を選択することで、その投稿に締切日が表示される・締切日が入った投稿は締切日リストの表示される |
| 保留リスト機能        | 保留リストを表示する | 「いいね」機能                               | ・ログインした人が保留にチェックボックスを入れて更新する・チェックした投稿内容が保留リストに表示される | ・1つ1つの投稿に保留のチェックボックスが配置されている・保留にチェックを入れて更新すると、チェックした投稿内容が保留リストに表示される |
| メモ機能             | メモ機能でメモを投稿でき、表示・閲覧する                             | ログインした人がメモ機能を使用できる                                        | ・ログインしたユーザーがメモを投稿できる・メモはチャンネルごとに紐づいており、表示が切り替わる(未実装) |
| 投稿削除機能(未実装)   | 投稿した人がメッセージを削除できる(未実装)                           | ログインかつ投稿した人がメッセージを削除できる(未実装)                        | ・ログインかつ投稿した人が間違ったメッセージを削除できる(未実装) |
| 完了機能(未実装)      | 完了機能で完了メッセージを分かるように色を変える(未実装)               | ・ログインした人が完了にチェックボックスを入れて更新する(未実装)・チェックした投稿内容の色が変わる(未実装)・保留リストからその投稿内容が削除される(未実装) | ・1つ1つの投稿に完了のチェックボックスが配置されている(未実装)・保留にチェックを入れて更新すると、チェックした投稿内容の色が変わる(未実装)・保留リストからその投稿内容が削除される(未実装) |
| 完了リスト機能(未実装) | 完了リストに遷移・閲覧できる(未実装)                                | メッセージが完了されると完了リストに表示される(未実装)                        | メッセージが完了されると完了リストに表示される(未実装) |

## データベース設計

## ER図

[![Image from Gyazo](https://i.gyazo.com/7cf6d5935b764a2d780070534bc93caa.png)](https://gyazo.com/7cf6d5935b764a2d780070534bc93caa)

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |

### Association

- has_many :channel_users
- has_many :channels, through: :channel_users
- has_many :posts, dependent: :destroy
- has_many :likes, dependent: :destroy
- has_many :like_posts, through: :likes, source: :post

## channels テーブル

| Column  | Type   | Options     |
| ------- | ------ | ----------- |
| channel | string | null: false |

### Association

- has_many :channel_users, dependent: :destroy
- has_many :users, through: :channel_users
- has_many :posts, dependent: :destroy
- has_many :likes, dependent: :destroy
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
| user       | references | null: false, foreign_key: true |
| channel    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :channel
- has_many :likes, dependent: :destroy
- has_many :users, through: :likes
- has_one :hold

## holds テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| chack_hold | boolean    |                                |
| post       | references | null: false, foreign_key: true |

### Association

- belongs_to :post

## memos テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| memo    | string     |                                |
| channel | references | null: false, foreign_key: true |

### Association

- belongs_to :channel

## likes テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| channel   | references | null: false, foreign_key: true |
| post      | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :channel
- belongs_to :post