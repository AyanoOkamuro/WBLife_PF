class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attachment :profile_image

  enum gender: { "男性": 0, "女性": 1, "その他": 2 }
  enum age: { "---": 0, "10代": 1, "20代": 2, "30代": 3, "40代": 4, "50代": 5, "60代以上": 6 }
end
