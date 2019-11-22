class ProfilesController < ApplicationController

  def new
    @user = current_user
    @profile = Profile.new(user: current_user)
    # could explore doing a nested attributes here.
    # may need to change profile to new, to prevent it from redirecting without a photo
  end

  def create
    #add new validations
    @profile = Profile.new(profile_params)
    if @profile.valid?
      @profile.update(user: current_user)
      @profile.save(profile_params)
      redirect_to(user_path(current_user))
    else
      flash[:errors] = @profile.errors.full_messages
      redirect_to(new_user_profile_path(current_user))
    end
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
