class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!

  def new
    @order = Order.new
    @shipping_addresses = ShippingAddress.where(customer_id: current_customer)
  end

  def confirm
      @order = Order.new(order_params)
      @cart_items = CartItem.where(customer_id: current_customer)
      @total = @cart_items.inject(0) { |sum, product| sum + product.sub_total }
      @order.amount = @total + @order.postage
      #address_statusで場合分け
      #0の時customerの住所
      if params[:order][:address_status] == "0"
        @order.name = current_customer.last_name + current_customer.first_name
        @order.postal_code = current_customer.postal_code
        @order.address = current_customer.address
      #1の時登録先の住所
      elsif params[:order][:address_status] == "1"
        if params[:order][:shipping_address_id].present?
          @shipping_address = ShippingAddress.find(params[:order][:shipping_address_id])
          @order.name = @shipping_address.name
          @order.postal_code = @shipping_address.postal_code
          @order.address = @shipping_address.address
        #バリデーションエラーがある場合
        else
          flash[:alert] = "お届け先を選んで下さい"
          redirect_to new_order_path and return
        end
      #2の時新規配送先
      elsif params[:order][:address_status] == "2"
        @order.name = params[:order][:name]
        @order.postal_code = params[:order][:postal_code]
        @order.address = params[:order][:address]
        @address_status = "2"
        #バリデーションエラーがある場合
        @order.valid?
          unless @order.valid_of_specified?(:name, :postal_code, :address)
            flash[:alert] = "お届け先を入力して下さい"
            redirect_to new_order_path and return
          end
      end
  end

  def create
    @order = Order.new(order_params)
    @order.save
    #新規配送先の場合配送先を保存する
    if params[:order][:address_status] ==  "2"
      @shipping_address = ShippingAddress.new(shipping_params)
      @shipping_address.save
    end
    redirect_to thanx_orders_path
    #注文商品データを作る
    @cart_items = current_customer.cart_items.all
    @cart_items.each do |cart_item|
      @order_items = @order.order_items.new
      @order_items.product_id = cart_item.product.id
      @order_items.quantity = cart_item.quantity
      @order_items.price = cart_item.add_tax_price
      @order_items.save
    end

    #注文後カート内を空にする
    current_customer.cart_items.destroy_all
  end

  def thanx
  end

  def index
    @orders = Order.where(customer_id: current_customer)
  end

  def show
    @order= Order.find(params[:id])
    @order_items = @order.order_items
  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :name, :postal_code, :address, :payment_method, :total_price, :amount)
  end

  def shipping_params
    params.require(:order).permit(:customer_id, :name, :postal_code, :address)
  end
end
