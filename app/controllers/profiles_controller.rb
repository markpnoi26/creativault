class ProfilesController < ApplicationController

  def new
    @user = current_user
    @profile = Profile.create(user: current_user)
  end

  def create
    @profile = Profile.find_by(user: current_user)
    @profile.update(profile_params)
    redirect_to(user_path(current_user))
  end

  def edit
  end

  private

  def profile_params
    params.require(:profile).permit(:image, :header, :bio)
    #eventually add image to the header and stuff.
  end

end


# profiles#create
# profiles#edit
# profiles#show
