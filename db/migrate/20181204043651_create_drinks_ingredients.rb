class CreateDrinksIngredients < ActiveRecord::Migration[5.2]
  def change
    create_table :drinks_ingredients do |t|
      t.integer :drink_id
      t.integer :ingredient_id

    end
  end
end
