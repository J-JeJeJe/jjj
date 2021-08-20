class Admin::OrdersController < ApplicationController

  def index
    @orders = Order.page(params[:page]).per(10)
  end

  def show
    @orders = Order.all
    @order = Order.find(params[:id])
  end

  def update
  end


end
