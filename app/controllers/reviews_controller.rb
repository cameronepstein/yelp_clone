class ReviewsController < ApplicationController

  before_action :authenticate_user!

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.restaurant_id = @restaurant.id
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      flash[:notice] = "You have already reviewed this restaurant"
      redirect_to restaurant_path(@restaurant)
    end
  end

  private

  def review_params
    params.require(:review).permit(:thoughts, :rating, :user_id)
  end
end
