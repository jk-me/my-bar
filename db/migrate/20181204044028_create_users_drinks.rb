class CreateUsersDrinks < ActiveRecord::Migration[5.2]
  def change
    create_table :users_drinks do |t|
      t.integer :user_id
      t.integer :drink_id
    end
  end
end
