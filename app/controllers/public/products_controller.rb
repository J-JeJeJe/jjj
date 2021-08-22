class Public::ProductsController < ApplicationController

  before_action :authenticate_customer!,except: [:index]


  def index
    @products = Product.page(params[:page]).per(6)
    @product_categories = ProductCategory.all
  end

  def show
    @product_categories = ProductCategory.all
    @product = Product.find(params[:id])
    @cart_item = CartItem.new
    @products = Product.all.order(created_at: :desc).limit(8)
  end

  private
  def product_params
    params.require(:product).permit(:title, :image, :price)
  end


end
