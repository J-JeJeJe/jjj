class Public::CartItemsController < ApplicationController


  def create
       @cart_item = CartItem.new(cart_item_params)


    # カート内に同じ商品が入っている場合
      if @cart_item = current_customer.cart_items.find_by(params[:product_id])
       @cart_item.quantity += params[:cart_item][:quantity].to_i
      end

       @cart_item.save
       redirect_to cart_items_path
  end

  def index
    # @cart_items = CartItem.where(customer.id = current_customer.id)

     @cart_items = current_customer.cart_items
  end

  def update
    cart_item = CartItem.find(params[:id])
    cart_item.update(quantity: params[:quantity].to_i)
    redirect_to cart_items_path
  end

  def destroy
    @cart_item.destroy
    redirect_to cart_items_path
  end

  def all_destroy
    @cart_items = current_customer.cart_items
    @cart_items.destroy_all
    redirect_to cart_items_path
  end


  private
  def cart_item_params
    params.require(:cart_item).permit(:quantity, :product_id)
  end
end
