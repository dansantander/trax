class GroupsController < ApplicationController
  before_action :require_login, only: %i[index new create]

  def index
    @groups = Group.all.alphabetical
  end

  def new
    @group = Group.new
  end

  def create
    @group = current_user.groups.build(group_params)

    if @group.save
      redirect_to groups_path, notice: 'Group was successfully created.'
    else
      flash.now[:alert] = "Error: #{@group.errors.full_messages.join(', ')}"
      render :new
    end
  end

  def show
    @group = Group.includes(tasks: [:creator]).find_by(id: params[:id])
  end

  private

  def group_params
    params.require(:group).permit(:name, :avatar)
  end
end
