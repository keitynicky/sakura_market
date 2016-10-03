class OrderItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order
  before_action :set_order_item, only: [:create, :update]
  after_action :after_create_or_update, only: [:create, :update]

  def index
  end

  def create
    redirect_to order_items_path
  end

  def update
    redirect_to order_items_path    
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
  end

  def after_create_or_update
    @order.save
    session[:order_id] = @order.id
  end  

  def order_item_params
    params.require(:order_item).permit(:quantity, :product_id)
  end

end
