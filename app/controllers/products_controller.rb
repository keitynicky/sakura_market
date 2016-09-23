class ProductsController < ApplicationController
    def index
      @products = Product.all.order(:sort)
    end
end
