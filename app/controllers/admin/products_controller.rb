class Admin::ProductsController < ApplicationController
    before_action :authenticate_admin!

    def new
        @product = Product.new
    end

    def create
        @product = Product.new(product_params)
        if @product.save
        redirect_to admin_product_path(@product.id), notice: "商品を追加しました"
        else
        flash.now[:alert] = "商品の追加に失敗しました"
        render :new
        end
    end


    def index
        @products = Product.page(params[:page]).per(10)
    end

    def show
        @product = Product.find(params[:id])
    end

    def edit
        @product = Product.find(params[:id])
    end

    def update
        @product = Product.find(params[:id])
        if @product.update(product_params)
           redirect_to admin_product_path(@product.id), notice: "変更を保存しました"
        else
            flash.now[:alert] = "変更の保存に失敗しました"
            render :edit
        end
    end


    private

    def product_params
        params.require(:product).permit(:image, :title, :description, :price, :sell_status, :product_category_id)
    end

end
