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
    byebug
    #//ingredient = product/item, drink = package
    if !drink_params[:user_ids].nil?
      redirect_if_wrong_user(drink_params[:user_ids][0])
    end
    @drink = Drink.create(drink_params)
    @drink_ingredients = params[:ingredients].delete_if { |ingredient| !ingredient[:parts].present? || (ingredient[:parts]).to_i <= 0}
    if @drink.valid?
      @drink_ingredients.each do |x|
        di = DrinksIngredient.create(drink_id: @drink.id, ingredient_id: x['id'], parts: x['parts'])
        di.save!
      end
      redirect_to drink_path(@drink)
    else
      render :new
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
    params.require(:drink).permit(:name, :description,
      user_ids:[], #add to fav checkbox
      #ingredient_ids:[], #ingredients checkbox
      ingredients_attributes:[:name]) #new ingredient attribute (accepts nested attributes)
  end

end
