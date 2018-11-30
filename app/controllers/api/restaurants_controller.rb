class Api::RestaurantsController < ApplicationController
  # protect_from_forgery with: :exception
  skip_before_action :verify_authenticity_token
  before_action :require_logged_in, only: [:create, :update, :delete]

  def index
    @restaurants = Restaurant.all
    render json: @restaurants
  end
  
  def new
    @restaurant = Restaurant.new
    render json: @restaurant
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      render json: @restaurant
    else
      render @restaurant.errors.full_messages, tatus: :unprocessable_entity
    end
  end
  
  def edit
    @restaurant = Restaurant.find(params[:id])
    if !@restaurant.nil?
      render json: @restaurant
    else
      render status: :not_found
    end
  end

  def update
    @restaurant = Restaurant.find(params[:id])
    if @restaurant.update(restaurant_params)
      render json: @restaurant
    else
      render json: @restaurant.errors.full_messages, status: :unprocessable_entity
    end
  end

  # admin protect this?
  def destroy
    @restaurant = Restaurant.find(params[:id])
    if @restaurant.delete
      render json: @restaurant
    else
      render status: :not_found
    end
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :menu_url, :note)
  end
end
