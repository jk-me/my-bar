class DrinksIngredient < ApplicationRecord
  belongs_to :drink
  belongs_to :ingredient

  def ingredient_name= (x)
    self.ingredient = Ingredient.find_or_create_by(name: x)
  end

  def ingredient_name
    self.ingredient ? self.ingredient.name : nil
  end

end
