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
|realname|text|null: false, default: ""|
|email|string|null: false, default: ""|
|encrypted_password|string|null: false, default: ""|
### Association
- has_many :tweets
- has_many :comments
- has_many :follower, class_name: "Relationship", foreign_key: "follower_id",    dependent: :destroy 
- has_many :followed, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy 
- has_many :following_user, through: :follower, source: :followed 
- has_many :follower_user, through: :followed, source: :follower 
- has_many :messages, dependent: :destroy
- has_many :entries, dependent: :destroy
- has_many :tweets, dependent: :destroy
- has_many :likes, dependent: :destroy
- has_many :liked_tweets, through: :likes, source: :tweet
  

## tweetsテーブル
|Column|Type|Options|
|------|----|-------|
|image|text||
|text|string||
|name|string||
### Association
- belongs_to :user
- has_many :comments 
-  has_many :likes, dependent: :destroy
-  has_many :liked_users, through: :likes, source: :user
-  mount_uploader :image, ImageUploader


## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer||
|tweet_id|integer||
|text|text||
### Association
- belongs_to :tweet
- belongs_to :user

## relationshipsテーブル
|Column|Type|Options|
|------|----|-------|
|follower_id|integer||
|followed_id|integer||
### Association
- belongs_to :follower, class_name: "User"
- belongs_to :followed, class_name: "User"

## likesテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|foreign_key: true|
|tweet|references|foreign_key: true|
### Association
- belongs_to :tweet
- belongs_to :user

## entriesテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|foreign_key: true|
|room|references|foreign_key: true|
### Association
-  belongs_to :user
- belongs_to :room

## messagessテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|foreign_key: true|
|room|references|foreign_key: true|
|content|text||
### Association
- belongs_to :user
- belongs_to :room

## roomsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string||
### Association
- has_many :messages, dependent: :destroy
- has_many :entries, dependent: :destroy
