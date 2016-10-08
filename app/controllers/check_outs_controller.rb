class CheckOutsController < ApplicationController
  before_action :authenticate_user!

  def new
    @order = current_order
    
  end

  def create
  end

end
