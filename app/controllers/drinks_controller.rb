class DrinksController < ApplicationController
  before_action :redirect_if_not_logged_in
  def index
    if params[:filter] == '4+ ingredients'
      @drinks = Drink.complex
    elsif params[:filter] == '3 or less ingredients'
      @drinks = Drink.simple
    else
      @drinks = Drink.all
    end
  end

  def new
    @drink = Drink.new
  end

  def create
    # byebug
    @drink = Drink.create(drink_params)
    if @drink.valid?
      redirect_to drink_path(@drink)
    else
      render :new
    end
  end

  def show
    # byebug
    @drink = Drink.find_by_id(params[:id])
  end

  def edit
    @drink = Drink.find_by_id(params[:id])

  end

  def update
    @drink = Drink.find_by_id(params[:id])
    @drink.update(drink_params)
    if @drink.valid?
      redirect_to drink_path(@drink)
    else
      render :edit
    end
  end

  def destroy
    @drink = Drink.find_by_id(params[:id])
    @drink.destroy
    redirect_to drinks_path
  end

  private

  def drink_params
    params.require(:drink).permit(:name, :description, user_ids:[], ingredient_ids:[], ingredients_attributes:[:name] )
  end
end
