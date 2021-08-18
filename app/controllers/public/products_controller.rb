class Public::ProductsController < ApplicationController
  
  def index
    @products = Product.page(params[:page]).per()
  end
  
  def show
    @product = Product.find(params[:id])
    @cart_items = CartItem.new
  end
  
  private
  def product_params
    params.require(:product).permit(:title, :image, :price)
  end
end
