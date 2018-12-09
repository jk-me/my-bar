class Review < ApplicationRecord
  belongs_to :user
  belongs_to :drink

  # validates :content, presence: true
end
