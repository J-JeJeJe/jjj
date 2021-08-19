class Admin::ProductsController < ApplicationController

    def new
        @product = Product.new
    end

    def create
        product = Product.new(product_params)
        product.save
        redirect_to admin_product_path(product.id)
    end

    def index
        @products = Product.all
        @products = Product.page(params[:page]).per(10)
    end

    def show
        @product = Product.find(params[:id])


    end

    def edit
        @product = Product.find(params[:id])
    end

    def update
        product = Product.find(params[:id])
        product.update(product_params)
        redirect_to admin_product_path(product)
    end


    private

    def product_params
        params.require(:product).permit(:image, :title, :description, :price, :sell_status, :product_cate)
    end

end
