class OrderItemsController < ApplicationController
  def create
    @order = current_order
    @order_item = @order.order_items.new(order_item_params)
    @order.save
    session[:order_id] = @order.id

    redirect_to cart_path
  end

private
  
  def order_item_params
    params.require(:order_item).permit(:quantity, :product_id)
  end

end
