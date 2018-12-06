class Drink < ApplicationRecord
  has_many :users_drinks
  has_many :users, through: :users_drinks
  has_many :ingredients, through: :ingredients_drinks
  has_many :reviews
end
