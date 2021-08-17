class Public::ProductsController < ApplicationController
  
  def index
    @products = Product.all
  end
  
    private
    def product_params
      params.require(:product).permit(:title, :image, :price)
    end
end
