class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one :address
  has_one :buy
  belongs_to :user
  belongs_to_active_hash :type
  belongs_to_active_hash :burden
  belongs_to_active_hash :condition
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :day
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :condition_id
    validates :type_id
    validates :burden_id
    validates :prefecture_id
    validates :day_id
    validates :price, numericality: { greater_than: 299, less_than: 10_000_000 }
  end
end
