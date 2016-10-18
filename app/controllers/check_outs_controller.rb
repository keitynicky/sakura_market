require 'date'

class CheckOutsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:user_info, :update_user_info] 
  before_action :set_order, only: [:delivery, :update, :confirm, :complete] 

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

  def set_user
    @user = current_user
  end

  def set_order
    @order = current_order
  end

  def order_params
    params.require(:order).permit(:delivery_date, :delivery_time)
  end

  def user_params
    params.require(:user).permit(:postal_code, :address_level1, :address_level2,:address_line1,:address_line2,:email, :password, :family_name, :given_name)    
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
