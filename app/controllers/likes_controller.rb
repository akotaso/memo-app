class LikesController < ApplicationController
  before_action :set_group
  def create
    @like = @group.likes.create(item_id: params[:item_id])
    redirect_back(fallback_location: root_path)
  end
  
  def destroy
    @like = Like.find_by(item_id: params[:item_id], group_id: @group.id)
    @like.destroy
    redirect_back(fallback_location: root_path)
  end

  private
  def set_group
    @group = Group.find(params[:group_id])
  end
end
