class OrderItemsController < ApplicationController
  before_action :set_order
  after_action :after_create_or_update, only: [:create, :update]

  def create
    @order_item = @order.order_items.new(order_item_params)
    redirect_to cart_path    
  end

  def update
    @order_item = @order.order_items.find_or_create_by(product_id: order_item_params[:product_id])
    @order_item.quantity = order_item_params[:quantity]
    @order_item.save
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

  def after_create_or_update
    @order.save
    session[:order_id] = @order.id
  end  

  def order_item_params
    params.require(:order_item).permit(:quantity, :product_id)
  end

end
