class Api::UsersController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :require_logged_in, only: [:edit, :update, :destroy]
  
  def new
    @user = User.new
    render json: @user
  end
  
  def create
    @user = User.create(user_params)
    if !@user.nil?
      render json: @user
    else
      render status: :unprocessable_entity
    end
  end
  
  def edit
    @user = User.find(params[:id])
    if !@user.nil?
      render json: @user
    else
      render status: :not_found
    end
  end
  
  def show
    @user = User.find(params[:id])
    if !@user.nil?
      render json: @user
    else
      render status: :not_found
    end
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      render json: @user
    else
      render status: :unprocessable_entity
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    if @user.delete
      render json: @user
    else
      render status: :not_found
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:email, :name, :password)
  end
end