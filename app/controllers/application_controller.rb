class ApplicationController < ActionController::Base
  
  helper_method :current_member
  protect_from_forgery with: :exception
  
  def current_member
    @current_member ||= Member.find_by(id: session[:member_id])   #@current_userがnilだったら、右辺が実行される
  end    
end
