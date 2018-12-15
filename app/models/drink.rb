class Drink < ApplicationRecord
  has_many :users_drinks
  has_many :users, through: :users_drinks
  has_many :drinks_ingredients
  has_many :ingredients, through: :drinks_ingredients
  has_many :reviews

  validates :name, presence: true , uniqueness: {case_sensitive: false}

  accepts_nested_attributes_for :drinks_ingredients, reject_if: proc { |att| att['ingredient_name'].blank? || att['parts'].blank? || att[:parts].to_i <= 0}


  scope :complex, -> { self.joins(:ingredients).group('drinks.id').having('count(drink_id) > 3') } #drinks w/ more than 3 ingredients

  scope :simple, -> { self.joins(:ingredients).group('drinks.id').having('count(drink_id) <= 3') } #drinks w/ 3 or less ingredients

end
