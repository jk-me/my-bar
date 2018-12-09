class ReviewsController < ApplicationController
  before_action :redirect_if_not_logged_in

  def new
    if params[:drink_id]
      @drink = Drink.find_by_id(params[:drink_id])
    end
    @review = Review.new
  end

  def create
    # byebug
    @review = Review.create(review_params)
    redirect_to drink_path(@review.drink.id)
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    @review.update(review_params)
    redirect_to drink_path(@review.drink.id)

  end

  def destroy
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content, :user_id, :drink_id)
  end
end
