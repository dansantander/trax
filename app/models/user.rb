class User < ApplicationRecord
  has_many :tasks, foreign_key: 'musician_id', class_name: 'Task'
end
