class CreationsController < ApplicationController
  before_action :require_login

  def index
    @user = current_user
    @specific_user = User.find_by_id(params[:user_id])
    @category = Category.all
    if @specific_user
      if !params[:category].blank?
        @creations = @specific_user.creations.where(category_id: params[:category])
      else
        @creations = @specific_user.creations
      end
    elsif !params[:category].blank?
      @creations = Creation.where(category_id: params[:category])
    else
      @creations = Creation.all
    end
  end

  def show
    @user = current_user
    @creation = creation_by_id
  end

  def new
    @user = current_user
    if !@user.profile
      flash[:errors] = ['You must have a profile to Create Something.']
      redirect_to(new_user_profile_path(@user))
    end
    @creation = Creation.new(user: current_user)
  end

  def create
    # edit this part for validations!
    @creation = Creation.new(creation_params)
    @creation.user = current_user
    if @creation.valid?
      @creation.save
      redirect_to(creation_path(@creation))
    else
      flash[:errors] = @creation.errors.full_messages
      redirect_to(new_user_creation_path(current_user))
    end
  end

  def edit
    @user = current_user
    @creation = creation_by_id
    redirect_to(creation_path(@creation)) unless @user == @creation.user || @user.admin
  end

  def update
    @creation = creation_by_id
    @creation.update(creation_params)
    redirect_to(creation_path(@creation))
  end

  def update_heart_count
    @user = current_user
    @creation = creation_by_id
    @user.loved << @creation unless @user.loved.include?(@creation)
    redirect_to(creation_path(@creation))
  end

  def update_flag_count
    @user = current_user
    @creation = creation_by_id
    @user.flagged << @creation unless @user.flagged.include?(@creation)
    redirect_to(creation_path(@creation))
  end

  def destroy
  end

  private

  def creation_params
    params.require(:creation).permit(:image, :title, :description, :category_id)
  end

  def creation_by_id
    Creation.find_by_id(params[:id])
  end

end
