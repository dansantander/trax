class Task < ApplicationRecord
  belongs_to :creator, class_name: 'User'

  has_many :groupings
  has_many :groups, through: :groupings

  validates :title, presence: true, length: { maximum: 20 }
  validates :amount, presence: true, numericality: { only_integer: true }

  default_scope -> { order(created_at: :desc) }

  def group
    groups.first
  end

  def group=(group)
    gr = Group.find_by(id: group)
    groups << gr if gr
  end

end
