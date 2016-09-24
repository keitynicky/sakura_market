class ProductsController < ApplicationController

  def index
    @products = Product.all.order(:sort)
  end

  def show_photo
    send_data Product.find(params[:id]).photo, :type => 'image/png', :disposition => 'inline'
  end
  
end
