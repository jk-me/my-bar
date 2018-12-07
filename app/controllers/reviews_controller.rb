class ReviewsController < ApplicationController
  before_action :redirect_if_not_logged_in
  
  def new
    @review = Review.new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
