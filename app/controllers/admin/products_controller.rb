class Admin::ProductsController < ApplicationController
    
    def new
        @product = Product.new
    end
    
    def create
        @product = Product.new(product_params)
        @product.save
        redirect_to owner_products_path
    end
    
    def index
        @products = Product.all
        @products = Product.page(params[:page]).per(10)
    end
    
    def show
    end
    
    def edit
    end
    
    def update
    end
    
    def destroy
    end
    
    
    private
    
    def product_params
        params.require(:product).permit(:image_id, :title, :description, :price, :sell_status, :product_cate)
    end
    
end
