class ProductsController < ApplicationController
  def index
    @products = Product.all.order(:sort).page(params[:page])
  end

  def show
    @product = Product.find(params[:id])
    if user_signed_in?
      @order_item = current_order.order_items.find_or_initialize_by(product_id: params[:id])
    end
  end
end
