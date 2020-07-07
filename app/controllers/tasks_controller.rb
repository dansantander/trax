class TasksController < ApplicationController
  def index
    official = params.dig(:task, :official)
    if official
      if params[:task][:official] == 'true'
        @tasks = Task.grouped_tasks(current_user)
        total_grouped
        session[:official] = 'true'
      else
        @tasks = Task.external_tasks(current_user)
        total_external
        session[:official] = 'true'
      end
    else
      if session[:official] == 'true'
        @tasks = Task.grouped_tasks(current_user)
        total_grouped
      else
        @tasks = Task.external_tasks(current_user)
        total_external
      end
    end 
  end

  def new
    groups_list
    @task = Task.new
  end

  def create
    @task = current_user.tasks.new(task_params)
    @task.group = params[:group]

    if @task.save
      redirect_to tasks_path, notice: 'Task was successfully created.'
    else
      render :new, alert: 'Task was not created.'
    end
  end

  def destroy
  end
  
  private

  def groups_list
    @group_options = Group.all.map { |g| [g.name, g.id] }
  end

  def task_params
    params.require(:task).permit(:title, :amount, :group)
  end

  def total_grouped
    @total = Task.select('task.id, group.id').joins(:groups).sum(:amount)
  end

  def total_external
    @total = Task.left_outer_joins(:groupings).where(groupings: { task_id: nil }).sum(:amount)
  end
end
