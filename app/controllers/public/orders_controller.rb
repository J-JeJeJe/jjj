class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
    @shipping_addresses = ShippingAddress.where(member_id: current_customer)
  end

  def confirm
    @order = Order.new(order_params)
    @cart_items = CartItem.where(menber_id: current_customer)
    #必要
    #addressが0、1、2で場合分け
    if @order.address == 0
    #@order.name =
    #@order.postal_code =
    #@order.address = 
    elsif @order.address == 1
    elsif @order.address == 2
    end
  end

  def create
  end

  def thanx
  end

  def index
  end

  def show
  end
  
  private
  
  def order_params
    params.require(:order).permit(:postal_code, :address, :payment_method)
  end
end
