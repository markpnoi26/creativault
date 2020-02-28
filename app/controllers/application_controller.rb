class ApplicationController < ActionController::Base

  def current_user
    User.find_by_id(session[:user_id])
  end

  def require_login
    unless session[:user_id]
      flash[:error] = "You must be signed in."
      redirect_to new_session_path
    end
  end

  def current_an_admin?
    current_user.admin
  end

  def require_admin
    @user = current_user
    unless @user.admin
      flash[:error] = "You do not have admin privilages."
      redirect_to user_path(@user)
    end
  end

end
