module ApplicationHelper
  def logged_in_user
    User.find(session[:user]['id']) if session[:user]
  end
end
