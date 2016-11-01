class Admin::ProductsController < Admin::AdminController
  before_action :init_product, only: [:new, :create]
  before_action :set_product, only: [:edit, :update]

  def index
    @products = Product.all
  end

  def new
  end

  def create
    @product.update_attributes(product_params)
    unless params[:product][:photo].nil?
      @product.photo = File.open(params[:product][:photo].path, 'rb').read
    end
    if @product.save
      redirect_to admin_products_path
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  private

  def init_product
    @product = Product.new
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :description, :price, :sort)
  end
end
