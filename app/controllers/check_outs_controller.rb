require 'date'

class CheckOutsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:user_info, :update_user_info]
  before_action :set_order, only: [:delivery, :update, :confirm]

  SHORT_PAGE_PER = 2

  def show
    set_order_by_param current_user.orders.find(params[:format])
  end

  def user_info
  end

  def update_user_info
    @user.update_attributes(user_params)
    if @user.save(context: :checkout)
      redirect_to delivery_check_out_path
    else
      render :user_info
    end
  end

  def delivery
  end

  def update
    if complete?
      order_is_phurchased
      init_order
      redirect_to complete_check_out_path
    else
      save_delivery
    end
  end

  def confirm
  end

  def complete
    set_order_by_param current_user.orders.last
  end

  private

  def set_user
    @user = current_user
  end

  def set_order 
    set_order_by_param current_order
  end

  def set_order_by_param order
    @order = order
    set_order_items SHORT_PAGE_PER
  end

  def order_params
    params.require(:order).permit(:delivery_date, :delivery_time)
  end

  def user_params
    params.require(:user).permit(:postal_code, :address_level1, :address_level2, :address_line1, :address_line2, :email, :password, :family_name, :given_name)
  end

  def complete?
    params.require(:commit) == 'ご購入'
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
    @order.save(context: :checkout)
  end
end
