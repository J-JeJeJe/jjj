class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
    @shipping_addresses = ShippingAddress.where(customer_id: current_customer)
  end

  def confirm
    @order = Order.new(order_params)
    @cart_items = CartItem.where(customer_id: current_customer)
    #address_statusで場合分け
    #0の時customerの住所
    if params[:order][:address_status] == "0"
      @order.name = current_customer.last_name + current_customer.first_name
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
    #1の時登録先の住所
    elsif params[:order][:address_status] == "1"
      @shipping_address = ShippingAddress.find(params[:order][:shipping_address_id])
      @order.name = @shipping_address.name
      @order.postal_code = @shipping_address.postal_code
      @order.address = @shipping_address.address
    #2の時新規住所
    elsif params[:order][:address_status] ==  "2"
      @order.name = params[:order][:name]
      @order.postal_code = params[:order][:postal_code]
      @order.address = params[:order][:address]
    end
  end

  def create
    @order = Order.new(order_params)
    @order.save
    redirect_to thanx_orders_path
  end

  def thanx
  end

  def index
    @orders =Order.all
  end

  def show
  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :name, :postal_code, :address, :payment_method, :total_price)
  end

  def shipping_params
    params.require(:shipping_address).permit(:customer_id, :name, :postal_code, :address)
  end
end
