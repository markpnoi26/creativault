module ApplicationHelper

  def user_currently_logged_in
    User.find_by_id(session[:user_id])
  end

end
