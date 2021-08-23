class Public::ShippingAddressesController < ApplicationController
    before_action :authenticate_customer!
    
    def index
        @shipping_address = ShippingAddress.new
        @shipping_addresses = current_customer.shipping_addresses
    end
    
    def create
        @shipping_address =ShippingAddress.new(shipping_address_params)
        @shipping_address.customer_id = current_customer.id
        if @shipping_address.save
           redirect_to shipping_addresses_path, notice: "配送先を追加しました"
        else
          @shipping_address = ShippingAddress.new
          @shipping_addresses = current_customer.shipping_addresses
          flash[:error] = "配送先の登録に失敗しました"
          render :index
        end
    end
    
    def destroy
        @shipping_address = ShippingAddress.find(params[:id])
        @shipping_address.destroy
        redirect_back(fallback_location: shipping_addresses_path)
    end
    
    def edit
        @shipping_address = ShippingAddress.find(params[:id])
    end
    
    def update
         shipping_address = ShippingAddress.find(params[:id])
         shipping_address.update(shipping_address_params)
         redirect_to shipping_addresses_path
    end


    private
    
    def shipping_address_params
    params.require(:shipping_address).permit(:postal_code, :address, :name, :customer_id)
    end

    
end
