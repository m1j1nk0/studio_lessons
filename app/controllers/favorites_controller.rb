class FavoritesController < ApplicationController
  
  def create
    like = Lesson.find(params[:lesson_id])
    current_member.make_favorite(like)
    flash[:success] = "お気に入りにしました☆"
    redirect_back(fallback_location: root_path)
  end

  def destroy
    like = Lesson.find(params[:lesson_id])
    current_member.remove_favorite(like)
    flash[:success] = "お気に入りから外しました"
    redirect_back(fallback_location: root_path)
    
  end
end
