class GroupsController < ApplicationController
  before_action :set_group, only: [:edit, :update]

  def index
    redirect_to "/users/sign_up" unless user_signed_in?
  end

  def new
    @group = Group.new
    redirect_to "/users/sign_up" unless user_signed_in?
    @group.users << current_user
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to "/groups"
    else
      render :new
    end
  end

  def edit

  end

  def update
    
  end

  def destroy
    group =Group.find(params[:id])
    group.destroy
    redirect_to "/groups"
  end

  private
  def group_params
    params.require(:group).permit(:name, user_ids:[])
  end

  def set_group
    @group = Group.find(params[:id])
  end
end
