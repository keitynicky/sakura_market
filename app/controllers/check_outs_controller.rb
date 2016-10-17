require 'date'

class CheckOutsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order, only: [:delivery, :update, :confirm, :complete] 

  def user_info
  end

  def delivery
  end

  def update
    if is_complete?
      redirect_to complete_check_out_path
    else
      save_delivery
    end
  end

  def confirm
  end

  def complete
    order_is_phurchased
    session[:order_id] = nil
  end

private

  def set_order
    @order = current_order
  end

  def order_params
    params.require(:order).permit(:delivery_date, :delivery_time)
  end

  def is_complete?
    params.require(:commit) == "ご購入"
  end

  def save_delivery
    @order.update_delivery order_params
    if @order.save(context: :checkout)
      redirect_to confirm_check_out_path
    else
      render :delivery
    end
  end

  def order_is_phurchased
    @order.is_phurchased = true
    @order.save
  end
end
