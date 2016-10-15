require 'date'

class CheckOutsController < ApplicationController
  before_action :authenticate_user!

  def user_info
  end

  def delivery
  end

  def update
    order = current_order
    order.delivery_date = Date.parse order_params[:delivery_date]
    order.delivery_time = order_params[:delivery_time]
    order.save!
    redirect_to confirm_check_out_path
  end

  def confirm
  end

private

  def order_params
    params.require(:order).permit(:delivery_date, :delivery_time)
  end

  def convert_to_date target
    Date.parse target
    # Date.strptime(target,'%Y年%m月%d日')
  end

end
