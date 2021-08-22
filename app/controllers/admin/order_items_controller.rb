class Admin::OrderItemsController < ApplicationController
  before_action :authenticate_admin!

  def update
    @order_item = OrderItem.find(params[:id])
    if @order_item.update(order_item_params)
      @order = Order.find(params[:id])
      redirect_back(fallback_location: admin_order_path(@order))
    end
  end

  private
  def order_item_params
    params.require(:order_item).permit(:work_status)
  end
end
