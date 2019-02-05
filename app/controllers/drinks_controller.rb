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
    redirect_if_wrong_user(drink_params[:user_ids][0]) if !drink_params[:user_ids].nil?

    @drink = Drink.create(drink_params)
    @d_ingredients = params[:ingredients].delete_if { |ing| !ing[:parts].present? || (ing[:parts]).to_i <= 0}

    if @drink.valid?
      @d_ingredients.each do |x|
        di = DrinksIngredient.create(drink_id: @drink.id, ingredient_id: x['id'], parts: x['parts'])
        di.save!
      end
      redirect_to drink_path(@drink)
    else
      render :new
    end
  end

  def show
    if params[:ingredient_id]
      @ingredient = Ingredient.find(params[:ingredient_id])
    end
    @drink = Drink.find_by_id(params[:id])
    respond_to do |f|
      f.html {render :show}
      f.json {render json: @drink}
    end
  end

  def edit
    @drink = Drink.find_by_id(params[:id])
  end

  def update
    redirect_if_wrong_user(drink_params[:user_ids][0]) if !drink_params[:user_ids].nil?
    @drink = Drink.find_by_id(params[:id])
    @drink.users.delete(current_user) if drink_params[:user_id].nil?
    @drink.drinks_ingredients.each{|di| di.destroy}
    @drink.update(drink_params)
      if @drink.valid?
        @d_ingredients = params[:ingredients].delete_if { |ing| !ing[:parts].present? || (ing[:parts]).to_i <= 0}
        @d_ingredients.each do |x|
          di = DrinksIngredient.create(drink_id: @drink.id, ingredient_id: x['id'], parts: x['parts'])
          di.save!
        end
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
    params.require(:drink).permit(:name, :description,
      user_ids:[], #add to user favs
      drinks_ingredients_attributes:[:ingredient_name, :parts, :drink_id]) #new ingredient attribute (accepts nested attributes)
  end

end
