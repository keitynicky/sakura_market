class ProductsController < ApplicationController

  def index
    @products = Product.all.order(:sort)
  end

  def show
    @product = Product.find(params[:id])
    if user_signed_in?
      @order_item = current_order.order_items.new
    end
  end
  
end
