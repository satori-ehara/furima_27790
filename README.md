## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false|
|password|string|null: false|
|Birthday|integer|null: false|
|name_kanji|string|null: false|
|name_katakana|string|null: false|
### Association
- has_many :items
- has_many :comments

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
|condition_id|integer|null: false|
|type_id|integer|null: false|
|burden_id|integer|null: false|
|prefectures_id|integer|null: false|
|days_id|integer|null: false|
### Association
- belongs_to :user
- has_many :comments
