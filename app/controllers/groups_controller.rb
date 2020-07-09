class GroupsController < ApplicationController
  def index
    @groups = Group.all.alphabetical
  end

  def new
    @group = Group.new
  end

  def create
    @group = current_user.groups.new(group_params)

    puts "***** #{@group.avatar} *****"
    if @group.save
      redirect_to groups_path
    else
      render :new
    end
  end

  def show
    #@total = current_user.tasks.select('task.id, group.id')
    #.joins(:groups).sum(:amount)

    #@join = Task.joins(:groupings).joins(:groups)
    #@join = Task.joins(:groupings).where('groupings.group_id = ?', 1)
    @group = Group.includes(tasks: [:creator]).find_by(id: params[:id])
    #@group = current_user.groups.groupings.includes(:tasks)
    @tasks = current_user.tasks.includes(:groups)
    Task.select('tasks.*').joins(:groups)
  end

  def destroy; end

  private

  def group_params
    params.require(:group).permit(:name, :avatar)
  end
end
