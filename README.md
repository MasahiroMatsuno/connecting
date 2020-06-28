# README

# アプリケーション名　
<img width="1439" alt="スクリーンショット 2020-06-11 14 52 53" src="https://user-images.githubusercontent.com/64773002/85541532-0c1d2980-b653-11ea-8575-27e7a6b5166c.png">

# DEMO
・投稿一覧
![demo投稿一覧](https://gyazo.com/1752acf1a2448a96dde2b304fb668cd2/raw)

・記事詳細
![demo投稿詳細](https://gyazo.com/4cc8e7e48cf37d83db5f86fd01946d0d/raw)

・投稿者詳細
![demo投稿者詳細](https://gyazo.com/fa224d40a399008a552a9fbda7f7935b/raw)

# アプリケーション概要
人と人と、店と店をつなぐチャットアプリです。
投稿・いいね・コメント・ダイレクトメッセージなど店と働きたい人がやりとりができるような機能をつけています。

# 本番環境(デプロイ先　＊ゲストログインができます)
http://18.182.155.166/

# 制作背景(意図)
人手不足の店を救いたいという思いから作りました。

私自身が好きだった個人飲食店が人手不足、継ぎ手不足で潰れてしまった体験から
どうにかしてもっと簡単に店を知ってもらえる、人に来てもらえる仕組みを作りたいと思って
作成をしました。

# 工夫したポイント
投稿された記事の詳細にはいいね・コメント機能をつけてお客さんと店がやりとりできるように
投稿者の詳細ページではフォローフォロワー機能とダイレクトメッセージ機能をつけて
働きたい人と店がやりとりできるようなイメージで作成しました。


# 機能一覧
●SASS記法を使ったマークアップ

●ユーザー登録、ログイン機能

●ゲストログイン機能

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


# 使用技術
## ●データベース
MySQL 5.6.47

## ●インフラ
AWS EC2

AWS S3

## デプロイ
Capistranoによる自動デプロイ

# 課題や今後実装したい機能
●ajaxを使用した非同期処理

●単体テスト

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
- has_many :likes, dependent: :destroy
- has_many :liked_users, through: :likes, source: :user
- mount_uploader :image, ImageUploader


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
- belongs_to :user
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

