class Ingredient < ApplicationRecord
  has_many :drinks_ingredients
  has_many :drinks, through: :drinks_ingredients

  validates :name, presence: true, uniqueness: {case_sensitive: false}

  def find_join_record(drink)
    self.drinks_ingredients.find_by(drink_id: drink.id)
  end

  def self.alphabetical
    self.order(:name)
  end


  scope :numberofdrinks, -> { self.joins(:drinks).group('ingredients.id').order("count(ingredients.id) desc")}

end
