class Lesson < ApplicationRecord
  belongs_to :store
  belongs_to :lesson_kind
end
