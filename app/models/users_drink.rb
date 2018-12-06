class UsersDrink < ApplicationRecord
  belongs_to :drink
  belongs_to :user
end
