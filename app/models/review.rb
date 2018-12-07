class Review < ApplicationRecord
  belongs_to :user
  belongs_to :drink

  validates :rating, presence: true, inclusion: (1..10)
end
