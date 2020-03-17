class ItemsController < ApplicationController
  def index
    @items = Item.all
    @item = Item.new
    @comments = Comment.all
    @comment = Comment.new
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

end
