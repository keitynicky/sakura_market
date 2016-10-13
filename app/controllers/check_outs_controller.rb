class CheckOutsController < ApplicationController
  before_action :authenticate_user!

  def user_info
  end

  def delivery
    @order = current_order
  end

  def update
    redirect_to confirm_check_out_path
  end

  def confirm
  end

end
