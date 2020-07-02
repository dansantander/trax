class Group < ApplicationRecord
  has_many :groupings
  has_many :tasks, through: :groupings

  validates :name, presence: true, length: { maximum: 20 }
end
