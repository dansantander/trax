class Task < ApplicationRecord
  belongs_to :musician, class_name: 'User'
end
