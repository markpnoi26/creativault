class CommentsController < ApplicationController
  before_action :require_login

  def create
    raise params.inspect
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def creation_params
    params.require(:comment).permit(:content)
  end

end
