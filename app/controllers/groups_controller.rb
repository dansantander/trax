class GroupsController < ApplicationController
  def index
    @groups = Group.all.alphabetical
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
  end

  def show
  end

  def destroy
  end

  private
  
  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
