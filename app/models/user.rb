class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    validates :first_name_katakana,:last_name_katakana, presence: true,format: { with: /[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+/ }
    validates :Birthday_year,:Birthday_month,:Birthday_day, presence: true,format: { without: /[0]/ }
end
