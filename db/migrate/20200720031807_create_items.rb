class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name
      t.text :description
      t.string :image
      t.integer :price
      t.integer :user_id
      t.integer :condition_id
      t.integer :type_id
      t.integer :burden_id
      t.integer :prefecture_id
      t.integer :day_id
      t.timestamps
    end
  end
end
