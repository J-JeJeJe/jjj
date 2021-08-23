class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!


  def index
    @orders = Order.page(params[:page]).per(10)
  end

  def show
    @order = Order.find(params[:id])
    @order_items = OrderItem.where(order_id: params[:id])
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    flash[:notice] = "更新しました"
    redirect_back(fallback_location: admin_order_path(@order))
  end

  private
  def order_params
    params.require(:order).permit(:status)
  end


end
