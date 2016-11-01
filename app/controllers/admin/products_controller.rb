class Admin::ProductsController < Admin::AdminController
  before_action :init_product , only:[:new, :create]

  def index
    @products = Product.all
  end

  def new
  end

  def create
    @product.update_attributes(product_params)
    @product.photo = File.open(params[:product][:photo].path, 'rb').read
    q if @product.save
      redirect_to admin_products_path
    else
      render :new
    end
  end

  private

  def init_product
    @product = Product.new
  end

  def product_params
    params.require(:product).permit(:name, :description, :price, :sort, :photo)
  end
end
