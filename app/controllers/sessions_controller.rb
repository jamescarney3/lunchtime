class SessionsController < ApplicationController
  # see: https://stackoverflow.com/questions/3364492/actioncontrollerinvalidauthenticitytoken
  skip_before_action :verify_authenticity_token
  
  def create
    render plain: "Session create"
  end

  def show
    render plain: "Session show"
  end
  
  def destroy
    render plain: "Session destroy"
  end
end