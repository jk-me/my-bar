class Review < ApplicationRecord
  belongs_to :user
  belongs_to :drink

  def user_name
    self.user.name
  end
end
