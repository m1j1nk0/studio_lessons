class LessonKind < ApplicationRecord
  
  has_many :lessons
  belongs_to :kind
end
