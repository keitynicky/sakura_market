class Admin::ProductsController < Admin::AdminController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new
    @product.update_attributes(product_params)
    if @product.save

    else
      render :new
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :price, :sort)
  end
end
