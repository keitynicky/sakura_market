class ProductsController < ApplicationController

  def index
    @products = Product.all.order(:sort)
  end

  def show_photo
    @product = Product.find(params[:id])
    send_data @product.photo, :type => 'image/png', :disposition => 'inline'
  end
  
end
