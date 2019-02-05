class ReviewsController < ApplicationController
  before_action :redirect_if_not_logged_in

  def index
    if params[:user_id] == current_user.id.to_s
      @reviews = current_user.reviews
    else
      flash[:error]= 'You may only view your own list of reviews.'
      redirect_to user_path(current_user)
    end
  end

  def new
    if params[:drink_id]
      @drink = Drink.find_by_id(params[:drink_id])
      @review = Review.new
    else
      flash[:error] = 'You must select a drink before creating a review.'
      redirect_to user_path(current_user)
    end
  end

  def show
    @review = Review.find(params[:id])
    render json: @review
  end


  def create
    # if review_params[:user_id] == current_user.id.to_s
      # @review = Review.create(review_params)
      # redirect_to drink_path(@review.drink)
      render json: @review, status:201
    # else
    #   flash[:error] = 'Do not attempt to create reviews for other users.'
    #   redirect_to user_path(current_user)
    # end
  end

  def edit
    @review = Review.find(params[:id])
    if @review.user != current_user
      flash[:error] = 'You may only edit your own reviews.'
      redirect_to user_path(current_user)
    end
  end

  def update
    @review = Review.find(params[:id])
    if @review.user == current_user
      @review.update(review_params)
      redirect_to drink_path(@review.drink)
    else
      flash[:error] = 'Do not attempt to edit reviews of other users.'
      redirect_to user_path(current_user)
    end
  end

  def destroy
    @review = Review.find_by_id(params[:id])
    if @review.user != current_user
      flash[:error] = 'You may only delete your own reviews.'
      redirect_to user_path(current_user)
    else
      @review.destroy
      redirect_to user_reviews_path(current_user.id)
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content, :user_id, :drink_id)
  end
end
