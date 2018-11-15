class Api::OrderGroupsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :require_logged_in, only: [:create, :update, :delete, :select]
  
  def new
    @order_group = OrderGroup.new
    
    render json: @order_group
  end
  
  def create
    @order_group = OrderGroup.create(order_group_params)
    if !@order_group.nil?
      render json: @order_group
    else
      render json: @order_group.errors.full_messages, status: :unprocessable_entity
    end
  end
  
  def edit
    @order_group = OrderGroup.find(params[:id])
    if !@order_group.nil?
      render json: @order_group
    else
      render json: @order_group.errors.full_messages, status: :not_found
    end
  end
  
  def update
    @order_group = OrderGroup.find(params[:id])
    if @order_group.update(order_group_params)
      render json: @order_group
    else
      render json: @order_group.errors.full_messages, status: :unprocessable_entity
    end
  end
  
  def show
    @order_group = OrderGroup.find(params[:id])
    if !@order_group.nil?
      render json: @order_group
    else
      render json: @order_group.errors.full_messages, status: :not_found
    
  
  def delete
    @order_group = OrderGroup.find(params[:id])
    if @order_group.delete
      render json: @order_group
    else
      render json: @order_group.errors.full_messages, status: :not_found
    end
  end
  
  private
  
  def order_group_params
    params.require(:order_group).permit(:user_id, :restaurant_id)
  end
end