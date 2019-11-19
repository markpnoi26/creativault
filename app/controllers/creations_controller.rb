class CreationsController < ApplicationController
  before_action :require_login

  def index
    @user = User.find_by_id(params[:user_id])
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
    @user = current_user
    @comment = Comment.new
    @comments = Comment.all
    @creation = Creation.find_by_id(params[:id])
  end

  def edit
    @user = current_user
    @creation = Creation.find_by_id(params[:id])
    redirect_to(user_creation_path(@creation.user, @creation))unless @user == @creation.user
  end

  def update
    @creation = Creation.find_by_id(params[:id])
    @creation.update(creation_params)
    redirect_to(user_creation_path(current_user, @creation))
  end

  def destroy
  end

  private

  def creation_params
    params.require(:creation).permit(:image, :title, :description, :category_id)
  end

end
