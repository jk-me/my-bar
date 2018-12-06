class Ingredient < ApplicationRecord
  has_many :drinks_ingredients
  has_many :drinks, through: :drinks_ingredients

end
