class CommentsController < ApplicationController
  before_action :authenticate_user!, only: :create
  before_action :set_group
  def index
    @comment = Comment.new
    @comments = @group.comments.includes(:user)
  end

  def create
    @comment = @group.comments.new(comment_params)
    @comment.save
    redirect_to "/items"
  end

  private
  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id)
  end

  def set_group
    @group = Group.find(params[:group_id])
  end

end
