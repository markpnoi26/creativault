class ProfilesController < ApplicationController

  def new
    @user = User.find_by_id(params[:user_id])
    @profile = Profile.create(user: @user)
    pry
  end

  def create
    puts params
    @user = User.find_by_id(params[:user_id])
    pry
    @profile = Profile.find_by(user: @user)
    @profile.update(profile_params)
    redirect_to(user_profile_path(@user, @profile))
  end

  def edit
  end

  def show
  end

  private

  def profile_params
    params.require(:profile).permit(:header, :bio)
    #eventually add image to the header and stuff.
  end

end


# profiles#create
# profiles#edit
# profiles#show
