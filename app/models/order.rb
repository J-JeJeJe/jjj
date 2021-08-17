class Order < ApplicationRecord
  
  enum order_status: { 入金待ち: 0, 入金確認: 1, 製作中: 2, 発送準備中: 3, 発送済み:4}
 
  #消費税を加えた金額
  def add_tax_price
    (product.price * 1.10).round
  end
  
  def sub_tatal
    add_tax_price * cart_item.quantity
    
  
  def total_price
		 sub_tatal + order.postage
	end
end
