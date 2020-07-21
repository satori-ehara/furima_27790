class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    validates :nickname,:email, presence: true
    validates :password, presence: true,format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,100}+\z/i , message: "need 1~9&a~z"}
    validates :first_name_katakana,:last_name_katakana, presence: true,format: { with: /[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+/ }
    validates :Birthday_year,:Birthday_month,:Birthday_day, presence: true,format: { without: /[0]/ }
end
