class CommentsController < ApplicationController
  before_action :authenticate_user!, only: :create
  def index
  end

  def create
    @comment = Comment.create(comment_params)
    @comment.save
    redirect_to "/items"
  end

  private
  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id)
  end
end
