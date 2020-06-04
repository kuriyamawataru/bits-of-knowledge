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