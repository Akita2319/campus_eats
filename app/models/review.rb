class Review < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :shop

  validates :comment, presence: true
  validates :rating, inclusion: { in: 1..5 }
end
