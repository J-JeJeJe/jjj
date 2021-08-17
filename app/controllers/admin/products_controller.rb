class Admin::ProductsController < ApplicationController
<<<<<<< HEAD
    class Owner::ProductsController < ApplicationController
    
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
    
=======
>>>>>>> d48029b19a4ce7bdd9aa779c15a65950f31bf8e0
end
