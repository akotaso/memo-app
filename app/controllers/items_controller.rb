class ItemsController < ApplicationController
  before_action :set_group

  def index
    @items = @group.items.includes(:user)
    @item = Item.new
    @comments = @group.comments.includes(:user)
    @comment = Comment.new
    redirect_to "/users/sign_up" unless user_signed_in?
  end

  def new
    @item = Item.new
    @items = Item.all
    @like = Like.find_by()
  end

  def create
      @item = @group.items.new(item_params)
      @item.save
      redirect_to  group_comments_path(@group)
  end

  def destroy
    
  end

  def show
    
  end

  private
  def item_params
    params.require(:item).permit(:name).merge(user_id: current_user.id)
  end

  def set_group
    @group = Group.find(params[:group_id])
  end

end
