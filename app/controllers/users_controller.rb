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
    # pry
    if !@user.profile
      @user.profile = 
      redirect_to(edit_user_profile_path(@user), @user.profile)
    else
      @profile = Profile.find_by_user_id(User.find_by_id(params[:id]))
    end
  end

  def index
    @users = User.all
  end

  def edit
    #Edit User information like password and Name
  end


  def update
    #Update User information like password and Name
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
