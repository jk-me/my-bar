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
    if drink_params[:user_ids][0] == current_user.id.to_s
      @drink = Drink.create(drink_params)
      if @drink.valid?
        redirect_to drink_path(@drink)
      else
        render :new
      end
    else
      flash[:error]="You may not access another user's data"
      redirect_to user_path(current_user)
    end
  end

  def show
    @drink = Drink.find_by_id(params[:id])
  end

  def edit
    @drink = Drink.find_by_id(params[:id])
  end

  def update
    # byebug
    if drink_params[:user_ids][0] == current_user.id.to_s
      @drink = Drink.find_by_id(params[:id])
      @drink.update(drink_params)
      if @drink.valid?
        redirect_to drink_path(@drink)
      else
        render :edit
      end
    else
      flash[:error]="You may not access another user's data"
      redirect_to user_path(current_user)
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
    # params.permit(ingredients:[ :id, :parts])
  end

end
