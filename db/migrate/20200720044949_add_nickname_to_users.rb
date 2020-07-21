class AddNicknameToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :nickname, :string
    add_column :users, :Birthday_year, :integer
    add_column :users, :Birthday_month, :integer
    add_column :users, :Birthday_day, :integer
    add_column :users, :first_name_kanji, :string
    add_column :users, :last_name_kanji, :string
    add_column :users, :first_name_katakana, :string
    add_column :users, :last_name_katakana, :string
  end
end
