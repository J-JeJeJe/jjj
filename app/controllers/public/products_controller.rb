class Public::ProductsController < ApplicationController

  before_action :authenticate_customer!,except: [:index]


  def index
    @products = Product.page(params[:page]).per(8)
    @product_categories = ProductCategory.all
  end

  def show
    @product = Product.find(params[:id])
    @cart_item = CartItem.new
  end

  private
  def product_params
    params.require(:product).permit(:title, :image, :price)
  end


end
