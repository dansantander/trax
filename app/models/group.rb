class Group < ApplicationRecord
  belongs_to :user, foreign_key: 'user_id'

  has_many :groupings
  has_many :tasks, through: :groupings

  validates :name, presence: true, length: { maximum: 20 }

  validates :icon, format: { with: /.+\.(jpe?g|png)\z/,
                             message: 'only allows jpeg, jpg or png formats.' },
                   allow_blank: true

  scope :alphabetical, -> { order(name: :asc) }
end
