class IngredientsController < ApplicationController
  before_action :redirect_if_not_logged_in

  def index
    @ingredients = Ingredient.all
  end

  def show
    @ingredient = Ingredient.find_by_id(params[:id])
  end
end
