class OrderItemsController < ApplicationController
  before_action :set_order

  def create
    @order_item = @order.order_items.new(order_item_params)
    @order.save
    session[:order_id] = @order.id
    redirect_to cart_path
  end

  def destroy
    @order_item = @order.order_items.find(params[:id])
    @order_item.destroy
    redirect_to cart_path
  end

private
  def set_order
    @order = current_order
  end  

  def order_item_params
    params.require(:order_item).permit(:quantity, :product_id)
  end

end
