class Public::CartItemsController < ApplicationController
  
  
  def create
    cart_item = CartItem.new(cart_item_params)
    cart_item.save
    redirect_to products_path
  end
  
  
  private
  def cart_item_params
    params.require(:cart_item).permit(:quantity)
  end
end
