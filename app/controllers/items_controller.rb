class ItemsController < ApplicationController
  before_action :set_group

  def index
    @items = Item.all
    @item = Item.new
    # @comments = @group.comments.includes(:user)
    @comments = Comment.all
    @comment = Comment.new
    redirect_to "/users/sign_up" unless user_signed_in?
  end

  def new
    @item = Item.new
    @items = Item.all
    @like = Like.find_by()
  end

  def create
      @item = Item.create(item_params)
      @item.save
      redirect_to "/items"
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
    # @group = Group.find(params[:id])
  end

end
