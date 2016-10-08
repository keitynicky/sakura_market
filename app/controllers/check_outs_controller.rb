class CheckOutsController < ApplicationController
  
  def new
    @order = current_order
  end

  def create
  end

end
