class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.integer :post_code
      t.integer :prefecture_id
      t.string  :city
      t.string  :address
      t.string  :building
      t.integer :phone_number
      t.integer :item_id

      t.timestamps
    end
  end
end
