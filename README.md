# Bits-Of-knowledge
<img width="1440" alt="b6bbb234ae1f4a7e25a3f0cf3ed63de7" src="https://user-images.githubusercontent.com/63355560/83845633-3e1e2880-a744-11ea-8791-51f18aefce89.png">


## 概要
このアプリはユーザーが自身の知識・情報に値段を付け、自由に売買出来るアプリです。
購入ユーザーのみが記事の内容を読むことが出来ます。

## 制作背景
  プログラミングを学び始めて苦労したのは、情報を集めることでした。そんな時に助けられたのが、Qiita（キータ）を始めとする様々な情報サイトでした。
  プログラミングだけに留まらず、同じように情報不足で困る人がもっと少なくなれば良いな、という願いの下、自分自身もそのようなWEBアプリを作ってみたいと考えて
  制作を始めました。また、スクールでは個人でブログアプリ・記事投稿アプリを制作し、チーム体制でフリマアプリの制作を実施しました。
  今回の制作でこれまで学んだことを再度実装を通じて学び直す、自身が携われなかった機能を自身でも実装することで知識の定着化を図る意図も含まれています。
 
## 実装予定機能（一部実装済）

* 購入機能
* 出品機能
* 購入履歴表示機能
* コメント機能
* カテゴリ機能
* ログイン機能
* javascript・CSSによる動的ページ（各ページ）





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
- has_many :products
- has_many :cards
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
- has_many :tags through: :products_tags
- belongs_to :user



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


## tagsテーブル
|Column|Type|Options|
|------|----|-------|
|name|String|null: false|

### Association
- has_many :product_tags
- has_many :products, through: :product_tags


## product_tagsテーブル
|Column|Type|Options|
|------|----|-------|
|product|References|null: false,foreign_key: true, index: true|
|tag|Refernces|null: false,foreign_key: true, index: true|

### Association
- belongs_to :tag
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
