class ApplicationController < ActionController::Base

  def current_user
    User.find_by_id(session[:user_id])
  end

  def require_login
    unless session[:user_id]
      flash[:error] = "You must be signed in."
      redirect_to(new_session_path)
    end
  end

end
