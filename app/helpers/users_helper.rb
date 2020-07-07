module UsersHelper
  def grouped_tasks(user)
    user.tasks.includes(:groups).select { |t| t.groups.any? }
  end

  def external_tasks(user)
    user.tasks.includes(:groups).reject { |t| t.groups.any? }
  end
end
