class Post < ApplicationRecord
  
  belongs_to :user
  has_many :likes, dependent: :destroy

  attachment :image

  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end

end
