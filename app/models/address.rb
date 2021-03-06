class Address < ApplicationRecord
  belongs_to :item, optional: true

  with_options presence: true do
    validates :post_code, format: { with: /[-]/ }
    validates :prefecture_id
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A\d{11}\z/ }
    validates :item_id
  end
end
