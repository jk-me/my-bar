class Ingredient < ApplicationRecord
  has_many :drinks_ingredients
  has_many :drinks, through: :drinks_ingredients

  validates :name, presence: true, uniqueness: {case_sensitive: false}

  def find_join_record(drink)
    self.drinks_ingredients.find_by(drink_id: drink.id)
  end
end
