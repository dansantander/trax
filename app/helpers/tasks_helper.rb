module TasksHelper
  def task_list(internal)
    if internal
      if params[:task][:internal] == 'true'
        @tasks = current_user.grouped_tasks
        total_grouped
        cookies[:internal] = 'true'
      else
        @tasks = current_user.external_tasks
        total_external
        cookies[:internal] = 'false'
      end
    elsif cookies[:internal] == 'true'
      @tasks = current_user.grouped_tasks
      total_grouped
    else
      @tasks = current_user.external_tasks
      total_external
    end
    @tasks
  end
  
end
