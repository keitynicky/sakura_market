class Admin::ProductsController < Admin::AdminController
  before_action :init_product , only:[:new, :create]

  def index
    @products = Product.all
  end

  def new
  end

  def create
    @product.update_attributes(product_params)
    if @product.save

    else
      render :new
    end
  end

  private

  def init_product
    @product = Product.new
  end

  def product_params
    params.require(:product).permit(:name, :description, :price, :sort)
  end
end
