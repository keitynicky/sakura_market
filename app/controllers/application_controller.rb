class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_order

  def current_order
    if !session[:order_id].nil?
      Order.find(session[:order_id])
    else
      current_user.orders.new
    end
  end

  def show_photo
    send_data Product.find(params[:id]).photo, type: 'image/png', disposition: 'inline'
  end

  def common_user_params
    params.require(:user).permit(:postal_code, :address_level1, :address_level2, :address_line1, :address_line2, :email, :password, :family_name, :given_name, :password_confirmation)
  end

  def init_order
    session[:order_id] = nil
  end
end
