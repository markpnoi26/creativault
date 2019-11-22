module ApplicationHelper

  def user_currently_logged_in
    User.find_by_id(session[:user_id])
  end

  def user_currently_admin?
    user_currently_logged_in.admin
  end

end
