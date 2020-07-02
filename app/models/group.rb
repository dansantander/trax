class Group < ApplicationRecord
  belongs_to :user, foreign_key: 'user_id'

  has_many :groupings
  has_many :tasks, through: :groupings

  validates :name, presence: true, length: { maximum: 20 }

  scope :alphabetical, -> { order(name: :asc) }
end
