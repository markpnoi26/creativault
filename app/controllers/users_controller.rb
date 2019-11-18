class UsersController < ApplicationController

  def show
    @user = User.find_by_id(params[:id])
  end

  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      session[:user_id] = @user.id
      redirect_to(new_user_profile_path(@user))
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to(new_user_path)
    end
  end

  def update
  end

  private

  def user_params
    params.require(:user).permit(:name, :username, :email, :password, :password_confirmation)
  end
end
