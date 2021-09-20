class Answer < ApplicationRecord

  belongs_to :user
  belongs_to :question
  has_many :nices, dependent: :destroy

  attachment :image

  validates :body, presence: true

  def niced_by?(user)
    nices.where(user_id: user.id).exists?
  end

end
