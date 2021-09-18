class Question < ApplicationRecord

  belongs_to :user
  has_many :answers, dependent: :destroy

  attachment :image

  validates :title, presence: true
  validates :body, presence: true

end
