## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false|
|password|string|null: false|
|Birthday|integer|null: false|
|first_name_kanji|string|null: false|
|first_name_katakana|string|null: false|
|last_name_kanji|string|null: false|
|last_name_katakana|string|null: false|
### Association
- has_many :items
- has_many :comments
- has_many :buys


## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|user_id|integer|null: false, foreign_key: true|
|item_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :item

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|description|text|null: false|
|image|string|null: false|
|price|integer|null: false|
|user_id|integer|null: false, foreign_key: true|
|condition_id|integer|null: false, foreign_key: true|
|type_id|integer|null: false, foreign_key: true|
|burden_id|integer|null: false, foreign_key: true|
|prefectures_id|integer|null: false, foreign_key: true|
|days_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- has_many :comments
- belongs_to :buy

## buyテーブル
|Column|Type|Options|
|------|----|-------|
|card_number|integer|null: false|
|card_timelimit_month|integer|null: false|
|card_timelimit_year|integer|null: false|
|card_cvv|integer|null: false|
|user_id|integer|null: false, foreign_key: true|
|item_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :item
- belongs_to :address

## addressテーブル
|Column|Type|Options|
|------|----|-------|
|post_code|integer|null: false|
|prefectures_id|integer|null: false, foreign_key: true|
|city|string|null: false|
|address|string|null: false|
|building|string||
|phone_number|integer|null: false|
|buy_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :buy
