class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = current_user.tasks.new(task_params)

    if @task.save
      redirect_to tasks_path, notice: 'Task was successfully created.'
    else
      render :new, alert: 'Task was not created.'
    end
  end

  def destroy
  end
  
  private

  def task_params
    params.require(:task).permit(:title, :amount)
  end


end
