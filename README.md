# README

# アプリケーション名
Connecting

# アプリケーション概要


# 機能一覧
●SASS記法を使ったマークアップ

●ユーザー登録、ログイン機能

●記事投稿機能

●記事詳細機能

●記事編集・削除機能

●画像ファイルアップロード機能

●ユーザー詳細機能

●ページネーション

●コメント機能

●投稿検索機能

●いいね機能

●DM機能

●フォローフォロワー機能

●bootstrapを用いた実装

●ajaxを使用した非同期処理


# 使用技術
## ●データベース
MySQL 5.6.47

## ●インフラ
AWS EC2


## デプロイ
Capistranoによる自動デプロイ


# connecting DB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|email|string|null: false|
|password|string|null: false|
|nickname|string|null: false|
### Association
- has_many :tweets
- has_many :comments

## tweetsテーブル
|Column|Type|Options|
|------|----|-------|
|image|text||
|text|text||
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- has_many :comments

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|user_id|integer|null: false, foreign_key: true|
|tweet_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :tweet
- belongs_to :user
