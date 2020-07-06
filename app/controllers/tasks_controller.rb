class TasksController < ApplicationController
  def index
    #official = params.dig(:task, :official)
    #if official
    @tasks = Task.all
    
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


end
