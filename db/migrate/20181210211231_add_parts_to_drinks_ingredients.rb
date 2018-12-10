class AddPartsToDrinksIngredients < ActiveRecord::Migration[5.2]
  def change
    add_column :drinks_ingredients, :parts, :integer
  end
end
