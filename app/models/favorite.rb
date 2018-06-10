class Favorite < ApplicationRecord
  belongs_to :lesson
  belongs_to :member
  
  validates :lesson_id, presence: true
  validates :member_id, presence: true
end
