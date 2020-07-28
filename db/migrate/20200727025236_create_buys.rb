class CreateBuys < ActiveRecord::Migration[6.0]
  def change
    create_table :buys do |t|
      t.integer :user_id
      t.integer :item_id
      t.integer :post_code
      t.integer :prefectures_id
      t.string  :city
      t.string  :address
      t.string  :building
      t.integer :phone_number


      t.timestamps
    end
  end
end
