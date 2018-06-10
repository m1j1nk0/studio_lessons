module SessionsHelper
  
  def current_user
    @current_user ||= Member.find_by(id: session[:member_id])
  end

  def logged_in?
    !!current_user
  end

end
