# Bits-Of-knowledge
<img width="1440" alt="個人アプリトップ画" src="https://user-images.githubusercontent.com/63355560/86223242-3f673780-bbc2-11ea-8aa0-1b3a4c9a0eb4.png">


## 概要
このアプリはユーザーが自身のIT知識・情報に値段を付け、自由に売買出来るアプリです。
購入ユーザーのみが記事の内容を読むことが出来ます。

## 制作背景
  プログラミングを学び始めて苦労したのは、情報を集めることでした。そんな時に助けられたのが、Qiita（キータ）を始めとする様々な情報サイトでした。
  同じように情報不足で困る人がもっと少なくなれば良いな、という願いの下、自分自身もそのようなWEBアプリを作ってみたいと考えて
  制作を始めました。また、スクールでは個人でブログアプリ・記事投稿アプリを制作し、チーム体制でフリマアプリの制作を実施しました。
  今回の制作でこれまで学んだことを再度実装を通じて学び直す、自身が携われなかった機能を自身でも実装することで知識の定着化を図る意図も含まれています。
 
## 実装機能

* 購入機能
* 出品機能（マークダウン入力）
* 画像投稿機能（出品時）
* 購入履歴表示機能
* コメント機能
* タグ機能
* ログイン機能
* 検索機能

## 実装予定機能

* 編集機能
* 削除機能
* マイページ
* 画像のドラッグ＆ドロップ機能
* CSS,javascripitを使用した動的要素








## データベース設計

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|first_name|string|null: false|
|first_name_furigana|string|null: false|
|last_name|string|null: false|
|last_name_furigana|string|null: false|
|email|string|null: false, unique: true, default: ""|


### Association
- has_one :basket
- has_one :purchase_record



## productsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|description|text|null: false|
|explanation|text|null: false|
|price|integer|null: false|
|seller_id|integer|foreign_key: true, null: false|
|tag_id|integer|foreign_key: true, null: false|

### Association
- has_many :basket_products
- has_many :purchase_records through: :purchase_records_products




## basketテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|null: false, index: true, unique: true, foreign_key: true|

### Association
- has_many :basket_products
- has_many :products, through: :basket_products



## basket_productsテーブル
|Column|Type|Options|
|------|----|-------|
|basket|references|null: false, foreign_key: true, index: true|
|product|references|null: false, foreign_key: true, index: true|

### Association
- belongs_to :basket
- belongs_to :product



## purchase_recordsテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|null: false, index: true, foreign_key: true|

### Association
- belongs_to :user
- has_many :purchase_record_products
- has_many :products, through: :purchase_record_products

## purchase_record_productsテーブル
|Column|Type|Options|
|------|----|-------|
|purchase_record|references|null: false, foreign_key: true, index: true|
|product|references|null: false, foreign_key: true, index: true|

### Association
- belongs_to :purchase_record
- belongs_to :product
