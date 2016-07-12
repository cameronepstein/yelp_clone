class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
    # raise "pretty little lemon"
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    Restaurant.create(restaurant_params)
    redirect_to '/restaurants'
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name)
  end

end
