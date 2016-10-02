class CartsController < ApplicationController

  def show
    @order = current_order
  end

  # TODO イメージ画像を出力する処理は共通化すること
  def show_photo
    send_data Product.find(params[:id]).photo, :type => 'image/png', :disposition => 'inline'
  end

end
