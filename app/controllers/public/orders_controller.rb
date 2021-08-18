class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
    @shipping_addresses = ShippingAddress.where(member_id: current_customer)
  end

  def confirm
    @order = Order.new(params[:address])
    @cart_items = CartItem.where(menber_id: current_customer)
    #addressで場合分け
    if @order.address == "0"
      @order.name = current_customer.last_name + current_customer.first_name
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
    elsif @order.address == "1"
      @shipping_address = ShippingAddress.where(order_id)
      @order.name = @shipping_address.name
      @order.postal_code = @shipping_address.name.postal_code
      @order.address = @shipping_address.address
    elsif @order.address == "2"
      @order.name = params[:order][:name]
      @order.postal_code = params[:order][:postal_code]
      @order.address = params[:address][:address]
    end
  end

  def create
    @order = Order.new(order_params)
    @order.menber_id = current_customer
    @order.save
    redirect_to orders_thanx_path
  end

  def thanx
  end

  def index
  end

  def show
  end

  private

  def order_params
    params.require(:order).permit(:name, :postal_code, :address, :payment_method, :total_price)
  end

  def shipping_params
    params.require(:shipping_address).permit(:menber_id, :name, :postal_code, :address)
  end
end
