module UsersHelper
  def grouped_tasks(user)
    user.tasks.includes(groups: [:user]).select { |t| t.groups.any? }
  end

=begin   def self.grouped_tasks
    self.tasks.includes(groups: [:user]).select { |t| t.groups.any? }
  end
=end

  def external_tasks(user)
    user.tasks.includes(:groups).reject { |t| t.groups.any? }
  end
end
