class Answer < ApplicationRecord

  belongs_to :user
  belongs_to :question

  attachment :image

  validates :body, presence: true

end
