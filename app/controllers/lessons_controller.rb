class LessonsController < ApplicationController
  def index
  end

  def new
  end

  def create
    
      Lesson.get_lesson

      flash[:success] = Lesson.get_lesson
      render :new
    
  end
end
