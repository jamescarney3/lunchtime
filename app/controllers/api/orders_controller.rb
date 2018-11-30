class Api::OrdersController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :require_logged_in, only: [:create, :update, :delete, :select]
  
  def new
    @order = Order.new
    render json: @order
  end
  
  def create
    @order = Order.new(order_params)
    if @order.save
      render json: @order
    else
      render @order.errors.full_messages, status: :unprocessable_entity
    end
  end
  
  def edit
    @order = Order.find(params[:id])  
    if !@order.nil?
      render json: @order
    else
      render status: :not_found
    end
  end
  
  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      render json: @order
    else
      render json: @order.errors.full_messages, status: :not_found
    end
  end
  
  def show
    @order = Order.find(params[:id])
    if !@order.nil?
      render json: @order
    else
      render status: :not_found
    end
  end
  
  def destroy
    @order = Order.find(params[:id])
    if @order.delete
      render json: @order
    else
      render status: :not_found
    end
  end
  
  private
  
  def order_params
    params.require(:order).permit(:text, :note, :user_id, :order_group_id)
  end
end