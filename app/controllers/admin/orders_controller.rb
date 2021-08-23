class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!

  def show
    @order = Order.find(params[:id])
    @order_items = OrderItem.where(order_id: params[:id])

  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    if @order.status == "入金確認"
      @order.order_items.update(work_status: 1) 
      redirect_to  admin_order_path(@order)
    else
      redirect_to  admin_order_path(@order)
    end
  end

  private
  def order_params
    params.require(:order).permit(:status)
  end


end
