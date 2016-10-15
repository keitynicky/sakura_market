require 'date'

class CheckOutsController < ApplicationController
  before_action :authenticate_user!

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
    @order = current_order
    session[:order_id] = nil
  end

private

  def order_params
    params.require(:order).permit(:delivery_date, :delivery_time)
  end

  def is_complete?
    params.require(:commit) == "ご購入"
  end

  def save_delivery
    order = current_order
    unless order_params[:delivery_date].empty?
      order.delivery_date = Date.parse order_params[:delivery_date]
    end
    order.delivery_time = order_params[:delivery_time]
    if order.save(context: :delivery_save)
        redirect_to confirm_check_out_path
    else
        render 'delivery'
    end
  end

  def order_is_phurchased
    order = current_order
    order.is_phurchased = true
    order.save
  end
end
