class UsersController < ApplicationController
  before_action :require_login, only: [:show, :index, :edit, :update]

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

  #for if current_user is logged in

  def show
    @user = current_user
    @profile = @user.profile
  end

  def index
    @users = User.all
  end

  def edit
  end


  def update
  end

  private

  def user_params
    params.require(:user).permit(:name, :username, :email, :password, :password_confirmation)
  end
end
