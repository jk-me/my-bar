class Drink < ApplicationRecord
  has_many :users_drinks
  has_many :users, through: :users_drinks
  has_many :drinks_ingredients
  has_many :ingredients, through: :drinks_ingredients
  has_many :reviews

  validates :name, presence: true

end
