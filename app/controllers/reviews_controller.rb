class ReviewsController < ApplicationController
  before_action :redirect_if_not_logged_in

  def new
    @review = Review.new
  end

  def create
    @review = Review.create(review_params)
    if @review.valid?
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
