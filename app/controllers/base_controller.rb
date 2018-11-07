class BaseController < ApplicationController
  def root
    render plain: "Lunchtime API"
  end
end