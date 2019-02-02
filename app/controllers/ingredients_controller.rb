class IngredientsController < ApplicationController
  before_action :redirect_if_not_logged_in

  def index
    # byebug
    if params[:filter] == 'Number of Drinks (desc)'
      @ingredients = Ingredient.numberofdrinks
    elsif params[:filter] == 'Alphabetical'
      @ingredients = Ingredient.alphabetical
    else
      @ingredients = Ingredient.all
    end
  end

  def show
    @ingredient = Ingredient.find_by_id(params[:id])
  end

  def edit
    @ingredient = Ingredient.find_by_id(params[:id])
  end

  def update
    @ingredient = Ingredient.find_by_id(params[:id])
    @ingredient.update(ingredient_params)
    if @ingredient.valid?
      redirect_to ingredient_path(@ingredient)
    else
      render :edit
    end
  end

  private

  def ingredient_params
    params.require(:ingredient).permit(:name,:description)
  end
end
