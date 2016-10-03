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
    send_data Product.find(params[:id]).photo, :type => 'image/png', :disposition => 'inline'
  end
end
