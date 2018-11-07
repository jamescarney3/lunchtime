class Api::RestaurantsController < ApplicationController
  # protect_from_forgery with: :exception
  skip_before_action :verify_authenticity_token
  before_action :require_logged_in, only: [:create, :update, :delete, :select]

  def index
    @restaurants = Restaurant.all
    render json: @restaurants
  end

  def create
    @restaurant = Restaurant.create(restaurant_params)

    if !@restaurant.nil?
      render json: @restaurant
    else
      render json: @restaurant.errors.full_messages, status: :unprocessable_entity
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
  def delete
    @restaurant = Restaurant.find(params[:id])
    if @restaurant.delete
      render json: @restaurant
    else
      render json: @restaurant.errors.full_messages, status: :unprocessable_entity
    end
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:id, :name, :menu_url, :note)
  end
end
