class User < ApplicationRecord
  has_many :tasks, foreign_key: 'creator_id', class_name: 'Task'
  has_many :groups, foreign_key: 'user_id', class_name: 'Group', dependent: :destroy

  validates :name, presence: true, length: { minimum: 3, maximum: 10 }
  default_scope -> { order(created_at: :desc) }

  def grouped_tasks
    tasks.includes(:groups).select { |t| t.groups.any? }
  end

  def external_tasks
    tasks.includes(:groups).reject { |t| t.groups.any? }
  end
end
