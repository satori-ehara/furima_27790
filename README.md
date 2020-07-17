## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false|
|password|string|null: false|
|Birthday|string|null: false|
|name_kanji|string|null: false|
|name_katakana|string|null: false|
### Association
- has_many :items
- has_many :comments

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text||
|user_id|integer|null: false|
|comment_item_id|integer|null: false|
### Association
- belongs_to :user
- has_many :comments_items
- has_many :items, through: :comments_items

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|description|text|null: false|
|image|string|null: false|
|price|integer|null: false|
|user_id|integer|null: false|
|comments_items_id|integer|null: false|
|condition|string|null: false|
|type|string|null: false|
|burden|boolean|null: false|
|prefectures|string|null: false|
|days|string|null: false|
### Association
- belongs_to :user
- has_many :comments_items
- has_many :comments, through: :comments_items