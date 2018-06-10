class Member < ApplicationRecord
  
  before_save { self.email.downcase! }
  
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  
  has_secure_password
  
  has_many :favorites
  has_many :favorite_lessons, through: :favorites, source: :lesson
  
  def make_favorite(some_lesson)

    self.favorites.find_or_create_by(lesson_id: some_lesson.id)
  end

  def remove_favorite(some_lesson)
    favorite = self.favorites.find_by(lesson_id: some_lesson.id)
    favorite.destroy if favorite
  end  
  
  def is_favorite?(some_lesson)

    self.favorite_lessons.include?(some_lesson)
  end
    
    
    
end
