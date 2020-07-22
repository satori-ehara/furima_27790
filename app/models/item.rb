class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :type
  belongs_to_active_hash :burden
  belongs_to_active_hash :condition
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :day
  has_one_attached :image

  validates :image,:name,:description,:condition_id,:type_id,:burden_id,:prefectures_id,:days_id, presence: true
  validates :price, presence: true,numericality: { greater_than: 299, less_than: 10000000}
end
