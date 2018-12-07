class Ingredient < ApplicationRecord
  has_many :drinks_ingredients
  has_many :drinks, through: :drinks_ingredients

  validates :name, presence: true, uniqueness: {case_sensitive: false}
end
