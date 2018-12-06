class AddUserIdAndDrinkIdToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :user_id, :integer
    add_column :reviews, :drink_id, :integer
  end
end
