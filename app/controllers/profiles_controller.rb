class ProfilesController < ApplicationController

  def new
    @user = current_user
    @profile = Profile.create(user: current_user)
    #could explore doing a nested attributes here.
  end

  def create
    @profile = Profile.find_by(user: current_user)
    @profile.update(profile_params)
    redirect_to(user_path(current_user))
  end

  def edit
    @user = current_user
    @profile = Profile.find_by(id: params[:id])
    flash[:edit_error] = "Unauthorized User"
    redirect_to(users_path) unless @user == @profile.user || @user.admin
  end

  def update
    @profile = Profile.find_by(id: params[:id])
    @profile.update(profile_params)
    redirect_to(user_path(@profile.user))
  end

  private

  def profile_params
    params.require(:profile).permit(:image, :header, :bio)
  end

end
