class SessionsController < ApplicationController

  def new
    redirect_to(user_path(current_user)) if current_user
    @user = User.new
  end

  def create
    @user = User.find_by_email(params[:user][:email])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to(user_path(current_user))
    else
      flash[:error] = "User Cannot be Authenticated"
      redirect_to(new_session_path)
    end
  end

  def destroy
    reset_session
    redirect_to(root_path)
  end

end
