class DrinksIngredient < ApplicationRecord
  belongs_to :drink
  belongs_to :ingredient
end
