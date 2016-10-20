class OrderItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order
  before_action :save_order, only: [:create, :update]

  PAGE_PER = 4

  def index
  end

  def create
  end

  def update
  end

  def destroy
    @order_item = @order.order_items.find(params[:id])
    @order_item.destroy
    init_order if @order.order_items.count.zero?
    redirect_to order_items_path
  end

  private

  def set_order
    @order = current_order
    order_items_pagenate PAGE_PER
  end

  def save_order
    @order_item = @order.order_items.find_or_initialize_by(product_id: order_item_params[:product_id])
    @order_item.quantity = order_item_params[:quantity]
    return unless @order_item.save
    session[:order_id] = @order.id
    redirect_to order_items_path
  end

  def order_item_params
    params.require(:order_item).permit(:quantity, :product_id)
  end
end
