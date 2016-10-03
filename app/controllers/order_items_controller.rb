class OrderItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order
  before_action :set_order_item, only: [:create, :update]

  def index
  end

  def create
  end

  def update
  end

  def destroy
    @order_item = @order.order_items.find(params[:id])
    @order_item.destroy
    redirect_to order_items_path    
  end

private
  def set_order
    @order = current_order
  end

  def set_order_item
    @order_item = @order.order_items.find_or_initialize_by(product_id: order_item_params[:product_id])
    @order_item.quantity = order_item_params[:quantity]
    @order_item.save
    @order.save
    session[:order_id] = @order.id
    redirect_to order_items_path            
  end

  def order_item_params
    params.require(:order_item).permit(:quantity, :product_id)
  end

end
