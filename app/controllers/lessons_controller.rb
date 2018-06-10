class LessonsController < ApplicationController

  def index
    @form = LessonSearchForm.new(post_params)
    @lessons = @form.search(params[:page])
  end

  def new
  end

  def create
      Lesson.get_lesson
      flash[:success] = Lesson.get_lesson
      render :new
  end


  private

  def post_params

    unless  params[:lesson_search_form].nil?
      params.require(:lesson_search_form).permit(:instractor, :store_id, :kind_id, :start_at_from, :start_at_end, day_of_weeks: []) 
    end
    
  end

end
