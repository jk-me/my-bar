class DrinksController < ApplicationController
  before_action :redirect_if_not_logged_in
  def index
    @drinks = Drink.all
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
    params.require(:drink).permit(:name, :description, user_ids:[], ingredient_ids:[] )
  end
end
