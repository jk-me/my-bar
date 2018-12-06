class DrinksController < ApplicationController

  def new
  end

  def create
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
end
