class Api::SessionsController < ApplicationController
  # see: https://stackoverflow.com/questions/3364492/actioncontrollerinvalidauthenticitytoken
  skip_before_action :verify_authenticity_token
  
  def create
    @user = User.find_by_credentials(params[:email], params[:password])
    if @user.nil?
      head :unprocessable_entity
    else
      log_in!(@user)
      render json: @user
    end
  end

  def show
    @user = current_user
    if @user.nil?
      render json: {}
    else
      render json: @user
    end
  end
  
  def destroy
    if !current_user.nil?
      sign_out!
    end
    render json: {}
  end
end