class Question < ApplicationRecord
  
  attachment :image
  
  belongs_to :user
  
end
