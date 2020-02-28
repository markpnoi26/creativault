class SessionsController < ApplicationController

  def new
    redirect_to(user_path(current_user)) if current_user
    @user = User.new
  end

  def create
    if params[:user]
      @user = User.find_by_email(params[:user][:email])
      if @user && @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        if @user.profile
          redirect_to user_path(current_user)
        else
          redirect_to new_user_profile_path(@user)
        end
      else
        flash[:error] = "User Cannot be Authenticated"
        redirect_to new_session_path
      end
    elsif google_hash
      @found_user = User.find_by_email(google_hash[:email])
      if @found_user
        session[:user_id] = @found_user.id
        redirect_to user_path(current_user)
      else
        @new_user = User.create(name: google_hash[:name], email: google_hash[:email], password: SecureRandom.hex)
        session[:user_id] = @new_user.id
        redirect_to new_user_profile_path(@new_user)
      end
    else
      flash[:error] = "User cannot be Authenticated"
      redirect_to new_session_path
    end
  end

  def destroy
    reset_session
    redirect_to root_path 
  end

  private

  def google_hash
    request.env['omniauth.auth'][:info]
  end

end
