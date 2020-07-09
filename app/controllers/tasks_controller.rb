class TasksController < ApplicationController
  include UsersHelper

  before_action :require_login, only: %i[index new create]

  def index
    internal = params.dig(:task, :internal)
    if internal
      if params[:task][:internal] == 'true'
        @tasks = grouped_tasks(current_user)
        total_grouped
        cookies[:internal] = 'true'
      else
        @tasks = external_tasks(current_user)
        total_external
        cookies[:internal] = 'false'
      end
    elsif cookies[:internal] == 'true'
      @tasks = grouped_tasks(current_user)
      total_grouped
    else
      @tasks = external_tasks(current_user)
      total_external
    end
  end

  def new
    @task = Task.new
  end

  def create
    @task = current_user.tasks.build(task_params)
    @task.group = params[:group]

    if @task.save
      redirect_to tasks_path, notice: 'Task was successfully created.'
    else
      flash.now[:alert] = "Error: #{@task.errors.full_messages.join(', ')}"
      render :new
    end
  end

  def edit
    groups_selection
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)

    redirect_to tasks_path, notice: 'Task was successfully updated.'
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :amount, :group)
  end

  def groups_selection
    @groups = Group.all.map { |g| [g.name, g.id] }
  end

  def total_grouped
    @total = current_user.tasks.select('task.Taskid, group.id')
      .joins(:groups).sum(:amount)
  end

  def total_external
    @total = current_user.tasks.left_outer_joins(:groupings)
      .where(groupings: { task_id: nil }).sum(:amount)
  end
end
