class Admin::CategoriesController < ApplicationController
  before_action :require_admin

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def edit
    @category = Category.find_by_id(params[:id])
  end

  def destroy
    @category = Category.find_by_id(params[:id])
    @category.delete
    redirect_to(admin_categories_path)
  end

  def create
    Category.create(category_params)
    redirect_to(admin_categories_path)
  end

  def update
    @category = Category.find_by_id(params[:id])
    @category.update(category_params)
    redirect_to(admin_categories_path)
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

end
