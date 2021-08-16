class Public::OrdersController < ApplicationController
  
  def new
    @order = Order.new
    @shipping_addresses = ShippingAddress.where(public_id: current_member)
  end

  def confirm
  end

  def create
  end

  def thanx
  end

  def index
  end

  def show
  end
end
