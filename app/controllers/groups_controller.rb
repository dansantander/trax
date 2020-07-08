class GroupsController < ApplicationController
  def index
    @groups = Group.all.alphabetical
  end

  def new
    @group = Group.new
  end

  def create
    @group = current_user.groups.new(group_params)
    if @group.save
      redirect_to groups_path
    else
      render :new
    end
  end

  def show
    @group = Group.includes(:tasks).find_by(id: params[:id])
    # @group = Group.find_by(id: params[:id])
  end

  def destroy; end

  private

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
