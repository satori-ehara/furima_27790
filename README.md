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
|user_id|string|null: false|
|comment_item_id|string|null: false|
### Association
- belongs_to :user
- has_many :comments_items
- has_many :items, through: :comments_items