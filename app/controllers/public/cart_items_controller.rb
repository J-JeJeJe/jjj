class Public::CartItemsController < ApplicationController

  def create
     @cart_item = CartItem.new(cart_item_params)
     @cart_item.customer_id = current_customer.id
     @cart_items = current_customer.cart_items.all
    # カート内に既に同じ商品がある場合
     @cart_items.each do |cart_item|
      if cart_item.product_id == @cart_item.product_id
       new_quantity = cart_item.quantity + @cart_item.quantity
       cart_item.update_attribute(:quantity, new_quantity)
       @cart_item.delete
      end
     end
    
      @cart_item.save
    redirect_to cart_items_path,notice:"カートに商品が入りました"
  end
  
  def index
    @cart_items= current_customer.cart_items
    # カート内商品の合計額
    @total = @cart_items.inject(0) { |sum, product| sum + product.sub_tatal }
  end
  
  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(quantity: params[:cart_item][:quantity].to_i)
    redirect_back(fallback_location: cart_items_path)
  end
  
  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_back(fallback_location: cart_items_path)
  end
  
  def all_destroy
    @cart_items = current_customer.cart_items
    @cart_items.destroy_all
    redirect_back(fallback_location: cart_items_path)
  end
  
  
  private
  
  def cart_item_params
    params.require(:cart_item).permit(:quantity, :product_id, :customer_id, :image)
  end
end
