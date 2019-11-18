class CreationsController < ApplicationController
  before_action :require_login

  def index
  end

  def new
    @user = current_user
    @creation = Creation.new(user: current_user)
  end

  def create
    @creation = Creation.create(creation_params)
    @creation.user = current_user
    @creation.save
    redirect_to(user_creation_path(current_user, @creation))
  end

  def show
    @creation = Creation.find_by_id(params[:id])
    @user = current_user
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def creation_params
    params.require(:creation).permit(:image, :title, :description, :category_id)
  end

end
