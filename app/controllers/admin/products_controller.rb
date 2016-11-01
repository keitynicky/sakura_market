class Admin::ProductsController < Admin::AdminController
  def index
    @products = Product.all
  end

  def new
  end

  def create
  end
end
