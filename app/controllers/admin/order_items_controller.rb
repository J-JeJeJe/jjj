class Admin::OrderItemsController < ApplicationController
  before_action :authenticate_admin!

  def update
    @order_item = OrderItem.find(params[:id])
    @order_item.update(order_item_params)
    @order = @order_item.order


    if  @order_item.work_status == "制作完了"
      if @order.order_items.count == @order.order_items.where(work_status: "制作完了").count
        pp @order.order_items.count
        pp @order.order_items.where(work_status: "制作完了").count
        @order_item.order.update(status:3)
      end
        redirect_to  admin_order_path(@order_item.order)
    else
      redirect_to  admin_order_path(@order_item.order)
    end
  end

  private
  def order_item_params
    params.require(:order_item).permit(:work_status)
  end
end
