class OrderItemsController < ApplicationController
  before_action :set_order

  def create
    # TODO もうすでにカートに追加済の場合は更新する処理、もう少しシンプルにかけないか検討すること（商品詳細が新規作成しか作っていないから、多分そこを見直したほうがよい）
    @order_item = @order.order_items.where(product_id: order_item_params[:product_id]).first_or_initialize
    @order_item.quantity = order_item_params[:quantity]
    @order.save
    @order_item.save
    session[:order_id] = @order.id
    redirect_to cart_path
  end

  def update

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
