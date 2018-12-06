class DrinksController < ApplicationController

  def index
    @drinks = Drink.all
  end
  
  def new
    @drink = Drink.new
  end

  def create
    @drink = Drink.create(drink_params)
    redirect_to drink_path(@drink)
  end

  def show
    @drink = Drink.find_by_id(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def drink_params
    params.require(:drink).permit(:name, :description)
  end
end
