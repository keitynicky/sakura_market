class ShoppingCartsController < ApplicationController
  # before_action :authenticate_user!

  def create
    # current_user.shopping_carts.create(params)
    # redirect_to :back
  end

  private
  
  def params
    params[:shopping_cart].permit([:quantity])
  end

end
