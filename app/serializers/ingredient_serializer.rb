class IngredientSerializer < ActiveModel::Serializer
  attributes :id, :name, :description
  
  has_many :drinks_ingredients
  has_many :drinks, through: :drinks_ingredients
end
